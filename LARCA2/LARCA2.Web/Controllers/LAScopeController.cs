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
        public ActionResult Index()
        {
            var model = new Larca2.Views.ViewModels.LAScopeViewModel();
            var masterRows = new List<ReportRow>();
            ViewData["MasterRows"] = masterRows;
            return View(model);
        }

        public ActionResult LarcaNewsProcess(Larca2.Views.ViewModels.LAScopeViewModel model, string command, string txtType)
        {
            var smo = model.smo;
            var rbu = model.rbu;
            var type = txtType;
            var masterRows = new List<ReportRow>();
            switch (command)
            {
                case "Filter by BU":
                    masterRows = new ReportsBLL().LARCANews(string.Empty, rbu, string.Empty);
                    break;
                case "Filter by SMO":
                    if (smo != "1" && smo != "2")
                    {
                        masterRows = new ReportsBLL().LARCANews(smo, string.Empty, string.Empty);
                    }
                    else
                    {
                        masterRows = new ReportsBLL().LARCANews(string.Empty, string.Empty, smo);
                    }
                    break;
            }

            if (command.Equals("Export Excel"))
            {
                if (rbu != "0")
                {
                    masterRows = new ReportsBLL().LARCANews(string.Empty, rbu, string.Empty);
                }
                else
                {
                    if (smo != "1" && smo != "2")
                    {
                        masterRows = new ReportsBLL().LARCANews(smo, string.Empty, string.Empty);
                    }
                    else
                    {
                        masterRows = new ReportsBLL().LARCANews(string.Empty, string.Empty, smo);
                    }
                }
                var file = new ExcelCore().GenerarExcel("LARCA News", masterRows);
                // Download
                DownloadFile(file);
            }
            else
            {
                if (command.Equals("Send Email"))
                {
                    string datafin = "";
                    if (rbu != "0")
                    {
                        masterRows = new ReportsBLL().LARCANews(string.Empty, rbu, string.Empty);
                        datafin = rbu;
                    }
                    else
                    {
                        if (smo != "1" && smo != "2")
                        {
                            masterRows = new ReportsBLL().LARCANews(smo, string.Empty, string.Empty);
                            datafin = smo;
                        }
                        else
                        {
                            masterRows = new ReportsBLL().LARCANews(string.Empty, string.Empty, smo);
                            datafin = smo;
                        }
                    }

                    var file = new ExcelCore().GenerarExcel("LARCA News", masterRows);
                    new MailingCore().EnviarReporte(file, datafin);
                    ViewBag.Result = "File Exported and sent!.";
                }
                else
                {
                    if (command.Equals("Send All Reports"))
                    {
                        foreach(var item in model.SMOList)
                        {
                            if (item.Text == "LA")
	                        {
                                item.Value = "1";
                                masterRows = new ReportsBLL().LARCANews(string.Empty, string.Empty, item.Value);
                                var file = new ExcelCore().GenerarExcel("LARCA News", masterRows);
                                new MailingCore().EnviarReporte(file, item.Text);
	                        }
                            else
                            {
                                masterRows = new ReportsBLL().LARCANews(item.Value, string.Empty, string.Empty);
                                var file2 = new ExcelCore().GenerarExcel("LARCA News", masterRows);
                                new MailingCore().EnviarReporte(file2, item.Text);
                            }    

                        }

                        foreach (var item in model.BUList)
                        {
                            masterRows = new ReportsBLL().LARCANews(string.Empty, item.Value, string.Empty);
                            var file = new ExcelCore().GenerarExcel("LARCA News", masterRows);
                            new MailingCore().EnviarReporte(file, item.Text);
                        }
                        ViewBag.Result = "Multiple Files Exported and sent!.";
                    }
                }
            }

            ViewData["MasterRows"] = masterRows;
            return View("Index", model);
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
