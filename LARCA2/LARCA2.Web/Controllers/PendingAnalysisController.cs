using LARCA2.Business.Core;
using LARCA2.Business.Entities;
using LARCA2.Business.Services;
using LARCA2.Data.DatabaseModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Larca2.Controllers
{
    public class PendingAnalysisController : Controller
    {
        public ActionResult Index()
        {

            var model = new Larca2.Views.ViewModels.SMOScopeViewModel();
            /*try
            {
                ViewData["MasterRows"] = new SMOScopeBLL().Todos().ToList();
            }
            catch
            {
                ViewData["MasterRows"] = new List<LARCA20_SmoScope>();
            }*/

            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);



            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;
            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);


            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
            //    viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //    viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole != 1 && viewModel.idRole != 3)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.FiltrarPending(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString(), viewModel.idRole.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();                    
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.FiltrarPending("0", "0", viewModel.idRole.ToString()).ToList();
            }

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            /*

            viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();


            //LARCA2.Business.Services.MasterDataBLL mdlll = new LARCA2.Business.Services.MasterDataBLL();
            //List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> allmaster = mdlll.Todos().Exists(z => viewModel.SMOList.Where(x => x.Text == z.DataIni).ToList());
            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de SmoScope valido en termino de fecha pero llevaria mas horas
            //viewModel.SMOList = viewModel.SMOList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdSMO.ToString() == x.Value) || x.Value == "0").ToList();
            //viewModel.BUList = viewModel.BUList.Where(x => viewModel.RegistrosSMO.Exists(y => y.RefIdBU.ToString() == x.Value) || x.Value == "0").ToList();

            if (viewModel.RegistrosSMO.Where(x => x.date.Value.Month == (DateTime.Now.Month - 1)).Count() > 0)
                viewModel.dropdownMeses.Add(new SelectListItem { Text = "Previous Month", Value = "1", Selected = false });

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.date.Value.Month == DateTime.Now.Month).ToList();

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            //traigo aquellos de los cuales el user es el responsable
            ResponsablesBLL respBLL = new ResponsablesBLL();
            int idResp = respBLL.TraerPorNombreDeUsuario(user.user_name).Id;
            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Where(x => x.RefIdResponsable != null && x.RefIdResponsable.Value == idResp).ToList();


            //Copio la lista a los editables para poder modificar los datos necesarios.
            viewModel.EditablesSMO = viewModel.RegistrosSMO;


            LARCA2.Business.Services.ApplicationDataBLL adb = new LARCA2.Business.Services.ApplicationDataBLL();
            int valMax = adb.Todos()[0].Toplvl4;
            viewModel.maxClones = new List<int>();
            for (int i = 0; i < viewModel.EditablesSMO.Count; i++)
            { viewModel.maxClones.Add(valMax); }

            ResponsablesBLL repoResponsables = new ResponsablesBLL();
            viewModel.responsibles = new List<string>();
            foreach (LARCA2.Data.DatabaseModels.LARCA20_SmoScope itemstr in viewModel.EditablesSMO)


                viewModel.responsibles.Add((itemstr.RefIdResponsable == null ? "" : repoResponsables.TraerSuNombreDeUsuario(itemstr.RefIdResponsable.Value)));

             * */
            ViewData["MasterRows"] = viewModel.RegistrosSMO;
            return View(model);
        }

        public ActionResult Export()
        {
            var model = new Larca2.Views.ViewModels.SMOScopeViewModel();
            /*try
            {
                ViewData["MasterRows"] = new SMOScopeBLL().Todos().ToList();
            }
            catch
            {
                ViewData["MasterRows"] = new List<LARCA20_SmoScope>();
            }*/

            //Declaro BLLs e inicializo viewModel
            Larca2.Views.ViewModels.SMOScopeViewModel viewModel = new Larca2.Views.ViewModels.SMOScopeViewModel();
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.UserOwnerBLL uobll = new LARCA2.Business.Services.UserOwnerBLL();
            LARCA2.Business.Services.SMOScopeBLL ssbll = new LARCA2.Business.Services.SMOScopeBLL();


            //Reviso el usuario logueado, sino como prueba traigo al de ID 2
            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)Session["Usuario"];
            if (user == null)
                user = repoUsuarios.Traer(2);



            //determino el rol del usuario para entender qué filtros y funcionalidades disponer
            LARCA2.Business.Services.RolesBLL robll = new LARCA2.Business.Services.RolesBLL();
            LARCA2.Business.Services.UsuariosRolesBLL urbll = new LARCA2.Business.Services.UsuariosRolesBLL();
            viewModel.userRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Description;
            viewModel.idRole = robll.Traer(urbll.Traer(user.Id).RefIdRoles).Id;
            //Obtengo los registros de User Owner con IdUser igual al del usuario logueado
            List<LARCA2.Data.DatabaseModels.LARCA20_User_Owner> luo = uobll.TraerPorIdUsuario(user.Id);


            // Quito de la lista de SMO y BU de los filtros aquellos no contemplados por un registro existente de UserOwner para el usuario logueado
            //    viewModel.SMOList = viewModel.SMOList.Where(x => luo.Exists(y => y.IdSmo.ToString() == x.Value) || x.Value == "0").ToList();
            //    viewModel.BUList = viewModel.BUList.Where(x => luo.Exists(y => y.IdBU.ToString() == x.Value) || x.Value == "0").ToList();

            //Filtro los registros de la tabla SmoScope en función del rol y los permisos para cada uno
            //Aquellos cuyos RefIdSMO, RefIdBU, y RefIdOwner coinciden con los de un registro de la tabla UserOwner para el usuario logueado, permanecen
            //Con que algunos de los campos en cuestion difiera, el registro de SmoScope ya no será mostrado.
            if (viewModel.idRole != 1 && viewModel.idRole != 3)
            {
                List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope> smoscopeact;
                viewModel.RegistrosSMO = new List<LARCA2.Data.DatabaseModels.LARCA20_SmoScope>();
                foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner actualLuo in luo)
                {
                    smoscopeact = ssbll.Filtrar(actualLuo.IdBU.ToString(), actualLuo.IdSmo.ToString(), viewModel.idRole.ToString()).Where(x => x.RefIdOwner == actualLuo.IdOwner).ToList();
                    if (smoscopeact != null)
                    {
                        viewModel.RegistrosSMO.AddRange(smoscopeact);
                    }
                }
            }
            else
            {
                viewModel.RegistrosSMO = ssbll.Filtrar("0", "0", viewModel.idRole.ToString()).ToList();
            }

            viewModel.RegistrosSMO = viewModel.RegistrosSMO.Distinct().ToList();

            var masterData = viewModel.RegistrosSMO.ToList();
            //var masterData = new SMOScopeBLL().Todos().ToList();
            var file = new ExcelCore().GenerarExcelPendingAnalysis("LARCA Pending Analysis", masterData);
            DownloadFile(file);
            return Content("<script language='javascript' type='text/javascript'>alert('Exported!');document.location = 'Index';</script>");
        }

        private void DownloadFile(string file)
        {
            byte[] Content = System.IO.File.ReadAllBytes(file);
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            var random = new Random().Next(0, 10000);
            Response.AddHeader("content-disposition", "attachment; filename=" + "LARCAPendingAnalysisReport_" + random + ".xlsx");
            Response.BufferOutput = true;
            Response.OutputStream.Write(Content, 0, Content.Length);
            Response.End();
        }

    }
}
