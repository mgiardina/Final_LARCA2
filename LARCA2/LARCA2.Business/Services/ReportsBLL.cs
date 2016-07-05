using LARCA2.Business.Entities;
using LARCA2.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class ReportsBLL
    {
        public Data.Services.SmoScopeDAL SmoScopeDAL;
        public Data.Services.SmoDetailDAL SmoDetailDAL;
        public Data.Services.MasterDataDAL MasterDataDAL;

        public ReportsBLL()
        {
            SmoScopeDAL = new Data.Services.SmoScopeDAL();
            SmoDetailDAL = new Data.Services.SmoDetailDAL();
            MasterDataDAL = new Data.Services.MasterDataDAL();
        }

        public List<ReportRow> LARCANews(string smoFin, string buFin, string regionId)
        {
            var lista = new List<ReportRow>();
            if (smoFin.Length > 0)
            {
                var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                var items = SmoScopeDAL.Todos().Where(s => s.MasterSMO.DataFin == smoFin).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                foreach (var item in items.Take(toplvl2))
                {
                    var volumen = SmoScopeDAL.Todos().Where(s => s.MasterSMO.DataFin == smoFin && s.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                    var row = new ReportRow();
                    row.SMO = item.ToList()[0].MasterSMO.DataFin;
                    row.RBU = "TOTAL";
                    row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                    row.Details = new List<ReportRow>();
                    row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                    row.PROBLEM = "View Details Below";

                    var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                    foreach (var subitem in item.ToList().Take(toplvl3))
                    {

                        var detailRow = new ReportRow
                        {
                            SMO = subitem.MasterSMO.DataFin,
                            RBU = subitem.MasterBU.DataFin,
                            CUT = subitem.MasterLvl.Description,
                            VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                            PROBLEM = subitem.Problem,
                            WHY1 = subitem.Why1,
                            WHY2 = subitem.Why2,
                            WHY3 = subitem.Why3,
                            ACTIONPLAN = subitem.ActionPlan,
                            RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                            LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty
                        };
                        row.Details.Add(detailRow);
                    }
                    lista.Add(row);
                }
            }
            else
                if (buFin.Length > 0)
                {
                    var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                    var items = SmoScopeDAL.Todos().Where(s => s.MasterBU.DataFin == buFin).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                    foreach (var item in items.Take(toplvl2))
                    {
                        var volumen = SmoScopeDAL.Todos().Where(s => s.MasterBU.DataFin == buFin && s.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                        var row = new ReportRow();
                        row.SMO = "TOTAL";
                        row.RBU = item.ToList()[0].MasterBU.DataFin;
                        row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                        row.Details = new List<ReportRow>();
                        row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                        row.PROBLEM = "View Details Below";

                        var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                        foreach (var subitem in item.ToList().Take(toplvl3))
                        {
                            var detailRow = new ReportRow
                            {
                                SMO = subitem.MasterSMO.DataFin,
                                RBU = subitem.MasterBU.DataFin,
                                CUT = subitem.MasterLvl.Description,
                                VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                PROBLEM = subitem.Problem,
                                WHY1 = subitem.Why1,
                                WHY2 = subitem.Why2,
                                WHY3 = subitem.Why3,
                                ACTIONPLAN = subitem.ActionPlan,
                                RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty
                            };
                            row.Details.Add(detailRow);
                        }
                        lista.Add(row);
                    }
                }
                else
                {
                    if (regionId == "1")
                    {
                        var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                        var items = SmoScopeDAL.Todos().GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                        foreach (var item in items.Take(toplvl2))
                        {
                            var volumen = SmoScopeDAL.Todos().Where(s => s.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                            var row = new ReportRow();
                            row.SMO = "TOTAL";
                            row.RBU = "TOTAL";
                            row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                            row.Details = new List<ReportRow>();
                            row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                            row.PROBLEM = "View Details Below";

                            var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                            foreach (var subitem in item.ToList().Take(toplvl3))
                            {
                                var detailRow = new ReportRow
                                {
                                    SMO = subitem.MasterSMO.DataFin,
                                    RBU = subitem.MasterBU.DataFin,
                                    CUT = subitem.MasterLvl.Description,
                                    VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                    PROBLEM = subitem.Problem,
                                    WHY1 = subitem.Why1,
                                    WHY2 = subitem.Why2,
                                    WHY3 = subitem.Why3,
                                    ACTIONPLAN = subitem.ActionPlan,
                                    RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                    LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty
                                };
                                row.Details.Add(detailRow);
                            }
                            lista.Add(row);
                        }
                    }
                    else
                        if (regionId == "2")
                        {
                            var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                            var items = SmoScopeDAL.TodosConExclusiones().GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                            foreach (var item in items.Take(toplvl2))
                            {
                                var volumen = SmoScopeDAL.Todos().Where(s => s.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                                var row = new ReportRow();
                                row.SMO = "TOTAL";
                                row.RBU = "TOTAL";
                                row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                                row.Details = new List<ReportRow>();
                                row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                                row.PROBLEM = "View Details Below";

                                var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                                foreach (var subitem in item.ToList().Take(toplvl3))
                                {
                                    var detailRow = new ReportRow
                                    {
                                        SMO = subitem.MasterSMO.DataFin,
                                        RBU = subitem.MasterBU.DataFin,
                                        CUT = subitem.MasterLvl.Description,
                                        VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                        PROBLEM = subitem.Problem,
                                        WHY1 = subitem.Why1,
                                        WHY2 = subitem.Why2,
                                        WHY3 = subitem.Why3,
                                        ACTIONPLAN = subitem.ActionPlan,
                                        RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                        LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty
                                    };
                                    row.Details.Add(detailRow);
                                }
                                lista.Add(row);
                            }
                        }
                }
            return lista.OrderByDescending(i => Convert.ToDecimal(i.VOLUME)).ToList();
        }

        public List<ReportRow> LARCANews(string regionId, List<LARCA20_User_Owner> permisos)
        {
            var lista = new List<ReportRow>();

            return lista.OrderByDescending(i => Convert.ToDecimal(i.VOLUME)).ToList();
        }
    }
}
