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
                    var volumenSmo = Convert.ToDecimal(SmoDetailDAL.Todos().Where(s => s.MasterSMODetail.DataFin == smoFin).Sum(s => s.Volumen));
                    var volumen = SmoDetailDAL.Todos().Where(s => s.MasterSMODetail.DataFin == smoFin && s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                    var row = new ReportRow();
                    row.SMO = item.ToList()[0].MasterSMO.DataFin;
                    row.RBU = "TOTAL";
                    row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                    row.Details = new List<ReportRow>();
                    row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                    row.PROBLEM = "View Details Below";
                    row.GAP = Math.Round(volumen * 100 / volumenSmo, 2).ToString() + " %";

                    var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                    decimal vol = 0;
                    int i = 1;
                    foreach (var subitem in item.ToList().Take(toplvl3))
                    {
                        var detailRow = new ReportRow
                        {      
                            SMO = subitem.MasterSMO.DataFin,
                            RBU = subitem.MasterBU.DataFin,
                            CUT = subitem.MasterLvl.Description,
                            VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                            PROBLEM = CheckProblem(subitem.Problem, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                            WHY1 = subitem.Why1,
                            WHY2 = subitem.Why2,
                            WHY3 = subitem.Why3,
                            ACTIONPLAN = subitem.ActionPlan,
                            RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                            LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                            GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                        };
                        //////
                        if (i == 1)
                        {
                            i++;
                            vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                            row.Details.Add(detailRow);
                        }
                        else
                        {
                            if (vol * 100 / volumen <= 80)
                            {
                                i++;
                                vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                row.Details.Add(detailRow);
                            }
                        }
                        // Chequeo de clones
                        var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID).Take(1);
                        if (clones.Count() > 0)
                        {
                            foreach (var clon in clones)
                            {
                                var detail = new ReportRow
                                {
                                    SMO = string.Empty,
                                    RBU = string.Empty,
                                    CUT = string.Empty,
                                    VOLUME = string.Empty,
                                    PROBLEM = subitem.Problem,
                                    WHY1 = subitem.Why1,
                                    WHY2 = subitem.Why2,
                                    WHY3 = subitem.Why3,
                                    ACTIONPLAN = subitem.ActionPlan,
                                    RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                    LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                    GAP = string.Empty
                                };
                                row.Details.Add(detail);
                            }
                        }
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
                        var volumenBU = Convert.ToDecimal(SmoDetailDAL.Todos().Where(s => s.MasterBUDetail.DataFin == buFin).Sum(s => s.Volumen));
                        var volumen = SmoDetailDAL.Todos().Where(s => s.MasterBUDetail.DataFin == buFin && s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                        var row = new ReportRow();
                        row.SMO = "TOTAL";
                        row.RBU = item.ToList()[0].MasterBU.DataFin;
                        row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                        row.Details = new List<ReportRow>();
                        row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                        row.PROBLEM = "View Details Below";
                        row.GAP = Math.Round(volumen * 100 / volumenBU, 2).ToString() + " %";


                        decimal vol = 0;
                        int i = 1;
                        var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                        foreach (var subitem in item.ToList().Take(toplvl3))
                        {
                            var detailRow = new ReportRow
                            {
                                SMO = subitem.MasterSMO.DataFin,
                                RBU = subitem.MasterBU.DataFin,
                                CUT = subitem.MasterLvl.Description,
                                VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                PROBLEM = CheckProblem(subitem.Problem, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                                WHY1 = subitem.Why1,
                                WHY2 = subitem.Why2,
                                WHY3 = subitem.Why3,
                                ACTIONPLAN = subitem.ActionPlan,
                                RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                            };
                            if (i == 1)
                            {
                                i++;
                                vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                row.Details.Add(detailRow);
                            }
                            else
                            {
                                if (vol * 100 / volumen <= 80)
                                {
                                    i++;
                                    vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                    row.Details.Add(detailRow);
                                }
                            }
                            // Chequeo de clones
                            var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID).Take(1);
                            if (clones.Count() > 0)
                            {
                                foreach (var clon in clones.Take(1))
                                {
                                    var detail = new ReportRow
                                    {
                                        SMO = string.Empty,
                                        RBU = string.Empty,
                                        CUT = string.Empty,
                                        VOLUME = string.Empty,
                                        PROBLEM = subitem.Problem,
                                        WHY1 = subitem.Why1,
                                        WHY2 = subitem.Why2,
                                        WHY3 = subitem.Why3,
                                        ACTIONPLAN = subitem.ActionPlan,
                                        RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                        LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                        GAP = string.Empty
                                    };
                                    row.Details.Add(detail);
                                }
                            }

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
                            var volumenTotal = Convert.ToDecimal(SmoDetailDAL.Todos().Sum(s => s.Volumen));
                            var volumen = SmoDetailDAL.Todos().Where(s => s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                            var row = new ReportRow();
                            row.SMO = "TOTAL";
                            row.RBU = "TOTAL";
                            row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                            row.Details = new List<ReportRow>();
                            row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                            row.PROBLEM = "View Details Below";
                            row.GAP = Math.Round(volumen * 100 / volumenTotal, 2).ToString() + " %";

                            decimal vol = 0;
                            int i = 1;
                            var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                            foreach (var subitem in item.ToList().Take(toplvl3))
                            {
                                var detailRow = new ReportRow
                                {
                                    SMO = subitem.MasterSMO.DataFin,
                                    RBU = subitem.MasterBU.DataFin,
                                    CUT = subitem.MasterLvl.Description,
                                    VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                    PROBLEM = CheckProblem(subitem.Problem, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                                    WHY1 = subitem.Why1,
                                    WHY2 = subitem.Why2,
                                    WHY3 = subitem.Why3,
                                    ACTIONPLAN = subitem.ActionPlan,
                                    RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                    LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                    GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                                };
                                if (i == 1)
                                {
                                    i++;
                                    vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                    row.Details.Add(detailRow);
                                }
                                else
                                {
                                    if (vol * 100 / volumen <= 80)
                                    {
                                        i++;
                                        vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                        row.Details.Add(detailRow);
                                    }
                                }
                                // Chequeo de clones
                                var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID).Take(1);
                                if (clones.Count() > 0)
                                {
                                    foreach (var clon in clones.Take(1))
                                    {
                                        var detail = new ReportRow
                                        {
                                            SMO = string.Empty,
                                            RBU = string.Empty,
                                            CUT = string.Empty,
                                            VOLUME = string.Empty,
                                            PROBLEM = subitem.Problem,
                                            WHY1 = subitem.Why1,
                                            WHY2 = subitem.Why2,
                                            WHY3 = subitem.Why3,
                                            ACTIONPLAN = subitem.ActionPlan,
                                            RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                            LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                            GAP = string.Empty
                                        };
                                        row.Details.Add(detail);
                                    }
                                }
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
                                var volumenTotal = Convert.ToDecimal(SmoDetailDAL.Todos().Sum(s => s.Volumen));
                                var volumen = SmoDetailDAL.Todos().Where(s => s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
                                var row = new ReportRow();
                                row.SMO = "TOTAL";
                                row.RBU = "TOTAL";
                                row.CUT = new RCClassificationBLL().Traer(item.Key).Description;
                                row.Details = new List<ReportRow>();
                                row.VOLUME = (Math.Round(decimal.Parse(volumen.ToString()), 2)).ToString();
                                row.PROBLEM = "View Details Below";
                                row.GAP = Math.Round(volumen * 100 / volumenTotal, 2).ToString() + " %";

                                decimal vol = 0;
                                int i = 1;
                                var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
                                foreach (var subitem in item.ToList().Take(toplvl3))
                                {
                                    var detailRow = new ReportRow
                                    {
                                        SMO = subitem.MasterSMO.DataFin,
                                        RBU = subitem.MasterBU.DataFin,
                                        CUT = subitem.MasterLvl.Description,
                                        VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                        PROBLEM = CheckProblem(subitem.Problem, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                                        WHY1 = subitem.Why1,
                                        WHY2 = subitem.Why2,
                                        WHY3 = subitem.Why3,
                                        ACTIONPLAN = subitem.ActionPlan,
                                        RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                        LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                        GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                                    };
                                    if (i == 1)
                                    {
                                        i++;
                                        vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                        row.Details.Add(detailRow);
                                    }
                                    else
                                    {
                                        if (vol * 100 / volumen <= 80)
                                        {
                                            i++;
                                            vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                            row.Details.Add(detailRow);
                                        }
                                    }
                                    // Chequeo de clones
                                    var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID).Take(1);
                                    if (clones.Count() > 0)
                                    {
                                        foreach (var clon in clones.Take(1))
                                        {
                                            var detail = new ReportRow
                                            {
                                                SMO = string.Empty,
                                                RBU = string.Empty,
                                                CUT = string.Empty,
                                                VOLUME = string.Empty,
                                                PROBLEM = subitem.Problem,
                                                WHY1 = subitem.Why1,
                                                WHY2 = subitem.Why2,
                                                WHY3 = subitem.Why3,
                                                ACTIONPLAN = subitem.ActionPlan,
                                                RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                                LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                                GAP = string.Empty
                                            };
                                            row.Details.Add(detail);
                                        }
                                    }
                                }
                                lista.Add(row);
                            }
                        }
                }
            return lista.OrderByDescending(i => Convert.ToDecimal(i.VOLUME)).ToList();
        }

        private string CheckProblem(string problem, long? bu, long? smo, long? owner)
        {
            if (problem != null)
            {
                return problem;
            }
            else
            {
                var user = new UserOwnerBLL().UserPermisoCheck(bu, smo, owner);
                if (user.Id > 0)
                {
                    return "Analysis pending by " + user.user_name;
                }
                else
                {
                    return "Cut under analysis due to its appearance outside of scope (between Monday and Tuesday), analysis due next week";
                }
            }
        }

        public List<ReportRow> LARCANews(string regionId, List<LARCA20_User_Owner> permisos)
        {
            var lista = new List<ReportRow>();

            return lista.OrderByDescending(i => Convert.ToDecimal(i.VOLUME)).ToList();
        }
    }
}
