using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LARCA2.Data.DatabaseModels;
using LARCA2.Business.Services;

namespace LARCA2.Controllers
{
    public class AdmController : Controller
    {

        public ActionResult Index()
        {
            return View("NuevoUser");
        }

        #region <Usuarios>

        public ActionResult NuevoUsuario()
        {
            Business.Services.RolesBLL RepoRol = new Business.Services.RolesBLL();
            ViewBag.ComboRol = new SelectList(RepoRol.Todos(), "Id", "Description");

            Business.Services.MasterDataBLL masterBU = new Business.Services.MasterDataBLL();
            ViewBag.MasterBU = new SelectList(masterBU.TraerSoloData("BU"), "Id", "DataFin");

            Business.Services.MasterDataBLL masterSMO = new Business.Services.MasterDataBLL();
            ViewBag.MasterSMO = new SelectList(masterSMO.TraerSoloData("SMO"), "Id", "DataFin");

            Business.Services.MasterDataBLL masterOW = new Business.Services.MasterDataBLL();
            ViewBag.MasterOW = new SelectList(masterOW.TraerSoloData("OWNER"), "Id", "DataFin");


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
                        if (repo.TraerPorNombreDeUsuario(model.Usuario.user_name) != null && repo.TraerPorNombreDeUsuario(model.Usuario.user_name).deleted == false)
                            return Content("<script language='javascript' type='text/javascript'>alert('The username entered already exists , try another.');document.location = '../Adm/NuevoUsuario';</script>");

                        Data.DatabaseModels.LARCA20_Users user = new Data.DatabaseModels.LARCA20_Users();
                        user.name = model.Usuario.name;
                        user.last_name = model.Usuario.last_name;
                        user.deleted = false;
                        // user.Clave = Larca2.Utilities.Crypto.Encrypt(model.Usuario.Clave);
                        user.date = DateTime.Now;
                        user.Email = model.Usuario.user_name + "@pg.com";
                        // user.Telefono = model.Usuario.Telefono;
                        user.user_name = model.Usuario.user_name;
                        
                        repo.Guardar(user);

                        // Ahora guardo los datos del Rol para este usuario
                        Business.Services.UsuariosRolesBLL repoRol = new Business.Services.UsuariosRolesBLL();
                        Data.DatabaseModels.LARCA20_UsersRoles userRol = new Data.DatabaseModels.LARCA20_UsersRoles();
                        Data.DatabaseModels.Larca2Entities ff = new Data.DatabaseModels.Larca2Entities();
                        int lastProductId = ff.LARCA20_Users.Max(item => item.Id);

                        // Ahora guardamos la row si el user es responsable
                        if (model.Responsible)
                        {
                            ResponsablesBLL repoResponsible = new ResponsablesBLL();
                            LARCA20_Responsable responsible = new LARCA20_Responsable();
                            responsible.RefIdUser = lastProductId;
                            responsible.Name = user.name;
                            responsible.Last_name = user.last_name;
                            responsible.Email = user.Email;
                            responsible.deleted = false;
                            repoResponsible.Guardar(responsible);

                        }

                        userRol.RefIdUser = lastProductId;
                        userRol.RefIdRoles = Convert.ToInt32(CboRoles);
                        userRol.deleted = false;
                        repoRol.Guardar(userRol);

                        // Guardo los Permisos Especiales

                        foreach (string iUs in LosPermisos)
                        {
                            Business.Services.UserOwnerBLL RepUserOW = new Business.Services.UserOwnerBLL();
                            Data.DatabaseModels.LARCA20_User_Owner userOW = new Data.DatabaseModels.LARCA20_User_Owner();
                            string[] PerEsp = iUs.Split('.');

                            if (Convert.ToInt32(PerEsp[0]) != 0 && Convert.ToInt32(PerEsp[1]) != 0 && Convert.ToInt32(PerEsp[2]) != 0)
                            {
                                userOW.IdBU = Convert.ToInt32(PerEsp[0]);
                                userOW.IdSmo = Convert.ToInt32(PerEsp[1]);
                                userOW.IdOwner = Convert.ToInt32(PerEsp[2]);
                                userOW.IdUser = lastProductId;
                                userOW.deleted = false;
                                RepUserOW.Guardar(userOW);
                            }

                            if (Convert.ToInt32(PerEsp[0]) != 0 && Convert.ToInt32(PerEsp[1]) == 0 && Convert.ToInt32(PerEsp[2]) == 0)
                            {

                                userOW.IdBU = Convert.ToInt32(PerEsp[0]);
                                userOW.IdUser = lastProductId;
                                userOW.deleted = false;
                                RepUserOW.Guardar(userOW);
                            }

                            if (Convert.ToInt32(PerEsp[0]) == 0 && Convert.ToInt32(PerEsp[1]) != 0 && Convert.ToInt32(PerEsp[2]) == 0)
                            {

                                userOW.IdSmo = Convert.ToInt32(PerEsp[1]);
                                userOW.IdUser = lastProductId;
                                userOW.deleted = false;
                                RepUserOW.Guardar(userOW);
                            }

                            if (Convert.ToInt32(PerEsp[0]) == 0 && Convert.ToInt32(PerEsp[1]) == 0 && Convert.ToInt32(PerEsp[2]) == 0)
                            {

                                userOW.IdUser = lastProductId;
                                userOW.deleted = false;
                                RepUserOW.Guardar(userOW);
                            }
                        }


                        return Content("<script language='javascript' type='text/javascript'>alert('Saved!');document.location = '../Adm/UserBM';</script>");
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
                ViewBag.ComboRol = new SelectList(RepoRol.Todos(), "Id", "Description");

                Business.Services.MasterDataBLL masterBU = new Business.Services.MasterDataBLL();
                ViewBag.MasterBU = new SelectList(masterBU.TraerSoloData("BU"), "id", "DataFin");

                Business.Services.MasterDataBLL masterSMO = new Business.Services.MasterDataBLL();
                ViewBag.MasterSMO = new SelectList(masterSMO.TraerSoloData("SMO"), "id", "DataFin");

                Business.Services.MasterDataBLL masterOW = new Business.Services.MasterDataBLL();
                ViewBag.MasterOW = new SelectList(masterOW.TraerSoloData("OWNER"), "id", "DataFin");

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

                    Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();
                    Data.DatabaseModels.LARCA20_Users user = repo.Traer(model.Usuario.Id);
                    if (LosPermisos[0] != "" || user.LARCA20_UsersRoles.ToList()[0].RefIdRoles == 1 || user.LARCA20_UsersRoles.ToList()[0].RefIdRoles == 3)
                    {
                      
                        if (repo.TraerPorNombreDeUsuario(model.Usuario.user_name) != null && repo.TraerPorNombreDeUsuario(model.Usuario.user_name).deleted == false && repo.TraerPorNombreDeUsuario(model.Usuario.user_name).Id != user.Id)
                        {
                            Error = true;
                            ViewBag.ErrorUsuario = true;
                            mensError = "The user already exists loaded , please load another";
                        }
                        else
                        {
                            user.Id = model.Usuario.Id;
                            user.name = model.Usuario.name;
                            user.last_name = model.Usuario.last_name;
                            user.deleted = model.Usuario.deleted;
                            //user.Clave = Larca2.Utilities.Crypto.Encrypt(model.Usuario.Clave);
                            user.date = DateTime.Now;
                            user.Email = model.Usuario.user_name + "@pg.com";
                            //user.Telefono = model.Usuario.Telefono;
                            user.user_name = model.Usuario.user_name;
                            repo.Guardar(user);

                            // Ahora guardo los datos del Rol para este usuario
                            Business.Services.UsuariosRolesBLL repoRol = new Business.Services.UsuariosRolesBLL();
                            Data.DatabaseModels.LARCA20_UsersRoles userRol = repoRol.Traer(model.Usuario.Id);
                            userRol.RefIdRoles = Convert.ToInt32(CboRoles);
                            repoRol.Guardar(userRol);

                            // Ahora guardamos la row si el user es responsable
                            if (model.Responsible)
                            {
                                ResponsablesBLL repoResponsible = new ResponsablesBLL();
                                if (repoResponsible.TraerPorNombreDeUsuario(model.Usuario.user_name) != null)
                                {
                                    var responsible = repoResponsible.TraerPorNombreDeUsuario(model.Usuario.user_name);
                                    responsible.RefIdUser = model.Usuario.Id;
                                    responsible.Name = user.name;
                                    responsible.Last_name = user.last_name;
                                    responsible.Email = user.Email;
                                    responsible.deleted = false;
                                    repoResponsible.Guardar(responsible);
                                }
                                else
                                {
                                    LARCA20_Responsable responsible = new LARCA20_Responsable();
                                    responsible.RefIdUser = model.Usuario.Id;
                                    responsible.Name = user.name;
                                    responsible.Last_name = user.last_name;
                                    responsible.Email = user.Email;
                                    responsible.deleted = false;
                                    repoResponsible.Guardar(responsible);
                                }
                            }
                            else
                            {
                                ResponsablesBLL repoResponsible = new ResponsablesBLL();
                                if (repoResponsible.TraerPorNombreDeUsuario(model.Usuario.user_name) != null)
                                {
                                    var responsible = repoResponsible.TraerPorNombreDeUsuario(model.Usuario.user_name);
                                    repoResponsible.Eliminar(responsible.Id);
                                }
                            }

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


                                if (Convert.ToInt32(PerEsp[0]) != 0 && Convert.ToInt32(PerEsp[1]) != 0 && Convert.ToInt32(PerEsp[2]) != 0)
                                {
                                    userOW.IdBU = Convert.ToInt32(PerEsp[0]);
                                    userOW.IdSmo = Convert.ToInt32(PerEsp[1]);
                                    userOW.IdOwner = Convert.ToInt32(PerEsp[2]);
                                    userOW.IdUser = model.Usuario.Id;
                                    userOW.deleted = false;
                                    RepUserOW.Guardar(userOW);
                                }

                                if (Convert.ToInt32(PerEsp[0]) != 0 && Convert.ToInt32(PerEsp[1]) == 0 && Convert.ToInt32(PerEsp[2]) == 0)
                                {

                                    userOW.IdBU = Convert.ToInt32(PerEsp[0]);
                                    userOW.IdSmo = null;
                                    userOW.IdOwner = null;
                                    userOW.IdUser = model.Usuario.Id;
                                    userOW.deleted = false;
                                    RepUserOW.Guardar(userOW);
                                }

                                if (Convert.ToInt32(PerEsp[0]) == 0 && Convert.ToInt32(PerEsp[1]) != 0 && Convert.ToInt32(PerEsp[2]) == 0)
                                {

                                    userOW.IdSmo = Convert.ToInt32(PerEsp[1]);
                                    userOW.IdOwner = null;
                                    userOW.IdBU = null;
                                    userOW.IdUser = model.Usuario.Id;
                                    userOW.deleted = false;
                                    RepUserOW.Guardar(userOW);
                                }

                                if (Convert.ToInt32(PerEsp[0]) == 0 && Convert.ToInt32(PerEsp[1]) == 0 && Convert.ToInt32(PerEsp[2]) == 0)
                                {

                                    userOW.IdSmo = null;
                                    userOW.IdOwner = null;
                                    userOW.IdBU = null;
                                    userOW.IdUser = model.Usuario.Id;
                                    userOW.deleted = false;
                                    RepUserOW.Guardar(userOW);
                                }


                            }

                            return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/UserBM';</script>");
                        }
                    }
                    else
                    {
                        mensError = "You must select at least one special permission";
                        Error = true;
                        ViewBag.ErrorPermiso = true;
                    }
                }
                else
                {
                    mensError = "You must select the User Role";
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
                mensError = "Complete the empty fields";
                return Content("<script language='javascript' type='text/javascript'>alert('" + mensError + "');document.location = 'javascript:window.history.back();';</script>");
            }
        }

        public static List<SelectListItem> RespSelectItem(List<SelectListItem> lsli, int idref)
        {
            int chosen = 0;
            LARCA2.Business.Services.UsuariosBLL repoUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.ResponsablesBLL repoResponsables = new LARCA2.Business.Services.ResponsablesBLL();
            string username;
            if (idref == 0)
                username = "";
            else
                username = repoResponsables.TraerSuNombreDeUsuario(idref);
            List<LARCA2.Data.DatabaseModels.LARCA20_Users> list = repoUsuarios.Todos();

            foreach (SelectListItem item in lsli)
            {
                if (item.Text == username)
                {
                    item.Selected = true;
                    chosen = 1;
                }
                else
                    item.Selected = false;
            }
            if (chosen == 0)
                lsli[0].Selected = true;

            return lsli;
        }

        public static List<SelectListItem> LeveSelectItem(List<SelectListItem> lsli, int idref)
        {

            LARCA2.Business.Services.Level4BLL repoNivel = new LARCA2.Business.Services.Level4BLL();
            List<LARCA2.Data.DatabaseModels.LARCA20_Level4> list = repoNivel.Todos();
            if (idref == null || idref == 0)
            {

                lsli[0].Selected = true;
                foreach (SelectListItem sli in lsli.Where(x => x.Value != "0").ToList())
                    sli.Selected = false;
                return lsli;

            }
            string levelName = list.Where(u => u.Id == idref).FirstOrDefault().name;
            foreach (SelectListItem item in lsli)
                item.Selected = (item.Text == levelName ? true : false);


            return lsli;
        }

        public ActionResult ModifUser(Larca2.Models.UserSearchForm userSearchForm, string txtIdRenglon)
        {
            long id = Int32.Parse(txtIdRenglon);
            Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();
            Business.Services.ResponsablesBLL repoResponsible = new Business.Services.ResponsablesBLL();
            Data.DatabaseModels.LARCA20_Users userdefault = repo.Traer(id);
            Larca2.Models.UserForm userForm = new Larca2.Models.UserForm();

            // Evaluacion de Responsable
            bool existe = true;
            if (repoResponsible.TraerPorNombreDeUsuario(userdefault.user_name) != null)
            {
                if (repoResponsible.TraerPorNombreDeUsuario(userdefault.user_name).deleted)
                {
                     existe = false;
                }
            }
            else
            {
                existe = false;
            }

            userForm.Responsible = existe;
            userForm.Usuario = userdefault;
            //userForm.Usuario.Clave = Larca2.Utilities.Crypto.Decrypt(userForm.Usuario.Clave);
            Business.Services.RolesBLL RepoRol = new Business.Services.RolesBLL();
            ViewBag.ComboRol = new SelectList(RepoRol.Todos(), "Id", "Description");

            Business.Services.UsuariosRolesBLL repRol = new Business.Services.UsuariosRolesBLL();
            List<Data.DatabaseModels.LARCA20_UsersRoles> UserRol = repRol.TodosFiltro(id.ToString(), "");
            ViewBag.RefIdRoles = UserRol[0].RefIdRoles.ToString();

            Business.Services.MasterDataBLL masterBU = new Business.Services.MasterDataBLL();
            ViewBag.MasterBU = new SelectList(masterBU.TraerSoloData("BU"), "id", "DataFin");

            Business.Services.MasterDataBLL masterSMO = new Business.Services.MasterDataBLL();
            ViewBag.MasterSMO = new SelectList(masterSMO.TraerSoloData("SMO"), "id", "DataFin");

            Business.Services.MasterDataBLL masterOW = new Business.Services.MasterDataBLL();
            ViewBag.MasterOW = new SelectList(masterOW.TraerSoloData("OWNER"), "id", "DataFin");

            ViewBag.ErrorPermiso = false;
            ViewBag.ErrorRol = false;
            ViewBag.ErrorUsuario = false;
            string ren = "";
            foreach (LARCA2.Data.DatabaseModels.LARCA20_User_Owner fila in userForm.Usuario.LARCA20_User_Owner)
            {
                if (fila.deleted == false)
                {
                    if (fila.IdBU != null && fila.IdSmo != null && fila.IdOwner != null)
                    {

                        if (ren == "")
                            ren = fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                        else
                            ren = ren + "/" + fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                    }

                    if (fila.IdBU != null && fila.IdSmo == null && fila.IdOwner == null)
                    {
                        fila.IdSmo = 0;
                        fila.IdOwner = 0;

                        if (ren == "")
                            ren = fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                        else
                            ren = ren + "/" + fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;

                    }

                    if (fila.IdBU == null && fila.IdSmo != null && fila.IdOwner == null)
                    {
                        fila.IdBU = 0;
                        fila.IdOwner = 0;

                        if (ren == "")
                            ren = fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                        else
                            ren = ren + "/" + fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                    }

                    if (fila.IdBU == null && fila.IdSmo == null && fila.IdOwner == null)
                    {
                        fila.IdBU = 0;
                        fila.IdSmo = 0;
                        fila.IdOwner = 0;

                        if (ren == "")
                            ren = fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                        //else
                        //    ren = ren + "/" + fila.IdBU + "." + fila.IdSmo + "." + fila.IdOwner;
                    }

                }
            }
            ViewBag.PermisosUser = ren;

            return View("ModifUser", userForm);
        }

        public ActionResult UserBM(string txtNombre, string txtApellido)
        {

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
            Larca2.Models.RcClasificationSearchForm RcClasificationSearchForm = new Larca2.Models.RcClasificationSearchForm();
            Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();

            if (txtCod != null & txtDes != null)
                RcClasificationSearchForm.RcClasificationList = repo.TodosFiltro(txtCod, txtDes);

            return View("RcClasificationBM", RcClasificationSearchForm);

        }

        public ActionResult ModifRcClasification(Larca2.Models.RcClasificationSearchForm model, string txtIdRenglon)
        {
            long id = Int32.Parse(txtIdRenglon);
            var repo = new Business.Services.RCClassificationBLL();
            var updated = repo.Traer(id);
            var edited = model.RcClasificationList.SingleOrDefault(m => m.Id == id);
            updated.level_name = edited.level_name;
            updated.Code = edited.Code;
            updated.Description = edited.Description;
            updated.Ownership = edited.Ownership;
            updated.deleted = edited.deleted;
            repo.Guardar(updated);
            return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/RcClasificationBM';</script>");

        }

        public ActionResult ModificarRcClasification(Larca2.Models.RcClasificationSearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();
                Data.DatabaseModels.LARCA20_RcClasification RcC = repo.Traer(model.RcClasification.Id);
                RcC.Id = model.RcClasification.Id;
                RcC.level_name = model.RcClasification.level_name;
                RcC.Code = model.RcClasification.Code;
                RcC.Description = model.RcClasification.Description;
                RcC.Ownership = (model.RcClasification.Ownership == null ? "" : model.RcClasification.Ownership);
                RcC.deleted = model.RcClasification.deleted;
                repo.Guardar(RcC);
                return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/RcClasificationBM';</script>");
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
                user.level_name = model.RcClasification.level_name;
                user.Code = model.RcClasification.Code;
                user.deleted = false;
                user.Description = model.RcClasification.Description;
                user.Ownership = (model.RcClasification.Ownership == null ? "" : model.RcClasification.Ownership);
                repo.Guardar(user);
                return Content("<script language='javascript' type='text/javascript'>alert('Se guardo con éxito');document.location = '../Adm/RcClasificationBM';</script>");
            }
            else
            {
                return View("NuevoRcClasification", model);
            }
        }

        #endregion

        #region <AuxData>

        public ActionResult AuxDataBM()
        {
            Larca2.Models.AuxDataSearchForm AuxDataSearchForm = new Larca2.Models.AuxDataSearchForm();
            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();

            AuxDataSearchForm.AuxData = repo.Traer(1);
            return View("AuxDataBM", AuxDataSearchForm);
        }


        public ActionResult ModifAuxData(Larca2.Models.AuxDataSearchForm AuxDataSearchForm)
        {
            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            Data.DatabaseModels.LARCA20_AuxData userdefault = repo.Traer(1);
            Larca2.Models.AuxDataSearchForm userForm = new Larca2.Models.AuxDataSearchForm();
            userForm.AuxData = userdefault;
            return View("ModifAuxData", userForm);
        }

        public ActionResult ModificarAuxData(Larca2.Models.AuxDataSearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();

                if (model.AuxData.TopLvl2 == 0)
                    return Content("<script language='javascript' type='text/javascript'>alert('You should enter a value higher to zero for the field: Top Level 2');document.location = 'javascript:window.history.back();';</script>");
                if (model.AuxData.TopLvl3 == 0)
                    return Content("<script language='javascript' type='text/javascript'>alert('You should enter a value higher to zero for the field: Top Level 3');document.location = 'javascript:window.history.back();';</script>");
                if (model.AuxData.Toplvl4 == 0)
                    return Content("<script language='javascript' type='text/javascript'>alert('You should enter a value higher to zero for the field: Max Allowed Cloning');document.location = 'javascript:window.history.back();';</script>");
                if (model.AuxData.qtyattach == 0)
                    return Content("<script language='javascript' type='text/javascript'>alert('You should enter a value higher to zero for the field: Expected Report Subscriptions');document.location = 'javascript:window.history.back();';</script>");

                Data.DatabaseModels.LARCA20_AuxData auxData = new Data.DatabaseModels.LARCA20_AuxData();
                auxData.RowId = model.AuxData.RowId;
                auxData.TopLvl2 = model.AuxData.TopLvl2;
                auxData.TopLvl3 = model.AuxData.TopLvl3;
                auxData.Toplvl4 = model.AuxData.Toplvl4;
                auxData.XlsRowFrom = model.AuxData.XlsRowFrom;
                auxData.XlsColumnFrom = model.AuxData.XlsColumnFrom;
                auxData.qtyattach = model.AuxData.qtyattach;
                auxData.reportdays = model.AuxData.reportdays;
                auxData.SmoDays = model.AuxData.SmoDays;
                repo.Guardar(auxData);

                return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/AuxDataBM';</script>");
            }
            else
            {
                return View("ModificarAuxData", model);
            }
        }

        #endregion

        #region <MasterData>

        public ActionResult MasterDataBM(string txtCod, string txtDes, string txtId, string txtTodos, string ddlGrupos)
        {
            Larca2.Models.MasterDataSearchForm MasterDataSearchForm = new Larca2.Models.MasterDataSearchForm();
            Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();

            if (ddlGrupos != "0")
            {
                MasterDataSearchForm.MasterDataList = repo.TodosFiltro(string.Empty, string.Empty, ddlGrupos);
            }
            else
            {
                if (txtId.Length > 0)
                {
                    MasterDataSearchForm.MasterDataList = repo.TodosFiltro(txtId, string.Empty, ddlGrupos);
                }
                else
                {
                    if (txtDes.Length > 0)
                    {
                        MasterDataSearchForm.MasterDataList = repo.TodosFiltro(string.Empty, txtDes, ddlGrupos);
                    }
                    else
                    {
                        MasterDataSearchForm.MasterDataList = new List<LARCA20_MasterData>();
                    }
                }
            }
            return View("MasterDataBM", MasterDataSearchForm);

        }

        public ActionResult NuevaMasterData()
        {
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
                return Content("<script language='javascript' type='text/javascript'>alert('Saved!');document.location = '../Adm/MasterDataBM';</script>");
            }
            else
            {
                return View("NuevoMasterData", model);
            }
        }

        public ActionResult ModifMasterData(Larca2.Models.MasterDataSearchForm model, string txtIdRenglon, string ddlGrupos, string txtType, string txtDataFin)
        {
            if (txtType == "Edit")
            {
                long id = Int32.Parse(txtIdRenglon);
                Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();
                Data.DatabaseModels.LARCA20_MasterData RcMasterData = repo.Traer(id);
                Larca2.Models.MasterDataSearchForm RcCForm = new Larca2.Models.MasterDataSearchForm();
                RcCForm.MasterData = RcMasterData;
                ViewBag.Grupo = RcMasterData.Data;
                return View("ModifMasterData", RcCForm);
            }
            else
            {
                if (txtType == "Save")
                {
                    long id = Int32.Parse(txtIdRenglon);
                    Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();
                    Data.DatabaseModels.LARCA20_MasterData masterData = repo.Traer(id);
                    masterData.Data = masterData.Data;
                    masterData.DataIni = masterData.DataIni;
                    masterData.DataFin = model.MasterDataList.SingleOrDefault(m => m.id == id).DataFin;
                    repo.Guardar(masterData);
                    return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/MasterDataBM';</script>");
                }
                else
                {
                    return View("MasterDataBM", model);
                }
            }
        }

        public ActionResult ModificarMasterData(Larca2.Models.MasterDataSearchForm model)
        {
            if (ModelState.IsValid)
            {
                Business.Services.MasterDataBLL repo = new Business.Services.MasterDataBLL();
                Data.DatabaseModels.LARCA20_MasterData MsD = repo.Traer(model.MasterData.id);
                MsD.id = model.MasterData.id;
                MsD.Data = model.MasterData.Data;
                MsD.DataIni = model.MasterData.DataIni;
                MsD.DataFin = model.MasterData.DataFin;
                MsD.deleted = model.MasterData.deleted;
                repo.Guardar(MsD);
                return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/MasterDataBM';</script>");
            }
            else
            {
                return View("ModifMasterData", model);
            }
        }

        #endregion

        #region <level4>

        public ActionResult Level4(string txtNivel, string txtLimite)
        {


            Larca2.Models.Level4SearchForm Level4SearchForm = new Larca2.Models.Level4SearchForm();
            Business.Services.RCClassificationBLL repo = new Business.Services.RCClassificationBLL();
            Business.Services.Level4BLL repo_level4 = new Business.Services.Level4BLL();
            Business.Services.ApplicationDataBLL repo_Aux = new Business.Services.ApplicationDataBLL();

            Data.DatabaseModels.LARCA20_AuxData Auxdefault = repo_Aux.Traer(1);

            if (Auxdefault != null && Auxdefault.filterlimit != null)
            {
                int Limite = (int)Auxdefault.filterlimit;
                Level4SearchForm.filterlimit = Limite;
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
            if (model.Level4.name != null)
            {
                Business.Services.Level4BLL repo = new Business.Services.Level4BLL();
                Data.DatabaseModels.LARCA20_Level4 RcC = repo.Traer(model.Level4.Id);
                RcC.name = model.Level4.name;
                repo.Guardar(RcC);
                return Content("<script language='javascript' type='text/javascript'>alert('Changes Saved!');document.location = '../Adm/Level4';</script>");

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

            if (model.Level4.name != null)
            {
                long RefIdRenglon = Int32.Parse(txtNivel);

                Business.Services.Level4BLL repo = new Business.Services.Level4BLL();
                Data.DatabaseModels.LARCA20_Level4 user = new Data.DatabaseModels.LARCA20_Level4();

                user.RefIdLevel3 = RefIdRenglon;
                user.deleted = false;
                user.name = model.Level4.name;
                repo.Guardar(user);
                return Content("<script language='javascript' type='text/javascript'>alert('Saved!');document.location = '../Adm/Level4';</script>");

            }

            else
            {
                return View("NuevoLevel4", model);
            }
        }


        #endregion

    }
}
