using LARCA2.Business.Entities;
using LARCA2.Business.Services;
using LARCA2.Data;
using OpenPop.Mime;
using OpenPop.Pop3;
using System;
using LARCA2.Business.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using LARCA2.Data.DatabaseModels;
using System.Globalization;
using System.Linq;
using System.Security.Principal;


namespace LARCA2.Business.Core
{
    /// <summary>
    /// Clase que se encarga del proceso general del Mailing de LARCA2
    /// </summary>
    public class MailingCore
    {

        private string ServerPop { get; set; }
        private string ServerSmtp { get; set; }
        private int Port { get; set; }
        private string UserName { get; set; }
        private string Password { get; set; }

        public MailingCore()
        {
            ServerPop = System.Configuration.ConfigurationManager.AppSettings["EmailPopServer"];
            ServerSmtp = System.Configuration.ConfigurationManager.AppSettings["EmailSmtpServer"];
            Port = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["EmailSmtpPort"]);
            UserName = System.Configuration.ConfigurationManager.AppSettings["EmailAddress"];
            Password = System.Configuration.ConfigurationManager.AppSettings["EmailPassword"];
        }

        /// <summary>
        /// Metodo que se encarga de leer todos los emails de la casilla suministrada por P&G, levantara solo los que pertenezcan a LARCA
        /// </summary>
        /// <returns></returns>
        public List<MasterRow> ProcesarEmails()
        {
            var list = new List<MasterRow>();
            const string subject = "XLS SAMPLE";
            const int port = 110;
            var attachments = new ApplicationDataBLL().TraerCantidadAdjuntos();

            var emailsService = new EmailsBLL();
            using (var client = new Pop3Client())
            {
                try
                {
                    // Conexion al servidor de emails
                    client.Connect(ServerPop, port, false);
                    client.Authenticate(UserName, Password);
                    int messageCount = client.GetMessageCount();
                    int tope = messageCount - 1000;
                    if (tope < 0)
                        tope = 0;
                    for (int i = messageCount; i > tope; i--)
                    {
                        try
                        {
                            Message message = client.GetMessage(i);
                            // Si el asunto es EL indicado (Capitalizando todo)
                            if (message.Headers.Subject.ToUpper() == subject.ToUpper())
                            {
                                // Si el email no se encuentra ya procesado en nuestra base
                                if (!emailsService.EmailExiste(message.Headers.MessageId))
                                {
                                    // Recorremos los adjuntos y los descargamos (en caso que sea la cantidad indicada)
                                    var adjuntos = message.FindAllAttachments();
                                    if (adjuntos.Count == attachments)
                                    {
                                        foreach (var adjunto in adjuntos)
                                        {
                                            // Si el adjunto contiene el MIME tipo Excel
                                            if (GetXmlMimes().Exists(s => s == adjunto.ContentType.MediaType))
                                            {
                                                // Generamos el archivo fisico y lo guardamos en un directorio
                                                var date = DateTime.Now.ToString("ddMMMyyy");
                                                var random = new Random().Next(0, 1000);
                                                string fileName = String.Format("{0}_MasterData_{1}.xlsx", date, random);
                                                string filePath = Path.Combine(HttpContext.Current.Server.MapPath("~/App_Data/"), fileName);
                                                var stream = new FileStream(filePath, FileMode.Create);
                                                var binaryStream = new BinaryWriter(stream);
                                                binaryStream.Write(adjunto.Body);
                                                stream.Close();
                                                binaryStream.Close();

                                                // Detectamos que tipo de proceso hay que aplicarle al archivo en base a su dia de la semana
                                                var email = new LARCA20_Emails();
                                                if (DateTime.Now.DayOfWeek == DayOfWeek.Tuesday)
                                                    email.processtype = (int)TipoProceso.Parcial;
                                                else
                                                    email.processtype = (int)TipoProceso.Total;

                                                // Completamos la info del email para guardar en la base
                                                email.MessageID = message.Headers.MessageId;
                                                email.date = message.Headers.DateSent;
                                                email.deleted = false;
                                                email.filename = fileName;

                                                // Enviamos a procesar el Excel descargado del email
                                                try
                                                {
                                                    list = new ExcelCore().ProcesarExcel(email.filename, (TipoProceso)email.processtype);
                                                    email.processed = true;
                                                    emailsService.Guardar(email);
                                                }
                                                catch
                                                {
                                                    list = new List<MasterRow>();
                                                    email.processed = false;
                                                    emailsService.Guardar(email);
                                                }

                                                break;
                                            }
                                        }
                                    }
                                    else
                                    {
                                        EnviarAlertaAdjuntos_Admin(message);
                                        // Enviar email que no esta la cantidad de adjuntos que corresponde
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            // Logggear Excepcion
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Logggear Excepcion
                }
                return list;
            }
        }

        /// <summary>
        /// Metodo que se encarga de enviar los PRIMEROS REMINDERS por email 
        /// </summary>
        public List<string> EnviarPrimerosRemiders()
        {
            // General Reminders

           /* LARCA2.Data.Services.SmoScopeDAL analisis = new LARCA2.Data.Services.SmoScopeDAL();
            //var lista_analisis = analisis.Todos();

            var lista_final_aux = analisis.Todos().OrderByDescending(z => z.SmoScopeID).ToList();
            var lista_final = lista_final_aux.ToList();
            lista_final.Clear();

            foreach (var item in lista_final_aux)
            {
                if (!lista_final.Exists(x => x.RefIdRC == item.RefIdRC && x.RefIdSMO == item.RefIdSMO && x.RefIdBU == item.RefIdBU && x.RefIdOwner == item.RefIdOwner))
                {
                    lista_final.Add(item);
                }
            }*/

            List<string> return_list = new List<string>();

            LARCA2.Business.Services.ApplicationDataBLL repo = new LARCA2.Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);


            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> result = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> result_test = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> result_aux_smo = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> result_aux_bu = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScopeDetail> lista_tops_level2 = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScopeDetail>();
            //result = result.Where(x => x.deleted == false && x.date >= siev).ToList();
            LARCA2.Business.Services.MasterDataBLL smo_list = new LARCA2.Business.Services.MasterDataBLL();
            LARCA2.Business.Services.MasterDataBLL bu_list = new LARCA2.Business.Services.MasterDataBLL();
            var toplvl3 = new LARCA2.Business.Services.ApplicationDataBLL().TraerTopLvl3();
            var toplvl2 = new LARCA2.Business.Services.ApplicationDataBLL().TraerTopLvl2();

            decimal volumen;
            decimal vol;

            LARCA2.Business.Services.SMOScopeBLL smoscopebll = new LARCA2.Business.Services.SMOScopeBLL();

            LARCA2.Data.Services.SmoScopeDAL SmoScopeDAL = new LARCA2.Data.Services.SmoScopeDAL();

            foreach (var smo_var in smo_list.Todos().Where(x => x.Data == "SMO").ToList())
            {
                result_aux_smo.AddRange(SmoScopeDAL.Todos().Where(x => x.date >= siev && x.RefIdSMO == smo_var.id && x.clone != true).ToList());
            }

            var result_aux_s = result_aux_smo.GroupBy(p => p.RefIdSMO).ToList();


            var tops_smo = smoscopebll.traer_tops_level2(1);

            foreach (var item in result_aux_s)
            {
                var result_aux = item.Where(i => i.RefIdSMO == item.Key).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                foreach (var subitem in result_aux)
                {

                    if (tops_smo.Exists(p => p.level == subitem.Key.ToString() && p.smo == item.Key))
                    {
                        volumen = tops_smo.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.smo == item.Key).volumen;



                        vol = 0;
                        int cant = 0;
                        foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                        {
                            cant++;
                            if (cant == 1)
                            {
                                result_test.Add(item_list);
                                vol = vol + Convert.ToDecimal(item_list.Volumen);
                            }

                            else
                            {
                                if ((vol * 100 / volumen <= 80))
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }
                            }
                        }
                        result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                        result_test.Clear();
                    }
                }
            }




            foreach (var bu_var in smo_list.Todos().Where(x => x.Data == "BU").ToList())
            {
                result_aux_bu.AddRange(SmoScopeDAL.Todos().Where(x => x.date >= siev && x.RefIdBU == bu_var.id && x.clone != true).ToList().ToList());
            }

            var result_aux_b = result_aux_bu.GroupBy(p => p.MasterBU.DataFin).ToList();


            var tops_bu = smoscopebll.traer_tops_level2(2);

            foreach (var item in result_aux_b)
            {
                var result_aux = item.Where(i => i.MasterBU.DataFin == item.Key.ToString()).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                foreach (var subitem in result_aux)
                {

                    if (tops_bu.Exists(p => p.level == subitem.Key.ToString() && p.bu == item.Key.ToString()))
                    {
                        //volumen = tops_bu.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.bu == item.Key.ToString()).volumen;
                        volumen = tops_bu.FirstOrDefault(t => t.level == subitem.Key.ToString() && t.bu == item.Key.ToString()).volumen;



                        vol = 0;
                        int cant = 0;
                        foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                        {
                            cant++;
                            if (cant == 1)
                            {
                                result_test.Add(item_list);
                                vol = vol + Convert.ToDecimal(item_list.Volumen);
                            }

                            else
                            {
                                if ((vol * 100 / volumen <= 80))
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }
                            }
                        }
                        result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                        result_test.Clear();
                    }
                }
            }


            var lista_analisis = result.ToList();
            lista_analisis.Clear();

            foreach (var item in result.ToList())
            {
                if (!lista_analisis.Exists(x => x.RefIdBU == item.RefIdBU && x.RefIdSMO == item.RefIdSMO && x.RefIdRC == item.RefIdRC))
                {
                    lista_analisis.Add(item);
                }
            }

            foreach (var item in lista_analisis)
            {
                                
                if ((item.Problem == "" || item.Problem == null) || (item.ActionPlan == "" || item.ActionPlan == null))
                {


                    LARCA2.Data.Services.UserOwnerDAL permisos = new LARCA2.Data.Services.UserOwnerDAL();
                    var permisos_lista2 = permisos.Todos().Where(x => x.IdOwner == item.RefIdOwner && x.IdSmo == item.RefIdSMO && x.IdBU == item.RefIdBU && x.deleted != true);

                    var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/FirstReminders.htm"), FileMode.Open);
                    var sr = new StreamReader(fs);
                    string subject = "LARCA - FIRST REMINDER - PENDING ANALYSIS";
                    var body = sr.ReadToEnd();
                    sr.Close();
                    fs.Close();

                    if (permisos_lista2.Count() > 0)
                    {
                        var to = permisos_lista2.First().LARCA20_Users.user_name + "@pg.com";
                        return_list.Add(permisos_lista2.First().LARCA20_Users.user_name + " - " + item.MasterBU.DataFin + " - " + item.MasterSMO.DataFin + " - " + item.MasterLvl.Description);  
                        body = body.Replace("[owner]", permisos_lista2.First().LARCA20_Users.user_name);
                        string texto = item.MasterBU.DataFin + " - " + item.MasterSMO.DataFin + " - " + item.MasterLvl.Description;
                        body = body.Replace("[action_plan]", texto);
                        Send(subject, body, to, null);
                    }

                }
            }

            return return_list;
        }

        /// <summary>
        /// Metodo que se encarga de enviar los SEGUNDAS REMINDERS por email 
        /// </summary>
        public void EnviarSegundosRemiders(string username, string manager, string actionplan)
        {
            // General Reminders
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/SecondReminders.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - SECOND REMINDER - PENDING ANALYSIS";
            var to = username + "@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", username);
            body = body.Replace("[action_plan]", actionplan);
           
            if (manager != null && manager != "")
            {
                manager = manager + "@pg.com";  
            }
            
            string cc = "";
            Send_CC(subject, body, to, null, cc, manager);

        }

