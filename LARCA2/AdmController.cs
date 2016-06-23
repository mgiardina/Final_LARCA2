using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Controllers
{
    public class AdmController : Controller
    {

        public ActionResult Index()
        {
            ViewBag.Message = "Alta.";
            return View("NuevoUser");
        }

        #region <Usuarios>

        public ActionResult NuevoUsuario()
        {
            Business.Services.RolesBLL RepoRol = new Business.Services.RolesBLL();
            ViewBag.ComboRol = new SelectList(RepoRol.Todos(), "IdRenglon", "Descripcion");

            Business.Services.MasterDataBLL masterBU = new Business.Services.MasterDataBLL();
            ViewBag.MasterBU = new SelectList(masterBU.TraerSoloData("BU"), "IdRenglon", "DataFin");

            Business.Services.MasterDataBLL masterSMO = new Business.Services.MasterDataBLL();
            ViewBag.MasterSMO = new SelectList(masterSMO.TraerSoloData("SMO"), "IdRenglon", "DataFin");

            Business.Services.MasterDataBLL masterOW = new Business.Services.MasterDataBLL();
            ViewBag.MasterOW = new SelectList(masterOW.TraerSoloData("OWNER"), "IdRenglon", "DataFin");

            ViewBag.Message = "Alta.";
            ViewBag.ErrorPermiso = false;
            ViewBag.ErrorRol = false;

            return View("NuevoUser");

        }

        public ActionResult AgregarUsuario(Larca2.Models.UserForm model, string CboRoles)
        {
            string[] LosPermisos = Request.Form["HI_PermisosEsp"].Split('/');
            ViewBag.ErrorPermiso = false;
            ViewBag.ErrorRol = false;
            bool Error = false;
            if (ModelState.IsValid)
            {
                if (CboRoles != "0")
                {
                    if (LosPermisos[0] != "")
                    {
                        Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();
                        if (repo.TraerPorNombreDeUsuario(model.Usuario.Usuario) != null && repo.TraerPorNombreDeUsuario(model.Usuario.Usuario).Borrado == false)
                            return Content("<script language='javascript' type='text/javascript'>alert('El nombre de Usuario ingresado ya existe, intente con otro.');document.location = '../Adm/NuevoUsuario';</script>");

                        Data.DatabaseModels.LARCA20_Usuarios user = new Data.DatabaseModels.LARCA20_Usuarios();
                        user.Nombre = model.Usuario.Nombre;
                        user.Apellido = model.Usuario.Apellido;
                        user.Borrado = false;
                        user.Clave = Larca2.Utilities.Crypto.Encrypt(model.Usuario.Clave);
                        user.Fecha = DateTime.Now;
                        user.Email = model.Usuario.Email;
                        user.Telefono = model.Usuario.Telefono;
                        user.Usuario = model.Usuario.Usuario;
                        repo.Guardar(user);

                        // Ahora guardo los datos del Rol para este usuario
                        Business.Services.UsuariosRolesBLL repoRol = new Business.Services.UsuariosRolesBLL();
                        Data.DatabaseModels.LARCA20_UsuariosRoles userRol = new Data.DatabaseModels.LARCA20_UsuariosRoles();
                        Data.DatabaseModels.Larca2Entities ff = new Data.DatabaseModels.Larca2Entities();
                        int lastProductId = ff.LARCA20_Usuarios.Max(item => item.IdRenglon);
                        //int lastProductId =  db.Products.Max(item => item.ProductId);

                        userRol.RefIdUsuario = lastProductId;
                        userRol.RefIdRoles = Convert.ToInt32(CboRoles);
                        userRol.Borrado = false;
                        repoRol.Guardar(userRol);

                        // Guardo los Permisos Especiales

                        foreach (string iUs in LosPermisos)
                        {
                            Business.Services.UserOwnerBLL RepUserOW = new Business.Services.UserOwnerBLL();
                            Data.DatabaseModels.LARCA20_User_Owner userOW = new Data.DatabaseModels.LARCA20_User_Owner();
                            string[] PerEsp = iUs.Split('.');
                            userOW.IdBU = Convert.ToInt32(PerEsp[0]);
                            userOW.IdSmo = Convert.ToInt32(PerEsp[1]);
                            userOW.IdOwner = Convert.ToInt32(PerEsp[2]);
                            userOW.IdUsuario = lastProductId;
                            userOW.Borrado = false;
                            RepUserOW.Guardar(userOW);
                        }

                        return RedirectToAction("UserBM");
                    }
                    else
                    {
                        Error = true;
                        ViewBag.ErrorPermiso = true;
                    }
                }
                else
                {
                    Error = true;
                    ViewBag.ErrorRol = true;
                }
            }
            else
            {
                Error = true;
            }
            if (!Error)
                return RedirectToAction("UserBM");
            else
            {
                Business.Services.RolesBLL RepoRol = new Business.Services.RolesBLL();
                ViewBag.ComboRol = new SelectList(RepoRol.Todos(), "IdRenglon", "Descripcion");

                Business.Services.MasterDataBLL masterBU = new Business.Services.MasterDataBLL();
                ViewBag.MasterBU = new SelectList(masterBU.TraerSoloData("BU"), "IdRenglon", "DataFin");

                Business.Services.MasterDataBLL masterSMO = new Business.Services.MasterDataBLL();
                ViewBag.MasterSMO = new SelectList(masterSMO.TraerSoloData("SMO"), "IdRenglon", "DataFin");

                Business.Services.MasterDataBLL masterOW = new Business.Services.MasterDataBLL();
                ViewBag.MasterOW = new SelectList(masterOW.TraerSoloData("OWNER"), "IdRenglon", "DataFin");

                return View("NuevoUser", model);
                //return Content("<script language='javascript' type='text/javascript'>alert('Se encontraron errores, favor de corregirlos.');document.location = 'javascript:history.back();'</script>");
            }
           
        }

        public ActionResult ModificarUsuario(Larca2.Models.UserForm model, string CboRoles)
        {
            string[] LosPermisos = Request.Form["HI_PermisosEsp"].Split('/');
            ViewBag.ErrorPermiso = false;
            ViewBag.ErrorRol = false;
            ViewBag.ErrorUsuario = false;
            string mensError = "";
            bool Error = false;
            if (ModelState.IsValid)
            {
                if (CboRoles != "0")
                {
                    if (LosPermisos[0] != "")
                    {
                        Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();
                        Data.DatabaseModels.LARCA20_Usuarios user = repo.Traer(model.Usuario.IdRenglon);

                        if (repo.TraerPorNombreDeUsuario(model.Usuario.Usuario) != null && repo.TraerPorNombreDeUsuario(model.Usuario.Usuario).Borrado == false && repo.TraerPorNombreDeUsuario(model.Usuario.Usuario).IdRenglon != user.IdRenglon)
                        {
                            Error = true;
                            ViewBag.ErrorUsuario = true;
                            mensError = "El usuario cargado ya existe, favor de cargar otro";
                        }
                        else
                        {
                            user.IdRenglon = model.Usuario.IdRenglon;
                            user.Nombre = model.Usuario.Nombre;
                            user.Apellido = model.Usuario.Apellido;
                            user.Borrado = model.Usuario.Borrado;
                            user.Clave = Larca2.Utilities.Crypto.Encrypt(model.Usuario.Clave); 
                            user.Fecha = DateTime.Now;
                            user.Email = model.Usuario.Email;
                            user.Telefono = model.Usuario.Telefono;
                            user.Usuario = model.Usuario.Usuario;
                            repo.Guardar(user);

                            // Ahora guardo los datos del Rol para este usuario
                            Business.Services.UsuariosRolesBLL repoRol = new Business.Services.UsuariosRolesBLL();
                            Data.DatabaseModels.LARCA20_UsuariosRoles userRol = repoRol.Traer(model.Usuario.IdRenglon);
                            userRol.RefIdRoles = Convert.ToInt32(CboRoles);
                            repoRol.Guardar(userRol);

                            // Ahora guardo los Permisos
                            // Primero elimino los que tenga y despues agrego los que quedaron seleccionados
                            Business.Services.UserOwnerBLL RepUserOW = new Business.Services.UserOwnerBLL();
                            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner fila in user.LARCA20_User_Owner)
                            {
                                RepUserOW.Eliminar(fila.Id);
                            }
                            foreach (string iUs in LosPermisos)
                            {
                                Data.DatabaseModels.LARCA20_User_Owner userOW = new Data.DatabaseModels.LARCA20_User_Owner();
                                string[] PerEsp = iUs.Split('.');
                                userOW.IdBU = Convert.ToInt32(PerEsp[0]);
                                userOW.IdSmo = Convert.ToInt32(PerEsp[1]);
                                userOW.IdOwner = Convert.ToInt32(PerEsp[2]);
                                userOW.IdUsuario = model.Usuario.IdRenglon;
                                userOW.Borrado = false;
                                RepUserOW.Guardar(userOW);
                            }

                            return Content("<script language='javascript' type='text/javascript'>alert('Se ha modificado el usuario');document.location = '../Adm/UserBM';</script>");
                        }
                    }
                    else
                    {
                        mensError = "Debe seleccionar al menos un permiso Especial";
                        Error = true;
                        ViewBag.ErrorPermiso = true;
                    }
                }
                else
                {
                    mensError = "Debe seleccionar el Rol del usuario";
                    Error = true;
                    ViewBag.ErrorRol = true;
                }
            }
            else
            {
                Error = true;
            }
            if (!Error)
                return RedirectToAction("UserBM");
            else
            {
                return Content("<script language='javascript' type='text/javascript'>alert('"+mensError+"');document.location = 'javascript:window.history.back();';</script>");
            }
        }

        public ActionResult ModifUser(Larca2.Models.UserSearchForm userSearchForm, string txtIdRenglon)
        {
            long id = Int32.Parse(txtIdRenglon);
            Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();
            Data.DatabaseModels.LARCA20_Usuarios userdefault = repo.Traer(id);
            Larca2.Models.UserForm userForm = new Larca2.Models.UserForm();
            userForm.Usuario = userdefault;
            userForm.Usuario.Clave = Larca2.Utilities.Crypto.Decrypt(userForm.Usuario.Clave);
            Business.Services.RolesBLL RepoRol = new Business.Services.RolesBLL();
            ViewBag.ComboRol = new SelectList(RepoRol.Todos(), "IdRenglon", "Descripcion");

            Business.Services.UsuariosRolesBLL repRol = new Business.Services.UsuariosRolesBLL();
            List<Data.DatabaseModels.LARCA20_UsuariosRoles> UserRol = repRol.TodosFiltro(id.ToString(), "");
            ViewBag.RefIdRoles = UserRol[0].RefIdRoles.ToString();

            Business.Services.MasterDataBLL masterBU = new Business.Services.MasterDataBLL();
            ViewBag.MasterBU = new SelectList(masterBU.TraerSoloData("BU"), "IdRenglon", "DataFin");

            Business.Services.MasterDataBLL masterSMO = new Business.Services.MasterDataBLL();
            ViewBag.MasterSMO = new SelectList(masterSMO.TraerSoloData("SMO"), "IdRenglon", "DataFin");

            Business.Services.MasterDataBLL masterOW = new Business.Services.MasterDataBLL();
            ViewBag.MasterOW = new SelectList(masterOW.TraerSoloData("OWNER"), "IdRenglon", "DataFin");

            ViewBag.ErrorPermiso = false;
            ViewBag.ErrorRol = false;
            ViewBag.ErrorUsuario = false;
            string ren = "";
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner fila in userForm.Usuario.LARCA20_User_Owner)
            {
                if (fila.Borrado == false)
                {
                    if (ren == "")
                        ren = fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                    else
                        ren = ren + "/" + fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                }
            }
            ViewBag.PermisosUser = ren;

            return View("ModifUser", userForm);
        }

        public ActionResult UserBM(string txtNombre, string txtApellido)
        {
            ViewBag.Message = "Pantalla de modificación de Usuarios";
            Larca2.Models.UserSearchForm userSearchForm = new Larca2.Models.UserSearchForm();
            Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();

            if (txtNombre != null & txtApellido != null)
                userSearchForm.Usuarios = repo.TodosFiltro(txtNombre, txtApellido);

            return View("UserBM", userSearchForm);
        }

        #endregion

        #region <RC Clasification>

        public ActionResult RcClasificationBM(string txtCod, string txtDes)
        {
            ViewBag.Message = "Pantalla de modificación de RC Clasifications";
            Larca2.Models.RcClasificationSearchForm RcClasificationSearchForm = new Larca2.Models.RcClasificationSearchForm();
            Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();

            if (txtCod != null & txtDes != null)
            RcClasificationSearchForm.RcClasificationList = repo.TodosFiltro(txtCod, txtDes);

            return View("RcClasificationBM", RcClasificationSearchForm);

        }

        public ActionResult ModifRcClasification(Larca2.Models.RcClasificationSearchForm RcClasification, string txtIdRenglon)
        {
            long id = Int32.Parse(txtIdRenglon);
            Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();
            Data.DatabaseModels.LARCA20_RcClasification RcCdefault = repo.Traer(id);
            Larca2.Models.RcClasificationSearchForm RcCForm = new Larca2.Models.RcClasificationSearchForm();
            RcCForm.RcClasification = RcCdefault;
            return View("ModifRcClasification", RcCForm);

        }

        public ActionResult ModificarRcClasification(Larca2.Models.RcClasificationSearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();
                Data.DatabaseModels.LARCA20_RcClasification RcC = repo.Traer(model.RcClasification.IdRenglon);
                RcC.IdRenglon = model.RcClasification.IdRenglon;
                RcC.Nivel = model.RcClasification.Nivel;
                RcC.Codigo = model.RcClasification.Codigo;
                RcC.Descripcion = model.RcClasification.Descripcion;
                RcC.Ownership = (model.RcClasification.Ownership == null ? "" : model.RcClasification.Ownership);
                RcC.Borrado = model.RcClasification.Borrado;
                repo.Guardar(RcC);
                return Content("<script language='javascript' type='text/javascript'>alert('Se ha modificado el Rc Clasification');document.location = '../Adm/RcClasificationBM';</script>");
            }
            else
            {
                return View("ModifRcClasification", model);
            }
        }

        public ActionResult NuevaRcClasification()
        {
            ViewBag.Message = "Alta.";
            return View("NuevoRcClasification");

        }

        public ActionResult AgregarRcClasification(Larca2.Models.RcClasificationSearchForm model)
        {
            if (ModelState.IsValid)
            {
              Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();
              Data.DatabaseModels.LARCA20_RcClasification user = new Data.DatabaseModels.LARCA20_RcClasification();
              user.Nivel = model.RcClasification.Nivel;
              user.Codigo = model.RcClasification.Codigo;
              user.Borrado = false;
              user.Descripcion = model.RcClasification.Descripcion;
              user.Ownership = (model.RcClasification.Ownership == null ? "" : model.RcClasification.Ownership);
              repo.Guardar(user);
              return RedirectToAction("RcClasificationBM");
            }
            else
            {
                return View("NuevoRcClasification", model);
            }
        }

        #endregion



        public static List<SelectListItem> RespSelectItem(List<SelectListItem> lsli, int idref)
        {
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            List<LARCA2.Data.DatabaseModels.LARCA20_Usuarios> list = repoUsuarios.Todos();
            string username =  list.Where(u => u.IdRenglon == idref).FirstOrDefault().Usuario;
            foreach(SelectListItem item in lsli)
                item.Selected = (item.Text == username? true : false);
            return lsli;
        }

        public static List<SelectListItem> LeveSelectItem(List<SelectListItem> lsli, int idref)
        {
            LARCA2.Business.Services.Level4BLL repoNivel = new LARCA2.Business.Services.Level4BLL();
            List<LARCA2.Data.DatabaseModels.LARCA20_Level4> list = repoNivel.Todos();
            if (idref == null || idref == 0)
            {
                List<SelectListItem> result = new List<SelectListItem>();
                result.Add(new SelectListItem() { Text = "", Value = "0", Selected = true });
                result.AddRange(lsli);
                result[0].Selected = true;
                foreach (SelectListItem sli in result.Where(x => x.Value != "0").ToList())
                    sli.Selected = false;
                return result;

            }
            string levelName = list.Where(u => u.Id == idref).FirstOrDefault().Nombre;
            foreach (SelectListItem item in lsli)
                item.Selected = (item.Text == levelName ? true : false);
            return lsli;
        }


        #region <MasterData>

        public ActionResult MasterDataBM(string txtCod, string txtDes,string txtId)
        {
            ViewBag.Message = "Pantalla de modificación de Master Data";
            Larca2.Models.MasterDataSearchForm MasterDataSearchForm = new Larca2.Models.MasterDataSearchForm();
            Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();


            if (txtId != null)
            {
                long id = Int32.Parse(txtId);
                MasterDataSearchForm.MasterDataList = repo.FiltroId(id);
                ViewBag.txtCod = txtCod;
                ViewBag.txtDes = txtDes;
                ViewBag.txtDes = txtId;
                return View("MasterDataBM", MasterDataSearchForm);
            }


            if (txtCod != null & txtDes != null)
            MasterDataSearchForm.MasterDataList = repo.TodosFiltro(txtCod, txtDes);
            ViewBag.txtCod = txtCod;
            ViewBag.txtDes = txtDes;
            return View("MasterDataBM", MasterDataSearchForm);

        }

        public ActionResult NuevaMasterData()
        {
            ViewBag.Message = "Alta.";
            return View("NuevoMasterData");
        }

        public ActionResult AgregarMasterData(Larca2.Models.MasterDataSearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();
                Data.DatabaseModels.LARCA20_MasterData user = new Data.DatabaseModels.LARCA20_MasterData();
                user.Data = model.MasterData.Data;
                user.DataIni = model.MasterData.DataIni;
                user.DataFin = model.MasterData.DataFin;
                repo.Guardar(user);
                return RedirectToAction("MasterDataBM");
            }
            else
            {
                return View("NuevoMasterData", model);
            }
        }

        public ActionResult ModifMasterData(Larca2.Models.MasterDataSearchForm model, string txtIdRenglon)
        {
            long id = Int32.Parse(txtIdRenglon);
            Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();
            Data.DatabaseModels.LARCA20_MasterData RcMasterData = repo.Traer(id);
            Larca2.Models.MasterDataSearchForm RcCForm = new Larca2.Models.MasterDataSearchForm();
            RcCForm.MasterData = RcMasterData;
            ViewBag.Grupo = RcMasterData.Data;
            return View("ModifMasterData", RcCForm);

        }

        public ActionResult ModificarMasterData(Larca2.Models.MasterDataSearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();
                Data.DatabaseModels.LARCA20_MasterData MsD = repo.Traer(model.MasterData.IdRenglon);
                MsD.IdRenglon = model.MasterData.IdRenglon;
                MsD.Data = model.MasterData.Data;
                MsD.DataIni = model.MasterData.DataIni;
                MsD.DataFin = model.MasterData.DataFin;
                MsD.Borrado = model.MasterData.Borrado;
                repo.Guardar(MsD);
                return Content("<script language='javascript' type='text/javascript'>alert('Se ha modificado el Rc Clasification');document.location = '../Adm/MasterDataBM';</script>");
            }
            else
            {
                return View("ModificarMasterData", model);
            }
        }

        #endregion

        #region <level4>

        public ActionResult Level4(string txtNivel, string txtLimite)
        {

            ViewBag.Message = "Pantalla de modificación de Level 4";
            Larca2.Models.Level4SearchForm Level4SearchForm = new Larca2.Models.Level4SearchForm();
            Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();
            Business.Services.Level4BLL repo_level4 = new Business.Services.Level4BLL();
            Business.Services.ApplicationDataBLL repo_Aux = new Business.Services.ApplicationDataBLL();


            if (txtLimite != "" && txtLimite != "0" && txtLimite != null)
            {
                long id = 1;
                int Limite = Convert.ToInt32(txtLimite);
                Data.DatabaseModels.LARCA20_AuxData Auxdefault = repo_Aux.Traer(id);
                Auxdefault.LimiteFiltro = Limite;
                repo_Aux.Guardar(Auxdefault);
                Level4SearchForm.LimiteFiltro = Limite;
            }
            else
            {
                Data.DatabaseModels.LARCA20_AuxData Auxdefault = repo_Aux.Traer(1);

                if (Auxdefault != null && Auxdefault.LimiteFiltro != null)
                {
                    int Limite = (int)Auxdefault.LimiteFiltro;
                    Level4SearchForm.LimiteFiltro = Limite;
                }
            }

            Level4SearchForm.Level3List = repo.TodosNivel3();




            if (txtNivel != null)
            {

                Level4SearchForm.Level4List = repo_level4.TodosFiltro(txtNivel);

            }
            return View("Level4", Level4SearchForm);

        }

        public ActionResult Level4ModifAjax(int Valor)
        {
            var x = Valor;
            JsonResult Ok = Json(x, JsonRequestBehavior.AllowGet);
            return Ok;
        }


        public ActionResult ModifLevel4(Larca2.Models.Level4SearchForm Level4, string txtIdRenglon)
        {
            long id = Int32.Parse(txtIdRenglon);
            Business.Services.Level4BLL repo = new Business.Services.Level4BLL();
            Data.DatabaseModels.LARCA20_Level4 RcCdefault = repo.Traer(id);
            Larca2.Models.Level4SearchForm RcCForm = new Larca2.Models.Level4SearchForm();
            RcCForm.Level4 = RcCdefault;
            return View("ModifLevel4", RcCForm);

        }

        public ActionResult Modificar_abm_level4(Larca2.Models.Level4SearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.Level4BLL repo = new Business.Services.Level4BLL();
                Data.DatabaseModels.LARCA20_Level4 RcC = repo.Traer(model.Level4.Id);
                RcC.Nombre = model.Level4.Nombre;
                repo.Guardar(RcC);
                return Content("<script language='javascript' type='text/javascript'>alert('Se ha modificado el abm level 4');document.location = '../Adm/Level4';</script>");
            }
            else
            {
                return View("ModifLevel4", model);
            }
        }

        public ActionResult NuevoLevel4(string Id)
        {

            ViewBag.Message = "Alta.";
            ViewBag.Id = Id;
            return View("NuevoLevel4");

        }

        public ActionResult Agregar_abm_level4(Larca2.Models.Level4SearchForm model, string txtNivel)
        {
            if (ModelState.IsValid)
            {
                long RefIdRenglon = Int32.Parse(txtNivel);

                Business.Services.Level4BLL repo = new Business.Services.Level4BLL();
                Data.DatabaseModels.LARCA20_Level4 user = new Data.DatabaseModels.LARCA20_Level4();

                user.RefIdLevel3 = RefIdRenglon;
                user.Borrado = false;
                user.Nombre = model.Level4.Nombre;
                repo.Guardar(user);
                return RedirectToAction("Level4");
            }
            else
            {
                return View("NuevoLevel4", model);
            }
        }


        #endregion

    }
}
