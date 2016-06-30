using LARCA2.Business.Core;
using LARCA2.Data.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace LARCA2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //new MailingCore().ProcesarEmails();
            new MailingCore().test();
            var user = (WindowsPrincipal)User;
            LARCA2.Business.Services.UsuariosBLL repositorioUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.RolesBLL repositorioRoles = new LARCA2.Business.Services.RolesBLL();

            LARCA20_Usuarios usuario = repositorioUsuarios.TraerPorNombreDeUsuario(user.Identity.Name.Split(Convert.ToChar("\\"))[1]);
            //LARCA20_Usuarios usuario = repositorioUsuarios.TraerPorNombreDeUsuario("wiedemann.e");

            if (usuario == null)
            {
                return RedirectToAction("InvalidUser", "Home");
            }

            Session["Usuario"] = usuario;
            ViewData["Modal"] = "<script language='javascript' type='text/javascript'>$('#modalTest').modal('show')</script>";
            ViewBag.Message = "QA Version.";
            return View();
        }

        public ActionResult InvalidUser()
        {
            long id = 1;
            Business.Services.UsuariosBLL repo = new Business.Services.UsuariosBLL();
            Data.DatabaseModels.LARCA20_Usuarios userRol = repo.Traer(id);
            ViewBag.Email = userRol.Email;
            return View();
        }
    }
}