        /// Metodo que se encarga de enviar el archivo generado en LARCA NEWS a direccion con datafin
        /// </summary>
        /// <param name="filename"></param>
        public void EnviarReporte(string filename, string dataFin)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/SampleAlert_2.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - NOTIFICATION";

            var body = sr.ReadToEnd();
            // var to = "solano.a.1@pg.com";
            string to = "";
            if (dataFin == "1")
            {
                subject = "LARCA News for " + "LA";
                to = "CNF-LARCA-" + "LA" + "@pg.com";
                body = body.Replace("[object]", "LA");
            }
            else
            {
                subject = "LARCA News for " + dataFin;
                to = "CNF-LARCA-" + (string.IsNullOrEmpty(dataFin) ? "" : dataFin) + "@pg.com";
                body = body.Replace("[object]", dataFin);
            }
            
            
            sr.Close();
            fs.Close();
            body = body.Replace("[NotificationMessage]", "LARCA2 Analysis Available and Attached");
            

            var attachments = new List<Attachment>();
            var attachment = new Attachment(filename);
            var random = new Random().Next(0, 10000);
            attachment.Name = "LARCANewsReport_" + random + ".xlsx";
            attachments.Add(attachment);

            Send(subject, body, to, attachments);
        }

        /// <summary>
        /// Metodo que se encarga de enviar el archivo generado en LARCA NEWS
        /// </summary>
        /// <param name="filename"></param>
        public void EnviarReporte(string filename)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/SampleAlert.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - NOTIFICATION";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[NotificationMessage]", "LARCA2 Analysis Available and Attached");

            var attachments = new List<Attachment>();
            var attachment = new Attachment(filename);
            var random = new Random().Next(0, 10000);
            attachment.Name = "LARCANewsReport_" + random + ".xlsx";
            attachments.Add(attachment);

            Send(subject, body, to, attachments);
        }

        /// <summary>
        /// Metodo que se encarga de enviar alerta de nuevo dato agregado a la MASTER DATA
        /// </summary>
        /// <param name="filename"></param>
        public void EnviarAlertaNuevoMasterData(string tipo, string data, string id)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/NewMasterData.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - NEW CLASSIFICATION - ACTION NEEDED";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            Send(subject, body, to, null);
        }

        /// <summary>
        /// Metodo que se encarga de elnviar alerta de nuevo ACTION PLAN
        /// </summary>
        /// <param name="filename"></param>
        public void EnviarAlertaNuevoActionPlan(string owner, string drpmal, string duedate, string actionplan, string user)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/NewActionPlan.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - NEW ACTION PLAN";
            //var to = user + "@pg.com";
            var to = "eduardo.scattinni.external@atos.net";
            var body = sr.ReadToEnd();
          //  body = body.Replace("[owner]", owner);
          //  body = body.Replace("[drpmal]", drpmal);
          //  body = body.Replace("[duedate]", duedate);
          //  body = body.Replace("[actionplan]", actionplan);
          //  body = body + user;
            sr.Close();
            fs.Close();
            Send(subject, body, to, null);
        }

        /// <summary>
        /// Metodo que se encarga de enviar el alerta de que durante el proceso automatico, faltaron adjuntos
        /// </summary>
        /// <param name="message"></param>
        public void EnviarAlertaAdjuntos_Admin(Message message)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/SampleAlert.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - NOTIFICATION";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[NotificationMessage]", String.Format("Email sent [{0}], with subject [{1}], do not have the quantity of attached files required for LARCA2 to process.", message.Headers.DateSent, message.Headers.Subject));
            body = body.Replace("[User]", "Juan Perez");
            Send(subject, body, to, null);
        }

        /// <summary>
        /// Metodo que se encarga de enviar el OK, cuando se proceso bien el email de manera automatica
        /// </summary>
        /// <param name="message"></param>
        public void EnviarAlertaAnalysisDisponible_Admin()
        {
            // FOREACH DE USUARIOS

            LARCA2.Business.Services.UsuariosBLL users = new LARCA2.Business.Services.UsuariosBLL();
            var usuarios = users.Todos().ToList();

            foreach (var item in usuarios.Where(x => x.deleted != true))
            {
                try
                {
                               var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/AnalysisAvailable.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - UPDATE NOTIFICATION";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            to = item.user_name + "@pg.com";
            sr.Close();
            fs.Close();
            DateTime thisDay = DateTime.Today;
            if (thisDay.Day < 8)
            {
                var mes = thisDay.Month;
                mes = mes - 1;

                DateTimeFormatInfo formatoFecha = CultureInfo.CurrentCulture.DateTimeFormat;
                string nombreMes = formatoFecha.GetMonthName(mes); 

                body = body.Replace("[month]", nombreMes);
            }
            else
            {
                body = body.Replace("[month]", DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture));
            }
            
            Send(subject, body, to, null);

                }
                catch (Exception)
                {
                }
            }
        }

        /// <summary>
        /// Metodo que se encarga de enviar el Error al momento de procesar Excel
        /// </summary>
        /// <param name="message"></param>
        public void EnviarAlertaErrorEnCarga()
        {
            // AVISA ADMINISTRADOR / 
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/MassiveUploadErrorsAdmin.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - UPDATE ERROR - ACTION NEEDED";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[month]", DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture));
            Send(subject, body, to, null);

            // AVISA USER / 
            fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/MassiveUploadErrorsUser.htm"), FileMode.Open);
            sr = new StreamReader(fs);
            subject = "LARCA - UPDATE DELAY";
            to = "solano.a.1@pg.com";
            body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[month]", DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture));
            Send(subject, body, to, null);
        }

        public void Vencimiento_due_date_escalation(string username, string duedate, string actionplan, string cc, string manager)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/ActionPlansSecondReminders.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - SECOND REMINDER - ACTION PLANS";
            var to = username + "@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", username);
            string string_action = duedate;
            if (duedate.Count() > 0)
            {
                string_action = actionplan + " - " + string_action.Substring(0, 10);
            }
            body = body.Replace("[action_plan]", string_action);

            if (cc != "")
            {
                Send_CC(subject, body, to, null, cc, manager);
            }
            else
            {
                Send_CC(subject, body, to, null,cc,manager);
            }
        }

        public void Vencimiento_due_date()
        {
            LARCA2.Data.Services.SmoScopeDAL analisis = new LARCA2.Data.Services.SmoScopeDAL();
            


            var lista_final_aux = analisis.BruteTodos().OrderByDescending(z => z.SmoScopeID).ToList();
            var lista_final = lista_final_aux.ToList();
            lista_final.Clear();

            foreach (var item in lista_final_aux)
            {
                if (!lista_final.Exists(x => x.RefIdRC == item.RefIdRC && x.RefIdSMO == item.RefIdSMO && x.RefIdBU == item.RefIdBU && x.RefIdOwner == item.RefIdOwner && x.ActionPlan == item.ActionPlan && x.RefIdResponsable == item.RefIdResponsable))
                {
                    lista_final.Add(item);
                }
            }


            var lista_analisis = lista_final.ToList();
            foreach (var item in lista_analisis)
            {

                if (item.DueDate != null)
                {
                    
                
                if (DateTime.Compare(DateTime.Parse(item.DueDate.ToString()), DateTime.Today) < 0  && item.O_C != "C")
                {
                    
                

            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/ActionPlansFirstReminders.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - FIRST REMINDER - ACTION PLANS";
            var to = item.ResponsableSmo.Responsable_user.user_name + "@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", item.ResponsableSmo.Responsable_user.user_name);
            string string_action = item.DueDate.ToString();
            if (item.DueDate.ToString().Count() > 0)
            {
             string_action = item.ActionPlan + " - " + string_action.Substring(0, 10);
            }
            body = body.Replace("[action_plan]", string_action);
            Send(subject, body, to, null);
                }
                }
        }
        }

        public void EnviarAsignacion_action_plan(string owner, string duedate,string actionplan, string user, string drpmal)
        {
            // General Reminders
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/NewActionPlan.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA - NEW ACTION PLAN";
            var to = user + "@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", user);
            body = body.Replace("[duedate]", duedate);
            body = body.Replace("[actionplan]", actionplan);
            body = body.Replace("[drpmal]", drpmal);

            Send(subject, body, to, null);

        }

        
        /// <summary>
        /// Metodo que retorna todos los MIMES existentes para un Excel
        /// </summary>
        /// <returns></returns>
        public List<string> GetXmlMimes()
        {
            var list = new List<string>();
            list.Add("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            list.Add("application/vnd.ms-excel");
            list.Add("application/msexcel");
            list.Add("application/x-msexcel");
            list.Add("application/x-ms-excel");
            list.Add("application/x-excel");
            list.Add("application/x-dos_ms_excel");
            list.Add("application/xls");
            list.Add("application/x-xls");
            list.Add("application/x-download");
            return list;
        }

        public void test()
        {
            Send("test", "test", "larca.im@pg.com", new List<Attachment>());
        }

        /// <summary>
        /// Metodo que realiza el envio de un email
        /// </summary>
        /// <param name="subject">asunto del email</param>
        /// <param name="body">cuerpo del email</param>
        /// <param name="to">destino del email</param>
        /// <param name="attachments">adjuntos del email</param>
        public void Send(string subject, string body, string to, List<Attachment> attachments)
        {
            //Mail al Usuario
            var msg = new MailMessage();
            msg.To.Add(to);
            msg.From = new MailAddress("larca.im@pg.com", "LARCA", Encoding.UTF8);
            msg.Subject = subject;
            msg.SubjectEncoding = Encoding.UTF8;
            msg.Body = body;
            msg.BodyEncoding = Encoding.UTF8;
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;

            if (attachments != null)
                foreach (var attachment in attachments)
                {
                    msg.Attachments.Add(attachment);

                }
            using (SmtpClient smtp = new SmtpClient(ServerSmtp, Port))
            {
                smtp.Credentials = new NetworkCredential(UserName, Password);
                smtp.EnableSsl = false;
                try
                {
                    smtp.Send(msg);
                }
                catch
                {

                }
            }
        }

        public void Send_CC(string subject, string body, string to, List<Attachment> attachments, string cc, string manager)
        {
            //Mail al Usuario
            var msg = new MailMessage();
            msg.To.Add(to);
            msg.From = new MailAddress("larca.im@pg.com", "LARCA", Encoding.UTF8);
            msg.Subject = subject;
            msg.SubjectEncoding = Encoding.UTF8;
            msg.Body = body;
            if (cc.Count()>0)
            {
            msg.CC.Add(cc);    
            }

            if (manager.Count() > 0)
            {
                msg.CC.Add(manager);
            }
            msg.BodyEncoding = Encoding.UTF8;
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;

            if (attachments != null)
                foreach (var attachment in attachments)
                {
                    msg.Attachments.Add(attachment);

                }
            using (SmtpClient smtp = new SmtpClient(ServerSmtp, Port))
            {
                smtp.Credentials = new NetworkCredential(UserName, Password);
                smtp.EnableSsl = false;
                try
                {
                    smtp.Send(msg);
                }
                catch
                {

                }
            }
        }
    }
}
