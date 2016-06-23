using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LARCA2.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            LARCA2.Data.DatabaseModels.LARCA20_Usuarios usuario = (LARCA2.Data.DatabaseModels.LARCA20_Usuarios)Session["Usuario"];
            if (usuario == null)
                return Content("<script language='javascript' type='text/javascript'>document.location = '../Login/Login';</script>");

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
