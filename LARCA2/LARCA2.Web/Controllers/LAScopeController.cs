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
    public class LAScopeController : Controller
    {

        public ActionResult NewsSMO()
        {
            var model = new Larca2.Views.ViewModels.LAScopeViewModel();
            model.SMOList = model.SMOList.Where(x => model.Permisos.Exists(y => y.LARCA20_MasterData1.DataFin.ToString() == x.Value) || x.Value == "0").ToList();
            model.BUList = model.BUList.Where(x => model.Permisos.Exists(y => y.LARCA20_MasterData.DataFin.ToString() == x.Value) || x.Value == "0").ToList();
            var masterRows = new List<ReportRow>();
            ViewData["MasterRows"] = masterRows;
            return View(model);
        }

        public ActionResult NewsRBU()
        {
           var model = new Larca2.Views.ViewModels.LAScopeViewModel();
           model.SMOList = model.SMOList.Where(x => model.Permisos.Exists(y => y.LARCA20_MasterData1.DataFin.ToString() == x.Value) || x.Value == "0").ToList();
           model.BUList = model.BUList.Where(x => model.Permisos.Exists(y => y.LARCA20_MasterData.DataFin.ToString() == x.Value) || x.Value == "0").ToList();
            var masterRows = new List<ReportRow>();
            ViewData["MasterRows"] = masterRows;
            return View(model);
        }

        public ActionResult NewsREGION()
        {
            var model = new Larca2.Views.ViewModels.LAScopeViewModel();
            model.SMOList = model.SMOList.Where(x => model.Permisos.Exists(y => y.LARCA20_MasterData1.DataFin.ToString() == x.Value) || x.Value == "0").ToList();
            model.BUList = model.BUList.Where(x => model.Permisos.Exists(y => y.LARCA20_MasterData.DataFin.ToString() == x.Value) || x.Value == "0").ToList();
            var masterRows = new List<ReportRow>();
            ViewData["MasterRows"] = masterRows;
            return View(model);
        }

        public ActionResult NewsSMOFilter(Larca2.Views.ViewModels.LAScopeViewModel model, string command)
        {
            var smo = model.smo;
            var masterRows = new ReportsBLL().LARCANews(smo, string.Empty, model.Permisos);
            if (command.Equals("Export Excel"))
            {
                var file = new ExcelCore().GenerarExcel("LARCA News - SMO", masterRows);
                // Download
                DownloadFile(file);
            }
            else
            {
                if (command.Equals("Send Email"))
                {
                    var file = new ExcelCore().GenerarExcel("LARCA News - SMO", masterRows);
                    new MailingCore().EnviarReporte(file);
                    ViewBag.Result = "Archivo exportado y enviado correctamente.";
                }
            }
        
            ViewData["MasterRows"] = masterRows;
            return View("NewsSMO", model);
        }

        public ActionResult NewsRBUFilter(Larca2.Views.ViewModels.LAScopeViewModel model, string command)
        {
            var bu = model.rbu;
            var masterRows = new ReportsBLL().LARCANews(string.Empty, bu, model.Permisos);
            if (command.Equals("Export Excel"))
            {
                var file = new ExcelCore().GenerarExcel("LARCA News - RBU", masterRows);
                // Download
                DownloadFile(file);
            }
            else
            {
                if (command.Equals("Send Email"))
                {
                    var file = new ExcelCore().GenerarExcel("LARCA News - RBU", masterRows);
                    new MailingCore().EnviarReporte(file);
                    ViewBag.Result = "Archivo exportado y enviado correctamente.";
                }
            }
            ViewData["MasterRows"] = masterRows;
            return View("NewsRBU", model);
        }

        public ActionResult NewsREGIONFilter(Larca2.Views.ViewModels.LAScopeViewModel model, string command)
        {
            var regionId = model.regionId;
            var masterRows = new ReportsBLL().LARCANews(regionId, model.Permisos);
            if (command.Equals("Export Excel"))
            {
                var file = new ExcelCore().GenerarExcel("LARCA News - Region", masterRows);
                // Download
                DownloadFile(file);
            }
            else
            {
                if (command.Equals("Send Email"))
                {
                    var file = new ExcelCore().GenerarExcel("LARCA News - Region", masterRows);
                    new MailingCore().EnviarReporte(file);
                    ViewBag.Result = "Archivo exportado y enviado correctamente.";
                }
            }
            ViewData["MasterRows"] = masterRows;
            return View("NewsREGION", model);
        }

        private void DownloadFile(string file)
        {
            byte[] Content = System.IO.File.ReadAllBytes(file);
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            var random = new Random().Next(0, 10000);
            Response.AddHeader("content-disposition", "attachment; filename=" + "LARCANewsReport_" + random + ".xlsx");
            Response.BufferOutput = true;
            Response.OutputStream.Write(Content, 0, Content.Length);
            Response.End();
        }

    }
}
