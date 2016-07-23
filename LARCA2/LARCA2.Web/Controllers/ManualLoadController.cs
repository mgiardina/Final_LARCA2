using LARCA2.Business.Core;
using LARCA2.Business.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Larca2.Controllers
{
    public class ManualLoadController : Controller
    {
        //
        // GET: /ManualLoad/

        public ActionResult Index()
        {
            if (ViewData["MasterRows"] == null)
                ViewData["MasterRows"] = new List<MasterRow>();
            return View();
        }
        public ActionResult Upload(Larca2.Views.ViewModels.ManualUploadViewModel model)
        {
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];

                if (file != null && file.ContentLength > 0 && new MailingCore().GetXmlMimes().Exists(s => s == file.ContentType))
                {
                    // Generamos el archivo fisico y lo guardamos en un directorio
                    var date = DateTime.Now.ToString("ddMMMyyy");
                    var random = new Random().Next(0, 1000);
                    string fileName = String.Format("Manual_{0}_MasterData_{1}.xlsx", date, random);
                    string filePath = Path.Combine(Server.MapPath("~/App_Data/"), fileName);
                    file.SaveAs(filePath);
                    ViewBag.Result = "File Uploaded and Processed!";
                    if (!model.Parcial)
                    {
                        var rows = new ExcelCore().ProcesarExcel(fileName, TipoProceso.Total);
                        ViewData["MasterRows"] = rows;
                        ViewBag.Result = rows.Count > 0 ? "Complete File Uploaded and Processed!" : "No Rows Processed. Check XLS Reading Parameters.";
                    }
                        
                    else
                    {
                        var rows = new ExcelCore().ProcesarExcel(fileName, TipoProceso.Parcial);
                        ViewData["MasterRows"] = rows;
                        ViewBag.Result = rows.Count > 0 ? "Partial File Uploaded and Processed!" : "No Rows Processed. Check XLS Reading Parameters.";
                    }
                }
                else
                {
                    ViewBag.Result = "Invalid File! Try again.";
                }
            }

            if (ViewData["MasterRows"] == null)
                ViewData["MasterRows"] = new List<MasterRow>();
            return View("Index");
        }

    }
}
