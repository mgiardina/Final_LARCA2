using LARCA2.Business.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.DirectoryServices;
using System.DirectoryServices.ActiveDirectory;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace Larca2.WebService
{
    /// <summary>
    /// Summary description for LARCAJobs
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class LARCAJobs : System.Web.Services.WebService
    {

        /// <summary>
        /// WebMethod ProcesarEmails
        /// </summary>
        /// 
        [WebMethod]
        public void ProcesarEmails()
        {
            new MailingCore().ProcesarEmails();
        }

        [WebMethod]
        public List<string> EnviarPrimerosRemiders()
        {
           var return_list = new MailingCore().EnviarPrimerosRemiders();
            return return_list;
        }

        [WebMethod]
        public List<string> EnviarSegundosRemiders()
        {

/*            LARCA2.Data.Services.SmoScopeDAL analisis = new LARCA2.Data.Services.SmoScopeDAL();
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


            //LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)HttpContext.Current.Session["Usuario"];


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
                if (!lista_analisis.Exists(x=> x.RefIdBU == item.RefIdBU && x.RefIdSMO == item.RefIdSMO && x.RefIdRC == item.RefIdRC))
                {
                    lista_analisis.Add(item);
                }    
            }

            
            string username = "";
            List<string> return_list = new List<string>();

            foreach (var item in lista_analisis)
            {
                username = "";
                if ((item.Problem == "" || item.Problem == null) || (item.ActionPlan == "" || item.ActionPlan == null))
                {

                    LARCA2.Data.Services.UserOwnerDAL permisos = new LARCA2.Data.Services.UserOwnerDAL();
                    var permisos_lista2 = permisos.Todos().Where(x => x.IdOwner == item.RefIdOwner && x.IdSmo == item.RefIdSMO && x.IdBU == item.RefIdBU && x.deleted != true);

                    if (permisos_lista2.Count() > 0)
                    {
                        username = permisos_lista2.First().LARCA20_Users.user_name;
                    }
                    else
                    {
                        username = "";
                    }

                    if (username != "" && username != null)
                        {
                    var lista = new List<string>();
                    string manager = "";
                    using (var forest = Forest.GetCurrentForest())
                    {
                        foreach (Domain domain in forest.Domains)
                        {
                            var userdomain = domain.Name.Split(Convert.ToChar("."))[0].ToUpper();

                            List<string> gruposEncontrados = new List<string>();
                            // Creamos un objeto DirectoryEntry para conectarnos al directorio activo
                            DirectoryEntry adsRoot = new DirectoryEntry("LDAP://" + userdomain);
                            // Creamos un objeto DirectorySearcher para hacer una búsqueda en el directorio activo
                            DirectorySearcher adsSearch = new DirectorySearcher(adsRoot);
                            adsSearch.PropertiesToLoad.Add("manager");

                            // Ponemos como filtro que busque el usuario actual
                            adsSearch.Filter = "samAccountName=" + username;

                            SearchResult oResult;
                            // Extraemos la primera coincidencia
                            oResult = adsSearch.FindOne();

                            if (oResult != null)
                            {
                                manager = oResult.Properties["manager"][0].ToString();
                                string[] words = manager.Split(',');
                                manager = words[0];
                                string[] words2 = manager.Split('=');
                                if (words2[1] != null && words2[1] != "")
                                {
                                    manager = words2[1];    
                               }
                                return_list.Add(manager + " - " + username + " - " + item.MasterBU.DataFin + " - " + item.MasterSMO.DataFin + " - " + item.MasterLvl.Description);
                            }

                            
                        }
                    }
                    string action = item.MasterBU.DataFin + " - " + item.MasterSMO.DataFin + " - " + item.MasterLvl.Description;
                    if (username != null && username != "")
                    {
                        new MailingCore().EnviarSegundosRemiders(username, manager, action);    
                    }
                    
                        }
                }
            }
            return return_list;
        }
        
        [WebMethod]
        public void EnviarAsignacion_action_plan(string owner)
        {
           // new MailingCore().EnviarAsignacion_action_plan(owner);
        }

        [WebMethod]
        public void Vencimiento_due_date()
        {
            new MailingCore().Vencimiento_due_date();
        }

        [WebMethod]
        public void Vencimiento_due_date_escalation()
        {
            //new MailingCore().Vencimiento_due_date_escalation();

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


                    if (DateTime.Compare(DateTime.Parse(item.DueDate.ToString()), DateTime.Today) < 0 && item.O_C != "C")
                    {


                        LARCA2.Data.Services.UserOwnerDAL permisos = new LARCA2.Data.Services.UserOwnerDAL();
                        var permisos_lista2 = permisos.Todos().Where(x => x.IdOwner == item.RefIdOwner && x.IdSmo == item.RefIdSMO && x.IdBU == item.RefIdBU && x.deleted != true);
                        string cc = "";
                        if (permisos_lista2.Count() > 0)
                        {
                            cc = permisos_lista2.First().LARCA20_Users.user_name + "@pg.com";    
                        }

                        var lista = new List<string>();
                        string manager = "";
                        string username = item.ResponsableSmo.Responsable_user.user_name;
                        using (var forest = Forest.GetCurrentForest())
                        {
                            foreach (Domain domain in forest.Domains)
                            {
                                var userdomain = domain.Name.Split(Convert.ToChar("."))[0].ToUpper();

                                List<string> gruposEncontrados = new List<string>();
                                // Creamos un objeto DirectoryEntry para conectarnos al directorio activo
                                DirectoryEntry adsRoot = new DirectoryEntry("LDAP://" + userdomain);
                                // Creamos un objeto DirectorySearcher para hacer una búsqueda en el directorio activo
                                DirectorySearcher adsSearch = new DirectorySearcher(adsRoot);
                                adsSearch.PropertiesToLoad.Add("manager");

                                // Ponemos como filtro que busque el usuario actual
                                adsSearch.Filter = "samAccountName=" + username;

                                SearchResult oResult;
                                // Extraemos la primera coincidencia
                                oResult = adsSearch.FindOne();

                                if (oResult != null)
                                {
                                    manager = oResult.Properties["manager"][0].ToString();
                                    string[] words = manager.Split(',');
                                    manager = words[0];
                                    string[] words2 = manager.Split('=');
                                    manager = words2[1] + "@pg.com";
                                }
                            }
                        }

                        string duedate = item.DueDate.ToString();
                        string actionplan = item.ActionPlan;
                        new MailingCore().Vencimiento_due_date_escalation(username, duedate, actionplan, cc, manager);                        
                    }
                }
        }
        }

        [WebMethod]
        public string buscar_jefe()
        {
            var lista = new List<string>();
            string manager = "No encuentro nada";
            string username = "solano.a.1";
            using (var forest = Forest.GetCurrentForest())
            {
                foreach (Domain domain in forest.Domains)
                {
                    var userdomain = domain.Name.Split(Convert.ToChar("."))[0].ToUpper();

                    List<string> gruposEncontrados = new List<string>();
                    // Creamos un objeto DirectoryEntry para conectarnos al directorio activo
                    DirectoryEntry adsRoot = new DirectoryEntry("LDAP://" + userdomain);
                    // Creamos un objeto DirectorySearcher para hacer una búsqueda en el directorio activo
                    DirectorySearcher adsSearch = new DirectorySearcher(adsRoot);
                    adsSearch.PropertiesToLoad.Add("manager");

                    // Ponemos como filtro que busque el usuario actual
                    adsSearch.Filter = "samAccountName=" + username;

                    SearchResult oResult;
                    // Extraemos la primera coincidencia
                    oResult = adsSearch.FindOne();
                    
                    if (oResult != null)
                    {
                        manager = oResult.Properties["manager"][0].ToString();

                        string[] words = manager.Split(',');
                        manager = words[0];
                        string[] words2 = manager.Split('=');
                        manager = words2[1];
                        return manager;
                    }
                }
            }
            return "manager";
        }
    }
}
