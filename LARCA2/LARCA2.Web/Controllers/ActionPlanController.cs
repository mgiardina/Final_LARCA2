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
    public class ActionPlanController : Controller
    {
        public ActionResult Index()
        {
            var model = new Larca2.Views.ViewModels.SMOScopeViewModel();
            try
            {
                ViewData["MasterRows"] = new SMOScopeBLL().Todos().Where(smo => smo.O_C.ToUpper() == "O" && (smo.Problem == string.Empty || smo.Problem == null)).ToList();
            }
            catch
            {
                ViewData["MasterRows"] = new List<LARCA20_SmoScope>();
            }

            return View(model);
        }

        public ActionResult Export()
        {
            var masterData = new SMOScopeBLL().Todos().Where(smo => smo.O_C.ToUpper() == "O" && (smo.Problem == string.Empty || smo.Problem == null)).ToList();
            var file = new ExcelCore().GenerarActionReport("LARCA Action Plan Report", masterData);
            DownloadFile(file);
            return Content("<script language='javascript' type='text/javascript'>alert('Exported!');document.location = 'Index';</script>");
        }

        private void DownloadFile(string file)
        {
            byte[] Content = System.IO.File.ReadAllBytes(file);
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            var random = new Random().Next(0, 10000);
            Response.AddHeader("content-disposition", "attachment; filename=" + "LARCAActionPlanReport_" + random + ".xlsx");
            Response.BufferOutput = true;
            Response.OutputStream.Write(Content, 0, Content.Length);
            Response.End();
        }

    }
}
