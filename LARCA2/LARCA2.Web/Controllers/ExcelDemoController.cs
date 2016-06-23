using LARCA2.Business.Core;
using LARCA2.Business.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LARCA2.Controllers
{
    public class ExcelDemoController : Controller
    {
        public ActionResult Index()
        {
            // A modo de ejemplo, retornamos la lista de registros importados del primer email encontrado
            var masterRows = new MailingCore().ProcesarEmails();
            ViewBag.Message = masterRows.Count;
            ViewData["MasterRows"] = masterRows;
            return View();
        }
    }
}
