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
            var user = (WindowsPrincipal)User;
            //HttpCookie myCookie;
            LARCA2.Business.Services.UsuariosBLL repositorioUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.RolesBLL repositorioRoles = new LARCA2.Business.Services.RolesBLL();

            //LARCA20_Usuarios usuario = repositorioUsuarios.TraerPorNombreDeUsuario(user.Identity.Name.Split(Convert.ToChar("\\"))[1]);
            LARCA20_Usuarios usuario = repositorioUsuarios.TraerPorNombreDeUsuario("wiedemann.e");

            if (usuario == null)
            {
                return Content("<script language='javascript' type='text/javascript'>alert('Invalid USER');</script>");
            }
            Session["Usuario"] = usuario;
            //if (user.IsInRole(WindowsBuiltInRole.Administrator))
            //{
            //    //user is an administrator
            //}
            //LARCA2.Data.DatabaseModels.LARCA20_Usuarios usuario = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            //if (usuario == null)
            //    return Content("<script language='javascript' type='text/javascript'>document.location = '../Login/Login';</script>");

            ViewData["Modal"] = "<script language='javascript' type='text/javascript'>$('#modalTest').modal('show')</script>";
            ViewBag.Message = "QA Version.";
            return View();
        }

        public ActionResult Salir()
        {
            Session["Usuario"] = null;
            return RedirectToAction("Login", "Login");
            
        }
    }
}
