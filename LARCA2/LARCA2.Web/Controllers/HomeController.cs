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
            var user = (WindowsPrincipal)User;
            LARCA2.Business.Services.UsuariosBLL repositorioUsuarios = new LARCA2.Business.Services.UsuariosBLL();
            LARCA2.Business.Services.RolesBLL repositorioRoles = new LARCA2.Business.Services.RolesBLL();

            LARCA20_Usuarios usuario = repositorioUsuarios.TraerPorNombreDeUsuario(user.Identity.Name.Split(Convert.ToChar("\\"))[1]);
            //LARCA20_Usuarios usuario = repositorioUsuarios.TraerPorNombreDeUsuario("wiedemann.e");

            if (usuario == null)
            {
                return Content("<script language='javascript' type='text/javascript'>alert('Invalid USER');</script>");
            }
            Session["Usuario"] = usuario;
            ViewData["Modal"] = "<script language='javascript' type='text/javascript'>$('#modalTest').modal('show')</script>";
            ViewBag.Message = "QA Version.";
            return View();
        }
    }
}
