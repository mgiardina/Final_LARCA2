﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Larca2.Controllers
{
    public class SmoController : Controller
    {
        public ActionResult SmoSimple()
        {
            ViewBag.Message = "";


            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Usuarios user = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.IdRenglon);


            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
            viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función de:
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.

            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
            viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
            {
                smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                if (smoscopeact != null)
                {
                    viewModel.RegistrosSMO.AddRange(smoscopeact);
                }
            }
            viewModel.selectedItems = new List<bool>();

            return View("SmoSimple", viewModel);

        }



        public ActionResult SmoSimpleFiltrado(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            ViewBag.Message = "";

            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();


            LARCA2.Data.DatabaseModels.LARCA20_Usuarios user = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.IdRenglon);

            viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
            viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
            {
                smoscopeact = repo.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                if (smoscopeact != null)
                {
                    viewModel.RegistrosSMO.AddRange(smoscopeact);
                }
            }



            List<LARCA2.Data.DatabaseModels.LARCA20_Usuarios> listaDeUsuarios = repoUsuarios.Todos();

       
            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();


            
              viewModel.selectedItems = new List<bool>();
            return View("SmoSimple", viewModel);

        }



        public ActionResult SmoSimpleAgrupar(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            ViewBag.Message = "";
            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();

            LARCA2.Data.DatabaseModels.LARCA20_Usuarios user = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.IdRenglon);

            viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;

            int seleccionados = 0;
            if(viewModel.selectedItems != null)
                seleccionados = viewModel.selectedItems.Where(x => x.ToString() == "True").ToList().Count;
            if (seleccionados > 1)
            {
                bool puedeAgruparse = true;



                int countitemcer = 0;
                foreach (bool bcer in viewModel.selectedItems)
                {
                    if (bcer == true)
                        break;
                    countitemcer++;
                }

                //por cada seleccionado true excepto el primero
                for (int i = 1; i < seleccionados; i++)
                {

                    //desde aca incluyendo el primer for obtiene el index en la lista de registros
                    int countbool = i + 1;
                    int countitem = 0;
                    foreach (bool b in viewModel.selectedItems)
                    {
                        if (b == true)
                            countbool--;
                        if (countbool == 0)
                            break;
                        countitem++;
                    }



                    if (!(LARCA2.Business.Services.SMOScopeBLL.esAgrupable(repo.Traer(viewModel.RegistrosSMO[countitemcer].SmoScopeID), repo.Traer(viewModel.RegistrosSMO[countitem].SmoScopeID))))
                    {
                        puedeAgruparse = false;
                        break;
                    }
                }
                if (puedeAgruparse == true)
                {
                    LARCA2.Data.DatabaseModels.LARCA20_SmoScope smoAgrup = repo.Traer(viewModel.RegistrosSMO[countitemcer].SmoScopeID);
                    LARCA2.Data.DatabaseModels.LARCA20_SmoScope smoAgrup2;
                    for (int i = 1; i < seleccionados; i++)
                    {
                        smoAgrup = repo.Traer(viewModel.RegistrosSMO[countitemcer].SmoScopeID);
                        //desde aca incluyendo el primer for obtiene el index en la lista de registros
                        int countbool = i + 1;
                        int countitem = 0;

                        foreach (bool b in viewModel.selectedItems)
                        {
                            if (b == true)
                                countbool--;
                            if (countbool == 0)
                                break;
                            countitem++;
                        }


                        smoAgrup2 = repo.Traer(viewModel.RegistrosSMO[countitem].SmoScopeID);

                        smoAgrup.ActionPlan = smoAgrup.ActionPlan + (smoAgrup.ActionPlan != null && smoAgrup2.ActionPlan != null ? "-" : "") + smoAgrup2.ActionPlan;
                        smoAgrup.Why1 = smoAgrup.Why1 + (smoAgrup.Why1 != null && smoAgrup2.Why1 != null? "-" : "") + smoAgrup2.Why1;
                        smoAgrup.Why2 = smoAgrup.Why2 + (smoAgrup.Why2 != null && smoAgrup2.Why2 != null? "-" : "") + smoAgrup2.Why2;
                        smoAgrup.Why3 = smoAgrup.Why3 + (smoAgrup.Why3 != null && smoAgrup2.Why3 != null? "-" : "") + smoAgrup2.Why3;
                        smoAgrup.Problem = smoAgrup.Problem + (smoAgrup.Problem != null && smoAgrup2.Problem != null ? "-" : "") + smoAgrup2.Problem;                     
                        smoAgrup.DueDate = (smoAgrup.DueDate < smoAgrup2.DueDate ? smoAgrup.DueDate : smoAgrup2.DueDate);
                        smoAgrup.Volumen = smoAgrup.Volumen + smoAgrup2.Volumen;
                        if (smoAgrup.RefIdResponsable == null)
                            smoAgrup.RefIdResponsable = smoAgrup2.RefIdResponsable;
                        else
                            smoAgrup.RefIdResponsable = smoAgrup.RefIdResponsable;

                        repo.Guardar(smoAgrup);
                        repo.Eliminar(smoAgrup2.SmoScopeID);

                    }

                }
                else
                {
                    //no pudo agrupar
                }
            }
            viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
            {
                smoscopeact = repo.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                if (smoscopeact != null)
                {
                    viewModel.RegistrosSMO.AddRange(smoscopeact);
                }
            }



            List<LARCA2.Data.DatabaseModels.LARCA20_Usuarios> listaDeUsuarios = repoUsuarios.Todos();


            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();

            viewModel.selectedItems = new List<bool>();

            return View("SmoSimple", viewModel);

        }



        [HttpGet]
        public JsonResult MostrarDetalle(string id)
        {
            int newId = Int32.Parse(id);
            LARCA2.Business.Services.SMOScopeDetailBLL dbl = new LARCA2.Business.Services.SMOScopeDetailBLL();
            LARCA2.Business.Services.MasterDataBLL mbl = new LARCA2.Business.Services.MasterDataBLL();
            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScopeDetail> details = dbl.TraerDetalle(newId);
            string result;
            result = "<!DOCTYPE html><html lang='en'><head><meta charset='utf-8' /><title> SMO Scope Detail- LARCA 2</title><link href='~/favicon.ico' rel='shortcut icon' type='image/x-icon' /><meta name='viewport' content='width=device-width' /><style>html {background-color: #e2e2e2;margin: 0;padding: 0;}body {background-color: #fff;border-top: solid 10px #000;color: #333;font-size: .85em;font-family: 'Segoe UI', Verdana, Helvetica, Sans-Serif;margin: 0;padding: 0;}table {border-collapse: collapse;border-spacing: 0;margin-top: 0.75em;border: 0 none;}th {font-size: 11px;text-align: left;border: 1px solid #e2e2e2;text-transform:uppercase;background-color:#199ED8;color:#FFFFFF;padding:5px;}th a {display: block;position: relative;}td {text-align: left;border: 1px solid #e2e2e2;font-size:11px;background-color:#FFFFFF;padding:5px;}tr.pager td {padding: 0 0.25em 0 0;}</style></head><body>";

            //result = result + "<table class='table'><tr><th width='5%' align='center'>Date</th><th width='5%' align='center'>SMO</th><th width='5%' align='center'>BU</th><th width='5%' align='center'>Volume</th><th width='5%' align='center'>OWNER</th><th width='5%' align='center'>Level2</th><th width='5%' align='center'>Level3</th><th width='5%' align='center'>Reason</th></tr>";
            result = result + "<table class='table'><tr><th width='20%' align='center'>Volume</th><th width='25%' align='center'>FPC</th><th width='25%' align='center'>Reason Code</th><th width='15%' align='center'>Customer</th><th width='15%' align='center'>Date</th></tr>";

            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScopeDetail det in details)
            {
                result = result + "<tr><td>" + det.Volumen.ToString() + "</td>";
                result = result + "<td>" + mbl.Traer("BU", Int32.Parse(det.BuID.ToString())).DataIni + "</td>";
                result = result + "<td>" + mbl.Traer("REASON", Int32.Parse(det.ReasonID.ToString())).DataIni + "</td>";
                result = result + "<td>" + (det.Customer == null ? "-" : det.Customer.ToString()) + "</td>";
                result = result + "<td>" + det.Fecha.ToString() + "</td></tr>";

                //  result = result + "<tr><td>" + det.Fecha.ToString() + "</td>";
                // result = result + "<td>" + mbl.Traer("SMO", Int32.Parse(det.SmoID.ToString())).DataIni + "</td>";
                // result = result + "<td>" + mbl.Traer("BU", Int32.Parse(det.BuID.ToString())).DataIni + "</td>";
                // result = result + "<td>" + det.Volumen.ToString() + "</td>";
                // result = result + "<td>" + mbl.Traer(det.OwnerID.Value).DataIni + "</td>";
                // result = result + "<td>" + mbl.Traer(det.Lvl2ID.Value).DataIni + "</td>";
                // result = result + "<td>" + mbl.Traer(det.Lvl3ID.Value).DataIni + "</td>";

                // result = result + "<td>" + mbl.Traer("REASON", Int32.Parse(det.ReasonID.ToString())).DataIni + "</td></tr>";
            }

            result = result + "</table>";
            result = result + "</body></html>";
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        
      


        public ActionResult SmoTreatment()
        {
            ViewBag.Message = "";

            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Usuarios user = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);
            
            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List <LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.IdRenglon);


            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
             viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
             viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función de:
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.

           List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
            viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            foreach(LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
            {
                smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(),actualLuo.IdSmo.ToString()).Where(x=> x.RefIdOwner == actualLuo.IdOwner).ToList();
                if(smoscopeact != null)
                {
                    viewModel.RegistrosSMO.AddRange(smoscopeact);
                }
            }

            //LARCA2.Business.Services.MasterDataBLL mdlll = new LARCA2.Business.Services.MasterDataBLL();
            //List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> allmaster = mdlll.Todos().Exists(z => viewModel.SMOList.Where(x => x.Text == z.DataIni).ToList());
            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de SmoScope valido en termino de fecha pero llevaria mas horas
            //viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            //viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.Fecha.Value.Month == DateTime.Now.Month).ToList();

            //Copio la lista a los editables para poder modificar los datos necesarios.
            viewModel.EditablesSMO = viewModel.RegistrosSMO;
            return View("SmoTreatment", viewModel);

        }

    

        public ActionResult SmoFiltrado(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            ViewBag.Message = "";
            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
          

            LARCA2.Data.DatabaseModels.LARCA20_Usuarios user = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.IdRenglon);

            viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
            viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
            {
                smoscopeact = repo.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                if (smoscopeact != null)
                {
                    viewModel.RegistrosSMO.AddRange(smoscopeact);
                }
            }


            viewModel.Responsables = new List<SelectListItem>();
            List<LARCA2.Data.DatabaseModels.LARCA20_Usuarios> listaDeUsuariosParaRespons = repoUsuarios.Todos();
            viewModel.Responsables.Add(new SelectListItem { Text = "Choose a valid Owner:", Value = "0" });
            foreach (LARCA2.Data.DatabaseModels.LARCA20_Responsable userResponsable in repoResponsables.Todos())
            {
                viewModel.Responsables.Add(new SelectListItem { Text = listaDeUsuariosParaRespons.Where(u => u.IdRenglon == userResponsable.RefIdUsuario).FirstOrDefault().Usuario, Value = userResponsable.IdRenglon.ToString() });
            }


            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();

            if(viewModel.mesSeleccionado == "0")
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.Fecha.Value.Month == DateTime.Now.Month).ToList();
            else
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.Fecha.Value.Month < DateTime.Now.Month).ToList();
            
       //     viewModel.RegistrosSMO = repo.Filtrar(viewModel.bu, viewModel.smo); esto filtraba desde el TODOS
            viewModel.EditablesSMO = viewModel.RegistrosSMO;

            return View("SmoTreatment", viewModel);

        }

        
        public ActionResult SmoModificados(Larca2.Views.ViewModels.SMOScopeViewModel viewModel)
        {
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.SMOScopeBLL repoGuardado = new LARCA2.Business.Services.SMOScopeBLL();
            LARCA2.Business.Services.UserOwnerBLL uoClones = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.MasterDataBLL mdClones = new LARCA2.Business.Services.MasterDataBLL();
            LARCA2.Business.Services.Level4BLL lvlClones = new LARCA2.Business.Services.Level4BLL();
            LARCA2.Business.Services.RCClassificationBLL rcClones = new LARCA2.Business.Services.RCClassificationBLL();
            LARCA2.Business.Services.ResponsablesBLL respoClones = new LARCA2.Business.Services.ResponsablesBLL();

               //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Usuarios user = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);

            //obtengo el string con toda la info de los clones
            string[] RegistrosRecibidos = Request.Form["HI_SmoEsp"].Split(("##").ToCharArray());
            List<string> RegistrosClonados = new List<string>();


            if (RegistrosRecibidos.Count() == 0 || RegistrosRecibidos[0] == "")
            { //no se clono nada
            }
            else
            {
                //saco los strings vacios del arreglo
                for (var i = 0; i < RegistrosRecibidos.Length; i++)
                {
                    if (i % 2 == 0)  //los strings invalidos me quedaron en los impares, si algo llega a fallar revisar esto y cambiar por una eliminacion de los nulls.
                    {
                        RegistrosClonados.Add(RegistrosRecibidos[i]);
                    }
                }


                //Cada parte de RegistrosClonados es una fila clonada!
                foreach (string registro in RegistrosClonados)
                {
                    string[] act = registro.Split("%%".ToCharArray());
                    //en actFilt quedaran los atributos separados
                    List<string> actFilt = new List<string>();
                    for (var i = 0; i < act.Length; i++)
                    {
                        if (i % 2 == 0)
                        {
                            actFilt.Add(act[i].Trim().Replace("\r\n", "").Replace("&nbsp;", "").Replace("&amp;", "&"));
                        }
                    }
                    LARCA2.Data.DatabaseModels.LARCA20_SmoScope clon = new LARCA2.Data.DatabaseModels.LARCA20_SmoScope();


                    /*RC
    SMO
    BU
    VOLUMEN
    PROBLEM
    WHY1
    WHY2
    WHY3
    ACTIONPLAN
    RESPONSABLE
    DUEDATE
    O_C
    LEVEL4*/


                    DateTime due;
                    clon.SmoScopeID = 0;
                    clon.ActionPlan = actFilt[8];
                    clon.Borrado = false;
                    clon.DueDate = (DateTime.TryParse(actFilt[10], out due)? due : DateTime.Now.AddDays(7));
                    clon.Fecha = DateTime.Now;
                    clon.Volumen = Decimal.Parse(actFilt[3]);
                    clon.Problem = actFilt[4];
                    clon.Why1 = actFilt[5];
                    clon.Why2 = actFilt[6];
                    clon.Why3 = actFilt[7];
                    clon.O_C = (actFilt[11] == "O" || actFilt[11] == "C"? actFilt[11] : "O" );
                    clon.RefIdBU = mdClones.TraerPorData("BU", actFilt[2]).IdRenglon;
                    clon.RefIdSMO = mdClones.TraerPorData("SMO", actFilt[1]).IdRenglon;
                    clon.RefIdOwner = uoClones.TraerPorIdUsuario(user.IdRenglon).Where(x => x.IdBU == clon.RefIdBU && x.IdSmo == clon.RefIdSMO).FirstOrDefault().IdOwner; // :O
                    clon.RefIdRC = rcClones.TraerPorDesc(actFilt[0]).IdRenglon;
                    int io;
                    if (Int32.TryParse(actFilt[9].ToString(), out io) == true)
                        clon.RefIdResponsable = respoClones.Traer(Int32.Parse(actFilt[9])).IdRenglon;
                    else
                        clon.RefIdResponsable = null;

                    clon.Level4 = lvlClones.Todos().Where(l => l.Borrado == false && l.Id == Int32.Parse(actFilt[12])).First().Id;

                    repoGuardado.Guardar(clon);
                    //buscar IDs y guardar en tabla LARCA20_SmoScope -en user owner no deberia hacer falta, cuando haya que hacer pruebas revisar si con un solo user owner se obtienen todos los registros de la tabla de smo scope correspondientes-
                }

            }
            LARCA2.Business.Services.SMOScopeBLL repo = new LARCA2.Business.Services.SMOScopeBLL();
            
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();


        //user traido mas arriba

           int test = 0; //para corroborar cantidad de modificados al finalizar la actualizacion de valores
           foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope scope in viewModel.EditablesSMO)
            {
             
                LARCA2.Data.DatabaseModels.LARCA20_SmoScope actualOriginal = repo.Traer(scope.SmoScopeID);
                if (actualOriginal == null) { } //no existe en la tabla
                if (actualOriginal != null && !LARCA2.Business.Services.SMOScopeBLL.esIgual(actualOriginal, scope)) //existe Y fue modificado
                {
                    
                    if (scope.Why1 != actualOriginal.Why1) 
                        actualOriginal.Why1 = scope.Why1;
                    if (scope.Why2 != actualOriginal.Why2) 
                        actualOriginal.Why2 = scope.Why2;
                    if (scope.Why3 != actualOriginal.Why3) 
                        actualOriginal.Why3 = scope.Why3;
                    if (scope.ActionPlan != actualOriginal.ActionPlan) 
                        actualOriginal.ActionPlan = scope.ActionPlan;
                    if (scope.Problem != actualOriginal.Problem)
                        actualOriginal.Problem = scope.Problem;
                    if (scope.DueDate != actualOriginal.DueDate)
                       actualOriginal.DueDate = scope.DueDate;
                    if (scope.RefIdResponsable != actualOriginal.RefIdResponsable && scope.RefIdResponsable != 0)
                        actualOriginal.RefIdResponsable = scope.RefIdResponsable; 
                    if (scope.O_C != actualOriginal.O_C && (scope.O_C != null && (scope.O_C == "O" || scope.O_C == "o" || scope.O_C == "C" || scope.O_C == "c")))
                        actualOriginal.O_C = scope.O_C.ToUpper();
                    if (scope.Level4 != actualOriginal.Level4 && (scope.Level4 != null && scope.Level4 != 0))
                        actualOriginal.Level4 = scope.Level4;
                    repo.Guardar(actualOriginal);
                    test++;
                }

            }
            test = test++;

            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.IdRenglon);


            List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
            viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
            {
                smoscopeact = repo.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                if (smoscopeact != null)
                {
                    viewModel.RegistrosSMO.AddRange(smoscopeact);
                }
            }

            int bu = Int32.Parse(viewModel.bu);
            int smo = Int32.Parse(viewModel.smo);

            if (viewModel.bu != null && bu != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdBU == bu).ToList();
            if (viewModel.smo != null && smo != 0)
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdSMO == smo).ToList();


            if (viewModel.mesSeleccionado == "0")
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.Fecha.Value.Month == DateTime.Now.Month).ToList();
            else
                viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.Fecha.Value.Month < DateTime.Now.Month).ToList();
            

            //     viewModel.RegistrosSMO = repo.Filtrar(viewModel.bu, viewModel.smo); esto filtraba desde el TODOS
            viewModel.EditablesSMO = viewModel.RegistrosSMO;


            viewModel.Responsables = new List<SelectListItem>();
            List<LARCA2.Data.DatabaseModels.LARCA20_Usuarios> listaDeUsuariosParaRespons = repoUsuarios.Todos();
            viewModel.Responsables.Add(new SelectListItem { Text = "Choose a valid Owner:", Value = "0" });
            foreach (LARCA2.Data.DatabaseModels.LARCA20_Responsable userResponsable in repoResponsables.Todos())
            {
                viewModel.Responsables.Add(new SelectListItem { Text = listaDeUsuariosParaRespons.Where(u => u.IdRenglon == userResponsable.RefIdUsuario).FirstOrDefault().Usuario, Value = userResponsable.IdRenglon.ToString() });
            }


            ViewBag.Message = "";
            return View("SmoTreatment", viewModel);

        }
       
    }
}