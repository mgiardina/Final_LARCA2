using ClosedXML.Excel;
using Excel;
using LARCA2.Business.Entities;
using LARCA2.Business.Services;
using LARCA2.Data;
using LARCA2.Data.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace LARCA2.Business.Core
{
    /// <summary>
    /// Clase que se encargara del proceso de importación y transformación del Excel 
    /// </summary>
    public class ExcelCore
    {
        public List<MasterRow> ProcesarExcel(string file, TipoProceso tipoProceso)
        {
            var list = new List<MasterRow>();
            try
            {
                string filePath = Path.Combine(HttpContext.Current.Server.MapPath("~/App_Data/"), file);
                var stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
                var excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);

                // Levanto de la tabla de datos generales desde que fila hay que empezar a leer
                for (int i = 1; i <= new ApplicationDataBLL().TraeXlsRowFrom(); i++)
                {
                    excelReader.Read();
                }
                while (excelReader.Read())
                {
                    // Levanto de la tabla de datos generales desde que columna ahora tengo que empezar a leer
                    int indice = new ApplicationDataBLL().TraeXlsColumnFrom();
                    // Levanto solamente los registros que tengan la ultima columna mayor a 0
                    if (excelReader[indice + 8] != null && Convert.ToDecimal(excelReader[indice + 8]) != 0)
                    {
                        // Armo un objeto MasterRow y va a la Lista
                        var masterRow = new MasterRow();
                        masterRow.Day = excelReader[indice] == null ? string.Empty : excelReader[indice].ToString();
                        masterRow.FPC = excelReader[indice + 1] == null ? string.Empty : excelReader[indice + 1].ToString();
                        masterRow.ReportingCountry = excelReader[indice + 2] == null ? string.Empty : excelReader[indice + 2].ToString();
                        masterRow.ProfitCenter = excelReader[indice + 3] == null ? string.Empty : excelReader[indice + 3].ToString();
                        masterRow.ReasonCode = excelReader[indice + 4] == null ? string.Empty : excelReader[indice + 4].ToString();
                        masterRow.RootCauseCode = excelReader[indice + 5] == null ? string.Empty : excelReader[indice + 5].ToString();
                        masterRow.SAPSite = excelReader[indice + 6] == null ? string.Empty : excelReader[indice + 6].ToString();
                        masterRow.Customer = excelReader[indice + 7] == null ? string.Empty : excelReader[indice + 7].ToString();
                        masterRow.SUCases = Convert.ToDecimal(excelReader[indice + 8]);
                        list.Add(masterRow);
                    }
                }
                excelReader.Close();

                // Limpiamos los historicos en caso de Proceso Total
                if (tipoProceso == TipoProceso.Total)
                {
                    new SMOScopeBLL().PasarDetallesHistoricos();
                    var lista = new SMOScopeBLL().Todos();
                    foreach (var smo in lista)
                    {
                        var newSmo = new LARCA20_SmoScope();
                        newSmo.SmoScopeID = smo.SmoScopeID;
                        newSmo.date = smo.date;
                        newSmo.RefIdSMO = smo.RefIdSMO;
                        newSmo.RefIdOwner = smo.RefIdOwner;
                        newSmo.RefIdBU = smo.RefIdBU;
                        newSmo.RefIdRC = smo.RefIdRC;
                        newSmo.Volumen = smo.Volumen;
                        newSmo.Problem = smo.Problem;
                        newSmo.Why1 = smo.Why1;
                        newSmo.Why2 = smo.Why2;
                        newSmo.Why3 = smo.Why3;
                        newSmo.ActionPlan = smo.ActionPlan;
                        newSmo.RefIdResponsable = smo.RefIdResponsable;
                        newSmo.DueDate = smo.DueDate;
                        newSmo.O_C = smo.O_C;
                        newSmo.deleted = smo.deleted;
                        newSmo.Level4 = smo.Level4;
                        newSmo.historic = true;
                        newSmo.clone = smo.clone;
                        newSmo.GroupId = smo.GroupId;
                        new SMOScopeBLL().PasarHistorico(newSmo);
                    }
                }

                var pp = "0.0";
                // Recorro la lista generada
                foreach (var item in list)
                {
                    //Parseo solo la parte que me interesa del RCC y a su vez por niveles spliteando por "."
                    var rcc = item.RootCauseCode.Split(Convert.ToChar(" "))[0].Split(Convert.ToChar("."));
                    var nivel1 = String.Format("{0}", rcc[0]);
                    var nivel2 = String.Format("{0}.{1}", rcc[0], rcc[1]);
                    var nivel3 = String.Format("{0}.{1}.{2}", rcc[0], rcc[1], rcc[2]);
                    // Chequeo que el nivel 2 no sea 3.4
                    if (nivel2 != "3.4")
                    {
                        // Armo objeto de detalle con la info convertida
                        try
                        {
                            var smoDetail = new LARCA20_SmoScopeDetail();
                            smoDetail.date = DateTime.Now;
                            smoDetail.OwnerID = new MasterDataBLL().Traer("OWNER", new RCClassificationBLL().Traer(nivel3).Ownership).id;
                            smoDetail.Volumen = item.SUCases / 1000;
                            smoDetail.Lvl2ID = new RCClassificationBLL().Traer(nivel2).Id;
                            smoDetail.Lvl3ID = new RCClassificationBLL().Traer(nivel3).Id;

                            // Chequeo si existe el Profit Center en la base, si existe lo asigno directo, sino lo damos de alta y avisamos al admin que debe cargar la descripcion correcta
                            if (!ExistsBU(item.ProfitCenter))
                            {
                                var service = new MasterDataBLL();
                                var masterRow = new LARCA2.Data.DatabaseModels.LARCA20_MasterData();
                                masterRow.DataIni = item.ProfitCenter;
                                masterRow.DataFin = string.Empty;
                                masterRow.Data = "BU";
                                masterRow.deleted = false;
                                service.Guardar(masterRow);
                                try
                                {
                                    new MailingCore().EnviarAlertaNuevoMasterData(masterRow.Data, masterRow.DataIni, masterRow.id.ToString());
                                }
                                catch
                                {

                                }
                            }
                            smoDetail.originaldate = item.Day;
                            smoDetail.FPC = item.FPC;
                            smoDetail.BuID = new MasterDataBLL().Traer("BU", item.ProfitCenter).id;
                            smoDetail.SmoID = new MasterDataBLL().Traer("SMO", item.ReportingCountry).id;
                            if (item.ReportingCountry == "COLOMBIA")
                            {
                                if ( item.ProfitCenter.Contains("HAIR"))
                                {
                                    pp = pp + smoDetail.Volumen;
                                }
                            }
                            smoDetail.ReasonID = new MasterDataBLL().TraerPorDataFin("REASON CODE", item.ReasonCode.Split(Convert.ToChar(" "))[0]).id;
                            smoDetail.Customer = item.Customer;
                            smoDetail.historic = false;
                            smoDetail.deleted = false;
                            smoDetail.grouped = false;

                            var detailService = new SMOScopeDetailBLL();
                            if (tipoProceso == TipoProceso.Parcial)
                            {
                                var dias = -new ApplicationDataBLL().TraerDias();
                                var dateDesde = DateTime.Now.AddDays(-7);
                                if (detailService.Existe(smoDetail.BuID , smoDetail.Customer, smoDetail.Lvl2ID, smoDetail.Lvl3ID, smoDetail.SmoID, smoDetail.Volumen, smoDetail.ReasonID, dateDesde))
                                    detailService.Guardar(smoDetail);
                            }
                            else
                            {
                                detailService.Guardar(smoDetail);
                            }
                        }
                        catch (Exception ex)
                        {
                            // Loggear Error
                        }
                    }
                }

                //aca se asigna a los details creados el nuevo smo. si existia un smo igual antes, se lo hace historic.

                if (tipoProceso == TipoProceso.Total)
                {
                    if (RealizarCalculosTotal(new SMOScopeDetailBLL().Todos()))
                    {
                        try
                        {
                            new MailingCore().EnviarAlertaAnalysisDisponible_Admin();
                        }
                        catch
                        {

                        }
                    }
                    else
                    {
                        try
                        {
                            new MailingCore().EnviarAlertaErrorEnCarga();
                        }
                        catch
                        {

                        }
                    }
                }
                else
                {
                    if (RealizarCalculosParcial(new SMOScopeDetailBLL().Todos()))
                    {
                        try
                        {
                            new MailingCore().EnviarAlertaAnalysisDisponible_Admin();
                        }
                        catch
                        {

                        }
                    }
                    else
                    {
                        try
                        {
                            new MailingCore().EnviarAlertaErrorEnCarga();
                        }
                        catch
                        {

                        }
                    }
                }
                
            }
            catch (Exception ex)
            {
                // Loggear Error
                new MailingCore().EnviarAlertaErrorEnCarga();
            }
            return list;
        }

        private bool ExistsDetail(LARCA20_SmoScopeDetail detail)
        {
            var service = new SMOScopeDetailBLL();
            var dias = -new ApplicationDataBLL().TraerDias();
            var dateDesde = DateTime.Now.AddDays(dias);
            return service.Existe(detail.BuID, detail.Customer, detail.Lvl2ID, detail.Lvl3ID, detail.SmoID, detail.Volumen, detail.ReasonID, dateDesde);
        }

        private bool ExistsBU(string product)
        {
            return new MasterDataBLL().Traer("BU", product) != null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="reporte"></param>
        /// <param name="lista"></param>
        /// <returns></returns>
        public string GenerarExcel(string reporte, List<ReportRow> lista)
        {
            var date = DateTime.Now.ToString("ddMMMyyy");
            var random = new Random().Next(0, 1000);
            string fileName = String.Format("{0}_Report_{1}.xlsx", date, random);

            var wb = new XLWorkbook();
            var ws = wb.Worksheets.Add(reporte);

            int row = 4;
            // Titulos
            ws.Cell(1, 1).Value = reporte;
            ws.Cell(3, 1).Value = "RBU";
            ws.Cell(3, 2).Value = "SMO";
            ws.Cell(3, 3).Value = "Cut Classification";
            ws.Cell(3, 4).Value = "Other Classification";
            ws.Cell(3, 5).Value = "Volume";
            ws.Cell(3, 6).Value = "% in GAP";
            ws.Cell(3, 7).Value = "Problem Statement";
            ws.Cell(3, 8).Value = "Why";
            ws.Cell(3, 9).Value = "Why";
            ws.Cell(3, 10).Value = "Why";
            ws.Cell(3, 11).Value = "Action Plan";
            ws.Cell(3, 12).Value = "Responsible";
            ws.Cell(3, 13).Value = "GAP Analysis";

            var rngHeaders = ws.Range("A3:M3");
            rngHeaders.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
            rngHeaders.Style.Font.Bold = true;
            rngHeaders.Style.Font.FontColor = XLColor.White;
            rngHeaders.Style.Fill.BackgroundColor = XLColor.DarkBlue;

            // Contenido Filas Grises
            foreach (var item in lista)
            {
                ws.Cell(row, 1).Value = item.RBU;
                ws.Cell(row, 1).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 1).Style.Font.Bold = true;
                ws.Cell(row, 1).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 1).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 2).Value = item.SMO;
                ws.Cell(row, 2).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 2).Style.Font.Bold = true;
                ws.Cell(row, 2).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 2).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 3).Value = item.CUT;
                ws.Cell(row, 3).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 3).Style.Font.Bold = true;
                ws.Cell(row, 3).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 3).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 4).Value = item.LEVEL4;
                ws.Cell(row, 4).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 4).Style.Font.Bold = true;
                ws.Cell(row, 4).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 4).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 5).Value = item.VOLUME;
                ws.Cell(row, 5).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 5).Style.Font.Bold = true;
                ws.Cell(row, 5).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 5).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 6).Value = item.GAP;
                ws.Cell(row, 6).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 6).Style.Font.Bold = true;
                ws.Cell(row, 6).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 6).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 7).Value = item.PROBLEM;
                ws.Cell(row, 7).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 7).Style.Font.Bold = true;
                ws.Cell(row, 7).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 7).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 8).Value = item.WHY1;
                ws.Cell(row, 8).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 8).Style.Font.Bold = true;
                ws.Cell(row, 8).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 8).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 9).Value = item.WHY2;
                ws.Cell(row, 9).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 9).Style.Font.Bold = true;
                ws.Cell(row, 9).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 9).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 10).Value = item.WHY3;
                ws.Cell(row, 10).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 10).Style.Font.Bold = true;
                ws.Cell(row, 10).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 10).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 11).Value = item.ACTIONPLAN;
                ws.Cell(row, 11).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 11).Style.Font.Bold = true;
                ws.Cell(row, 11).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 11).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 12).Value = item.RESPONSIBLE;
                ws.Cell(row, 12).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 12).Style.Font.Bold = true;
                ws.Cell(row, 12).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 12).Style.Fill.BackgroundColor = XLColor.Gray;

                ws.Cell(row, 13).Value = item.GAPANALYSIS;
                ws.Cell(row, 13).Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
                ws.Cell(row, 13).Style.Font.Bold = true;
                ws.Cell(row, 13).Style.Font.FontColor = XLColor.White;
                ws.Cell(row, 13).Style.Fill.BackgroundColor = XLColor.Gray;

                row++;

                //Ahora agregamos las Filas hijas de las Grises

                foreach (var subitem in item.Details)
                {
                    ws.Cell(row, 1).Value = subitem.RBU;
                    ws.Cell(row, 2).Value = subitem.SMO;
                    ws.Cell(row, 3).Value = subitem.CUT;
                    ws.Cell(row, 4).Value = subitem.LEVEL4;
                    ws.Cell(row, 5).Value = subitem.VOLUME;
                    ws.Cell(row, 6).Value = subitem.GAP;
                    ws.Cell(row, 7).Value = subitem.PROBLEM;
                    ws.Cell(row, 8).Value = subitem.WHY1;
                    ws.Cell(row, 9).Value = subitem.WHY2;
                    ws.Cell(row, 10).Value = subitem.WHY3;
                    ws.Cell(row, 11).Value = subitem.ACTIONPLAN;
                    ws.Cell(row, 12).Value = subitem.RESPONSIBLE;
                    ws.Cell(row, 13).Value = subitem.GAPANALYSIS;
                    row++;
                }
            }

            ws.Columns(1, 13).AdjustToContents();

            //Save
            var path = Path.Combine(HttpContext.Current.Server.MapPath("~/App_Data/Reports/"), fileName);
            wb.SaveAs(path);

            return path;
        }

        public string GenerarActionReport(string reporte, List<LARCA20_SmoScope> lista)
        {
            var date = DateTime.Now.ToString("ddMMMyyy");
            var random = new Random().Next(0, 1000);
            string fileName = String.Format("{0}_Report_{1}.xlsx", date, random);

            var wb = new XLWorkbook();
            var ws = wb.Worksheets.Add(reporte);

            int row = 4;
            // Titulos
            ws.Cell(1, 1).Value = reporte;
            ws.Cell(3, 1).Value = "Volume";
            ws.Cell(3, 2).Value = "SMO";
            ws.Cell(3, 3).Value = "BU";
            ws.Cell(3, 4).Value = "Root Cause";
            ws.Cell(3, 5).Value = "Other classification";
            ws.Cell(3, 6).Value = "Problem Statement";
            ws.Cell(3, 7).Value = "Why 1";
            ws.Cell(3, 8).Value = "Why 2";
            ws.Cell(3, 9).Value = "Why 3";
            ws.Cell(3, 10).Value = "Action Plan";
            ws.Cell(3, 11).Value = "Responsible";
            ws.Cell(3, 12).Value = "Due Date";
            ws.Cell(3, 13).Value = "Open or Closed";

            var rngHeaders = ws.Range("A3:M3");
            rngHeaders.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
            rngHeaders.Style.Font.Bold = true;
            rngHeaders.Style.Font.FontColor = XLColor.White;
            rngHeaders.Style.Fill.BackgroundColor = XLColor.DarkBlue;

            // Contenido Filas Grises
            foreach (var item in lista)
            {
                ws.Cell(row, 1).Value = (Math.Round(decimal.Parse(item.Volumen.ToString()), 2)).ToString();
                ws.Cell(row, 2).Value = item.MasterSMO.DataFin;
                ws.Cell(row, 3).Value = item.MasterBU.DataFin;
                ws.Cell(row, 4).Value = new Business.Services.RCClassificationBLL().Traer(item.RefIdRC.Value).Description;
                ws.Cell(row, 5).Value = item.Level4 != null && item.Level4 != 0 ? new Business.Services.Level4BLL().Traer(item.Level4.Value).name : string.Empty;
                ws.Cell(row, 6).Value = item.Problem;
                ws.Cell(row, 7).Value = item.Why1;
                ws.Cell(row, 8).Value = item.Why2;
                ws.Cell(row, 9).Value = item.Why3;
                ws.Cell(row, 10).Value = item.ActionPlan;
                ws.Cell(row, 11).Value = item.RefIdResponsable != null && item.RefIdResponsable != 0 ? new Business.Services.ResponsablesBLL().Traer(item.RefIdResponsable.Value).Name : string.Empty; ;
                ws.Cell(row, 12).Value = item.DueDate;
                ws.Cell(row, 13).Value = item.O_C;

                row++;
            }

            ws.Columns(1, 13).AdjustToContents();

            //Save
            var path = Path.Combine(HttpContext.Current.Server.MapPath("~/App_Data/Reports/"), fileName);
            wb.SaveAs(path);

            return path;
        }

        public string GenerarExcelPendingAnalysis(string reporte, List<LARCA20_SmoScope> lista)
        {
            var date = DateTime.Now.ToString("ddMMMyyy");
            var random = new Random().Next(0, 1000);
            string fileName = String.Format("{0}_Report_{1}.xlsx", date, random);

            var wb = new XLWorkbook();
            var ws = wb.Worksheets.Add(reporte);

            int row = 4;
            // Titulos
            ws.Cell(1, 1).Value = reporte;
            ws.Cell(3, 1).Value = "Volume";
            ws.Cell(3, 2).Value = "SMO";
            ws.Cell(3, 3).Value = "BU";
            ws.Cell(3, 4).Value = "Root Cause";
            ws.Cell(3, 5).Value = "Other classification";
            ws.Cell(3, 6).Value = "Problem Statement";
            ws.Cell(3, 7).Value = "Why 1";
            ws.Cell(3, 8).Value = "Why 2";
            ws.Cell(3, 9).Value = "Why 3";
            ws.Cell(3, 10).Value = "Action Plan";
            ws.Cell(3, 11).Value = "Responsible";
            ws.Cell(3, 12).Value = "Due Date";
            ws.Cell(3, 13).Value = "Open or Closed";
            ws.Cell(3, 14).Value = "Status";

            var rngHeaders = ws.Range("A3:L3");
            rngHeaders.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Left;
            rngHeaders.Style.Font.Bold = true;
            rngHeaders.Style.Font.FontColor = XLColor.White;
            rngHeaders.Style.Fill.BackgroundColor = XLColor.DarkBlue;

            // Contenido Filas Grises
            foreach (var item in lista)
            {
                ws.Cell(row, 1).Value = (Math.Round(decimal.Parse(item.Volumen.ToString()), 2)).ToString();
                ws.Cell(row, 2).Value = item.MasterSMO.DataFin;
                ws.Cell(row, 3).Value = item.MasterBU.DataFin;
                ws.Cell(row, 4).Value = new Business.Services.RCClassificationBLL().Traer(item.RefIdRC.Value).Description;
                ws.Cell(row, 5).Value = item.Level4 != null && item.Level4 != 0 ? new Business.Services.Level4BLL().Traer(item.Level4.Value).name : string.Empty;
                ws.Cell(row, 6).Value = item.Problem;
                ws.Cell(row, 7).Value = item.Why1;
                ws.Cell(row, 8).Value = item.Why2;
                ws.Cell(row, 9).Value = item.Why3;
                ws.Cell(row, 10).Value = item.ActionPlan;
                ws.Cell(row, 11).Value = item.RefIdResponsable != null && item.RefIdResponsable != 0 ? new Business.Services.ResponsablesBLL().Traer(item.RefIdResponsable.Value).Name : string.Empty; ;
                ws.Cell(row, 12).Value = item.DueDate;
                ws.Cell(row, 13).Value = item.O_C;
                if ( item.ActionPlan != null && item.Problem != null )
                {
                    if (item.ActionPlan.Length > 0 && item.Problem.Length > 0)
                    {
                          ws.Cell(row, 14).Value = "COMPLETE" ;
                    }
                    else
                    {
                       ws.Cell(row, 14).Value = "INCOMPLETE" ;
                    }
                }
                else
                {
                    ws.Cell(row, 14).Value = "INCOMPLETE";
                }
                row++;
            }

            ws.Columns(1, 13).AdjustToContents();

            //Save
            var path = Path.Combine(HttpContext.Current.Server.MapPath("~/App_Data/Reports/"), fileName);
            wb.SaveAs(path);

            return path;
        }

        /// <summary>
        /// Calculo de TOP N por SMO y BU
        /// </summary>
        /// <param name="details"></param>
        private bool RealizarCalculosTotal(List<LARCA20_SmoScopeDetail> details)
        {
            try
            {
                bool lastWeekFlag = false;
                foreach (var smoitem in details.GroupBy(t => t.MasterSMODetail.DataFin))
                {
                    var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                    foreach (var buitem in smoitem.GroupBy(e => e.MasterBUDetail.DataFin))
                    {
                        var tops = buitem.GroupBy(d => d.Lvl3ID).Select(d => new { Volumen = d.Sum(s => s.Volumen), Lvl = d.First().Lvl3ID, Owner = d.First().OwnerID, Detalles = d.ToList() }).OrderByDescending(v => v.Volumen).ToList(); //.Take(toplvl3).ToList();
                        foreach (var subitem in tops)
                        {
                            var smoScope = new LARCA20_SmoScope();
                            smoScope.date = DateTime.Now;
                            smoScope.Volumen = subitem.Volumen;
                            smoScope.RefIdSMO = smoitem.First().SmoID;
                            smoScope.RefIdOwner = subitem.Owner;
                            smoScope.RefIdRC = subitem.Lvl;
                            smoScope.RefIdBU = buitem.First().BuID;
                            List<LARCA20_SmoScope> hist = new SMOScopeBLL().HistoricosSemana();
                            hist = hist.Where(x => (x.clone == null || x.clone != true) && x.RefIdBU == smoScope.RefIdBU && x.RefIdSMO == smoScope.RefIdSMO && x.RefIdRC == smoScope.RefIdRC && x.RefIdOwner == smoScope.RefIdOwner).ToList();
                            if(hist.Count() > 0)
                            {
                                lastWeekFlag = true;

                                LARCA20_SmoScope itemSemAnterior = new SMOScopeBLL().HistoricosSemana().First(x => (x.clone == null || x.clone != true) && x.RefIdBU == smoScope.RefIdBU && x.RefIdSMO == smoScope.RefIdSMO && x.RefIdRC == smoScope.RefIdRC && x.RefIdOwner == smoScope.RefIdOwner);
                                smoScope.Problem = itemSemAnterior.Problem;
                                smoScope.Why1 = itemSemAnterior.Why1;
                                smoScope.Why2 = itemSemAnterior.Why2;
                                smoScope.Why3 = itemSemAnterior.Why3;
                                smoScope.ActionPlan = itemSemAnterior.ActionPlan;
                                smoScope.O_C = itemSemAnterior.O_C;
                                smoScope.DueDate = itemSemAnterior.DueDate;
                                smoScope.RefIdResponsable = itemSemAnterior.RefIdResponsable;
                                smoScope.historic = false;
                                smoScope.Level4 = itemSemAnterior.Level4;

                                //ahora veo si tiene clones y los copio 
                                List<LARCA20_SmoScope> chequeo = new SMOScopeBLL().HistoricosSemana();
                                 chequeo = chequeo.Where(x=> x.clone != null && x.clone == true).ToList();
                                chequeo = chequeo.Where(x=> x.RefIdRC == smoScope.RefIdRC && x.RefIdOwner == smoScope.RefIdOwner ).ToList();
                                chequeo = chequeo.Where(x => x.RefIdBU == smoScope.RefIdBU && x.RefIdSMO == smoScope.RefIdSMO).ToList();
                                if(chequeo.Count() > 0)
                                {
                                    List<LARCA20_SmoScope> clonesActuales = new SMOScopeBLL().HistoricosSemana().Where(x => (x.clone != null && x.clone == true) && x.RefIdBU == smoScope.RefIdBU && x.RefIdSMO == smoScope.RefIdSMO && x.RefIdRC == smoScope.RefIdRC && x.RefIdOwner == smoScope.RefIdOwner).ToList();
                                    foreach (LARCA20_SmoScope clonViejo in clonesActuales)
                                    {
                                        var clonScope = new LARCA20_SmoScope();
                                        clonScope.date = DateTime.Now;
                                        clonScope.Volumen = clonViejo.Volumen;
                                        clonScope.RefIdSMO = clonViejo.RefIdSMO;
                                        clonScope.RefIdOwner = clonViejo.RefIdOwner;
                                        clonScope.RefIdRC = clonViejo.RefIdRC;
                                        clonScope.RefIdBU = clonViejo.RefIdBU;
                                        clonScope.Problem = clonViejo.Problem;
                                        clonScope.Why1 = clonViejo.Why1;
                                        clonScope.Why2 = clonViejo.Why2;
                                        clonScope.Why3 = clonViejo.Why3;
                                        clonScope.ActionPlan = clonViejo.ActionPlan;
                                        clonScope.O_C = clonViejo.O_C;
                                        clonScope.DueDate = clonViejo.DueDate;
                                        clonScope.RefIdResponsable = clonViejo.RefIdResponsable;
                                        clonScope.historic = false;
                                        clonScope.clone = true;
                                        clonScope.Level4 = clonViejo.Level4;
                                        clonScope.deleted = clonViejo.deleted;
                                        var clonService = new SMOScopeBLL().Guardar(clonScope);
                                    }

                                }
                            }
                            else //no hay registros de este smo en la semana pasada
                            {
                            smoScope.Problem = string.Empty;
                            smoScope.Why1 = string.Empty;
                            smoScope.Why2 = string.Empty;
                            smoScope.Why3 = string.Empty;
                            smoScope.ActionPlan = string.Empty;
                            smoScope.O_C = "O";
                            smoScope.deleted = false;
                            smoScope.historic = false;
                            }
                            
                            var smoService = new SMOScopeBLL().Guardar(smoScope, subitem.Detalles);
                        }
                    }
                }

                if (lastWeekFlag == true) //si hubo registros de la semana pasada tengo que corroborar si se copiaron todos los smo de los grupos que habian.
                {
                    List<LARCA20_SmoScope> lastWeekRegs = new SMOScopeBLL().HistoricosSemana().Where(x => x.date <= (DateTime.Today.AddDays(-1))).ToList();
                    List<string> groupsFound = new List<string>();
                    List<int> groupAmounts = new List<int>();
                    foreach(LARCA20_SmoScope reg in lastWeekRegs)
                    {
                        if(reg.GroupId != null)
                        {
                            if(groupsFound.Count == 0 || groupsFound.Exists(x=> x == reg.GroupId.ToString()) == false)
                            {
                                groupsFound.Add( reg.GroupId.ToString() );
                                groupAmounts.Add(1);
                            }
                            else
                            {
                                int ind = groupsFound.IndexOf(reg.GroupId.ToString());
                                groupAmounts[ind]++;
                            }
                        }
                    }
                    SMOScopeBLL groupBLL = new SMOScopeBLL();
                    List<LARCA20_SmoScope> thisWeekRegs = groupBLL.Todos().Where(x => x.date >= (DateTime.Today.AddDays(-1))).ToList();
                   foreach(string groupFound in groupsFound)
                   {
                       bool estantodos = true;
                       foreach (LARCA20_SmoScope gss in lastWeekRegs.Where(x => x.GroupId == Int32.Parse(groupFound)))
                       {
                           if (thisWeekRegs.Exists(x => x.RefIdBU == gss.RefIdBU && x.RefIdSMO == gss.RefIdSMO && x.RefIdRC == gss.RefIdRC && x.RefIdOwner == gss.RefIdOwner && x.historic == false) == false)
                           {
                               estantodos = false;
                               break;
                           }
                       }

                       if(estantodos == true)
                       {
                           foreach (LARCA20_SmoScope gss in lastWeekRegs.Where(x => x.GroupId == Int32.Parse(groupFound)))
                           {
                               LARCA20_SmoScope cambiar = thisWeekRegs.First(x => x.RefIdBU == gss.RefIdBU && x.RefIdSMO == gss.RefIdSMO && x.RefIdRC == gss.RefIdRC && x.RefIdOwner == gss.RefIdOwner && x.historic == false);
                               
                               cambiar.GroupId = gss.GroupId;
                             
                               groupBLL.Guardar(cambiar);
//                               var smoGroupChange = new SMOScopeBLL().Guardar(cambiar);
                           }
                       }

                   }



                }

                return true;
            }
            catch
            {
                return false;
            }

        }




        /// <summary>
        /// Calculo de TOP N por SMO y BU
        /// </summary>
        /// <param name="details"></param>
        private bool RealizarCalculosParcial(List<LARCA20_SmoScopeDetail> details)
        {
            try
            {
                foreach (var smoitem in details.GroupBy(t => t.MasterSMODetail.DataFin))
                {
                    var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                    foreach (var buitem in smoitem.GroupBy(e => e.MasterBUDetail.DataFin))
                    {
                        var tops = buitem.GroupBy(d => d.Lvl3ID).Select(d => new { Volumen = d.Sum(s => s.Volumen), Lvl = d.First().Lvl3ID, Owner = d.First().OwnerID, Detalles = d.ToList() }).OrderByDescending(v => v.Volumen).ToList(); //.Take(toplvl3).ToList();
                        foreach (var subitem in tops)
                        {
                            var smoScope = new LARCA20_SmoScope();
                            smoScope.date = DateTime.Now;
                            smoScope.Volumen = subitem.Volumen;
                            smoScope.RefIdSMO = smoitem.First().SmoID;
                            smoScope.RefIdOwner = subitem.Owner;
                            smoScope.RefIdRC = subitem.Lvl;
                            smoScope.RefIdBU = buitem.First().BuID;
                            smoScope.Problem = string.Empty;
                            smoScope.Why1 = string.Empty;
                            smoScope.Why2 = string.Empty;
                            smoScope.Why3 = string.Empty;
                            smoScope.ActionPlan = string.Empty;
                            smoScope.O_C = "O";
                            smoScope.deleted = false;
                            smoScope.historic = false;
                            var smoService = new SMOScopeBLL().Guardar(smoScope, subitem.Detalles);
                        }
                    }
                }
                return true;
            }
            catch
            {
                return false;
            }

        }

        /// <summary>
        /// Calculo de TOP N por SMO
        /// </summary>
        /// <param name="details"></param>
        private void CalcularProcesarSMO(List<LARCA20_SmoScopeDetail> details)
        {
            foreach (var item in details.GroupBy(t => t.SmoID))
            {
                var topLvl2 = new ApplicationDataBLL().TraerTopLvl2();
                var tops = item.GroupBy(d => d.Lvl2ID).Select(d => new { Volumen = d.Sum(s => s.Volumen), Lvl = d.First().Lvl2ID, Owner = d.First().OwnerID, Detalles = d.ToList() }).OrderByDescending(v => v.Volumen).Take(topLvl2).ToList();
                foreach (var subitem in tops)
                {
                    var smoScope = new LARCA20_SmoScope();
                    smoScope.date = DateTime.Now;
                    smoScope.Volumen = subitem.Volumen;
                    smoScope.RefIdSMO = item.Key;
                    smoScope.RefIdOwner = subitem.Owner;
                    smoScope.RefIdRC = subitem.Lvl;
                    smoScope.deleted = false;
                    var smoService = new SMOScopeBLL().Guardar(smoScope, subitem.Detalles);
                }
            }
        }

        /// <summary>
        /// Calculo de TOP N por BU
        /// </summary>
        /// <param name="details"></param>
        private void CalcularProcesarBU(List<LARCA20_SmoScopeDetail> details)
        {
            var topLvl2 = new ApplicationDataBLL().TraerTopLvl2();
            foreach (var item in details.GroupBy(t => t.BuID))
            {
                var tops = item.GroupBy(d => d.Lvl2ID).Select(d => new { Volumen = d.Sum(s => s.Volumen), Lvl = d.First().Lvl2ID, Owner = d.First().OwnerID, Detalles = d.ToList() }).OrderByDescending(v => v.Volumen).Take(topLvl2).ToList();
                foreach (var subitem in tops)
                {
                    var smoScope = new LARCA20_SmoScope();
                    smoScope.date = DateTime.Now;
                    smoScope.RefIdBU = item.Key;
                    smoScope.RefIdOwner = subitem.Owner;
                    smoScope.Volumen = subitem.Volumen;
                    smoScope.RefIdRC = subitem.Lvl;
                    smoScope.deleted = false;
                    var smoService = new SMOScopeBLL().Guardar(smoScope, subitem.Detalles);
                }
            }
        }

    }
}