using LARCA2.Business.Entities;
using LARCA2.Business.Services;
using LARCA2.Data;
using OpenPop.Mime;
using OpenPop.Pop3;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using LARCA2.Data.DatabaseModels;
using System.Globalization;

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
        public void EnviarPrimerosRemiders()
        {
            // General Reminders
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/FirstReminders.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA ALERT System";
            var to = "larca_mailing@yahoo.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", "Administrator");
            Send(subject, body, to, null);

            // Action Plans Reminders
            fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/ActionPlansFirstReminders.htm"), FileMode.Open);
            sr = new StreamReader(fs);
            subject = "LARCA ALERT System";
            to = "larca_mailing@yahoo.com";
            body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", "Administrator");
            Send(subject, body, to, null);
        }

        /// <summary>
        /// Metodo que se encarga de enviar los SEGUNDAS REMINDERS por email 
        /// </summary>
        public void EnviarSegundosRemiders()
        {
            // General Reminders
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/SecondReminders.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA ALERT System";
            var to = "larca_mailing@yahoo.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", "Administrator");
            Send(subject, body, to, null);

            // Action Plans Reminders
            fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/ActionPlansSecondReminders.htm"), FileMode.Open);
            sr = new StreamReader(fs);
            subject = "LARCA ALERT System";
            to = "larca_mailing@yahoo.com";
            body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[owner]", "Administrator");
            Send(subject, body, to, null);
        }

        /// <summary>
        /// Metodo que se encarga de enviar el archivo generado en LARCA NEWS
        /// </summary>
        /// <param name="filename"></param>
        public void EnviarReporte(string filename)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/SampleAlert.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA ALERT System";
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
            string subject = "LARCA ALERT System";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            Send(subject, body, to, null);
        }

        /// <summary>
        /// Metodo que se encarga de enviar alerta de nuevo ACTION PLAN
        /// </summary>
        /// <param name="filename"></param>
        public void EnviarAlertaNuevoActionPlan(string owner, string drpmal, string duedate, string actionplan)
        {
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/NewActionPlan.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA ALERT System";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            body = body.Replace("[owner]", owner);
            body = body.Replace("[drpmal]", drpmal);
            body = body.Replace("[duedate]", duedate);
            body = body.Replace("[actionplan]", actionplan);
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
            string subject = "LARCA ALERT System";
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
            var fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/AnalysisAvailable.htm"), FileMode.Open);
            var sr = new StreamReader(fs);
            string subject = "LARCA ALERT System";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[month]", DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture));
            Send(subject, body, to, null);
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
            string subject = "LARCA ALERT System";
            var to = "solano.a.1@pg.com";
            var body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[month]", DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture));
            Send(subject, body, to, null);

            // AVISA USER / 
            fs = new FileStream(HttpContext.Current.Server.MapPath("~/AlertTemplates/MassiveUploadErrorsUser.htm"), FileMode.Open);
            sr = new StreamReader(fs);
            subject = "LARCA ALERT System";
            to = "solano.a.1@pg.com";
            body = sr.ReadToEnd();
            sr.Close();
            fs.Close();
            body = body.Replace("[month]", DateTime.Now.ToString("MMMM", CultureInfo.InvariantCulture));
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
    }
}
