using LARCA2.Business.Entities;
using LARCA2.Data;
using LARCA2.Data.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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
            var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
            if (smoFin.Length > 0)
            {
                
                var items = SmoScopeDAL.Todos().Where(s => s.MasterSMO.DataFin == smoFin).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                int cant = 0;
                foreach (var item in items) //.Take(toplvl2))
                {
                    cant++;
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
                    foreach (var subitem in item.ToList().OrderByDescending(s => s.Volumen).Take(toplvl3)) //.Take(toplvl3))
                    {
                        var detailRow = new ReportRow
                        {      
                            SMO = subitem.MasterSMO.DataFin,
                            RBU = subitem.MasterBU.DataFin,
                            CUT = subitem.MasterLvl.Description,
                            VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                            PROBLEM = CheckProblem(subitem.Problem, subitem.ActionPlan, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                            WHY1 = subitem.Why1,
                            WHY2 = subitem.Why2,
                            WHY3 = subitem.Why3,
                            ACTIONPLAN = subitem.ActionPlan,
                            RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                            LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                            GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                        };
                        //////
                        Boolean paso = false;
                        if (i == 1)
                        {
                            i++;
                            vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                            row.Details.Add(detailRow);
                            paso = true;
                        }
                        else
                        {
                            if (vol * 100 / volumen <= 80)
                            {
                                i++;
                                vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                row.Details.Add(detailRow);
                                paso = true;
                            }
                        }

                        if (paso)
                            {
                        // Chequeo de clones
                        var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID);
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
                                    PROBLEM = clon.Problem,
                                    WHY1 = clon.Why1,
                                    WHY2 = clon.Why2,
                                    WHY3 = clon.Why3,
                                    ACTIONPLAN = clon.ActionPlan,
                                    RESPONSIBLE = clon.ResponsableSmo != null ? clon.ResponsableSmo.Name.ToString() : string.Empty,
                                    LEVEL4 = clon.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(clon.Level4)).name : string.Empty,
                                    GAP = string.Empty
                                };
                                row.Details.Add(detail);
                            }
                        }
                            }
                    }
                        lista.Add(row);
                }
            }
            else
                if (buFin.Length > 0)
                {
                
                    var items = SmoScopeDAL.Todos().Where(s => s.MasterBU.DataFin == buFin && s.historic == false).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                    int cant = 0;
                    foreach (var item in items) //.Take(toplvl2))
                    {
                        cant++;
                        var volumenBU = Convert.ToDecimal(SmoDetailDAL.Todos().Where(s => s.MasterBUDetail.DataFin == buFin && s.historic == false).Sum(s => s.Volumen));
                        var volumen = SmoDetailDAL.Todos().Where(s => s.MasterBUDetail.DataFin == buFin && s.historic == false && s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key).Sum(s => s.Volumen);
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
                        foreach (var subitem in item.ToList().OrderByDescending(s => s.Volumen).Take(toplvl3))
                        {
                            string SMOt = subitem.MasterSMO.DataFin;
                            string RBUt = subitem.MasterBU.DataFin;
                            string CUTt = subitem.MasterLvl.Description;
                            string VOLUMEt = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString();
                            string PROBLEMt = CheckProblem(subitem.Problem, subitem.ActionPlan, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner);
                            string WHY1t = subitem.Why1;
                            string WHY2t = subitem.Why2;
                            string WHY3t = subitem.Why3;
                            string ACTIONPLANt = subitem.ActionPlan;
                            string RESPONSIBLEt = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty;
                            string LEVEL4t = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty;
                            string GAPt = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %";

                            
                            var detailRow = new ReportRow
                            {
                                SMO = SMOt,
                                RBU = RBUt,
                                CUT = CUTt,
                                VOLUME = VOLUMEt,
                                PROBLEM = PROBLEMt,
                                WHY1 = WHY1t,
                                WHY2 = WHY2t,
                                WHY3 = WHY3t,
                                ACTIONPLAN = ACTIONPLANt,
                                RESPONSIBLE = RESPONSIBLEt,
                                LEVEL4 = LEVEL4t,
                                GAP=GAPt

                                /*
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
                        */
                                  };
                            Boolean paso = false;
                            if (i == 1)
                            {
                                i++;
                                vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                row.Details.Add(detailRow);
                                paso = true;
                            }
                            else
                            {
                                if (vol * 100 / volumen <= 80)
                                {
                                    i++;
                                    vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                    row.Details.Add(detailRow);

                                    paso = true;
                                }
                            }

                            if (paso)
                            {
                                // Chequeo de clones
                                var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID);
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
                                            PROBLEM = clon.Problem,
                                            WHY1 = clon.Why1,
                                            WHY2 = clon.Why2,
                                            WHY3 = clon.Why3,
                                            ACTIONPLAN = clon.ActionPlan,
                                            RESPONSIBLE = clon.ResponsableSmo != null ? clon.ResponsableSmo.Name.ToString() : string.Empty,
                                            LEVEL4 = clon.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(clon.Level4)).name : string.Empty,
                                            GAP = string.Empty
                                        };
                                        row.Details.Add(detail);
                                    }
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
                
                        var items = SmoScopeDAL.Todos().GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                        int cant = 0;
                        foreach (var item in items) //.Take(toplvl2))
                        {
                            cant++;
                            var volumenTotal = Convert.ToDecimal(SmoDetailDAL.Todos().Sum(s => s.Volumen));
                            var volumen = SmoDetailDAL.Todos().Where(s => s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key && s.historic == false).Sum(s => s.Volumen);
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
                            foreach (var subitem in item.ToList().OrderByDescending(s => s.Volumen).Take(toplvl3))
                            {
                                var detailRow = new ReportRow
                                {
                                    SMO = subitem.MasterSMO.DataFin,
                                    RBU = subitem.MasterBU.DataFin,
                                    CUT = subitem.MasterLvl.Description,
                                    VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                    PROBLEM = CheckProblem(subitem.Problem,subitem.ActionPlan, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                                    WHY1 = subitem.Why1,
                                    WHY2 = subitem.Why2,
                                    WHY3 = subitem.Why3,
                                    ACTIONPLAN = subitem.ActionPlan,
                                    RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                    LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                    GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                                };
                                Boolean paso = false;
                                if (i == 1)
                                {
                                    i++;
                                    vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                    row.Details.Add(detailRow);
                                    paso = true;
                                }
                                else
                                {
                                    if (vol * 100 / volumen <= 80)
                                    {
                                        i++;
                                        vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                        row.Details.Add(detailRow);
                                        paso = true;

                                    }
                                }

                                if (paso)
                                {
                                    // Chequeo de clones
                                    var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID);
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
                                                PROBLEM = clon.Problem,
                                                WHY1 = clon.Why1,
                                                WHY2 = clon.Why2,
                                                WHY3 = clon.Why3,
                                                ACTIONPLAN = clon.ActionPlan,
                                                RESPONSIBLE = clon.ResponsableSmo != null ? clon.ResponsableSmo.Name.ToString() : string.Empty,
                                                LEVEL4 = clon.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(clon.Level4)).name : string.Empty,
                                                GAP = string.Empty
                                            };
                                            row.Details.Add(detail);
                                        }
                                    }
                                }
                            }
                                lista.Add(row);
                        }
                    }
                    else
                        if (regionId == "2")
                        {
                
                            var items = SmoScopeDAL.TodosConExclusiones().GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]);
                            int cant = 0;
                            foreach (var item in items) //.Take(toplvl2))
                            {
                                cant++;
                                var volumenTotal = Convert.ToDecimal(SmoDetailDAL.Todos().Sum(s => s.Volumen));
                                var volumen = SmoDetailDAL.Todos().Where(s => s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[0] + "." + s.MasterLvl2Detail.Code.Split(Convert.ToChar("."))[1] == item.Key && s.historic == false).Sum(s => s.Volumen);
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
                                foreach (var subitem in item.ToList().OrderByDescending(s => s.Volumen).Take(toplvl3))
                                {
                                    var detailRow = new ReportRow
                                    {
                                        SMO = subitem.MasterSMO.DataFin,
                                        RBU = subitem.MasterBU.DataFin,
                                        CUT = subitem.MasterLvl.Description,
                                        VOLUME = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2)).ToString(),
                                        PROBLEM = CheckProblem(subitem.Problem, subitem.ActionPlan, subitem.RefIdBU, subitem.RefIdSMO, subitem.RefIdOwner),
                                        WHY1 = subitem.Why1,
                                        WHY2 = subitem.Why2,
                                        WHY3 = subitem.Why3,
                                        ACTIONPLAN = subitem.ActionPlan,
                                        RESPONSIBLE = subitem.ResponsableSmo != null ? subitem.ResponsableSmo.Name.ToString() : string.Empty,
                                        LEVEL4 = subitem.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(subitem.Level4)).name : string.Empty,
                                        GAP = Math.Round(Convert.ToDecimal(subitem.Volumen) * 100 / volumen, 2).ToString() + " %"
                                    };
                                    Boolean paso = false;
                                    if (i == 1)
                                    {
                                        i++;
                                        vol = (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                        row.Details.Add(detailRow);
                                        paso = true;
                                    }
                                    else
                                    {
                                        if (vol * 100 / volumen <= 80)
                                        {
                                            i++;
                                            vol += (Math.Round(decimal.Parse(subitem.Volumen.ToString()), 2));
                                            row.Details.Add(detailRow);
                                            paso = true;

                                        }
                                    }

                                    if (paso)
                                    {
                                        // Chequeo de clones
                                        var clones = new SMOScopeBLL().Todos().Where(s => s.RefIdSMO == subitem.RefIdSMO && s.RefIdBU == subitem.RefIdBU && s.RefIdOwner == subitem.RefIdOwner && s.RefIdRC == subitem.RefIdRC && s.SmoScopeID != subitem.SmoScopeID);
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
                                                    PROBLEM = clon.Problem,
                                                    WHY1 = clon.Why1,
                                                    WHY2 = clon.Why2,
                                                    WHY3 = clon.Why3,
                                                    ACTIONPLAN = clon.ActionPlan,
                                                    RESPONSIBLE = clon.ResponsableSmo != null ? clon.ResponsableSmo.Name.ToString() : string.Empty,
                                                    LEVEL4 = clon.Level4 != null ? new Level4BLL().Traer(Convert.ToInt64(clon.Level4)).name : string.Empty,
                                                    GAP = string.Empty
                                                };
                                                row.Details.Add(detail);
                                            }
                                        }
                                    }
                                }
                                    lista.Add(row);
                            }
                        }
                }
            return lista.OrderByDescending(i => Convert.ToDecimal(i.VOLUME)).Take(toplvl2).ToList();
        }

        private string CheckProblem(string problem, string action_plan, long? bu, long? smo, long? owner)
        {
            if (problem != null && action_plan != null && action_plan != "" && problem != "")
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
                    return "Analysis pending by user";
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
