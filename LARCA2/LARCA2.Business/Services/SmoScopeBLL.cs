//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;
using System.Web;

namespace LARCA2.Business.Services
{   public class temp_object
    {
        public string level { get; set; }
        public decimal volumen { get; set; }
        public long smo { get; set; }
        public string bu { get; set; }
    }

    public class SMOScopeBLL
    {
        public SmoScopeDAL SMOScopesDAL;

        public SMOScopeBLL()
        {
            SMOScopesDAL = new SmoScopeDAL();

        }


        public bool Guardar(LARCA20_SmoScope smo)
        {
            return SMOScopesDAL.Guardar(smo);
        }

        public bool PasarHistorico(LARCA20_SmoScope smo)
        {
            try
            {
                SMOScopesDAL.Guardar(smo);
                return true;
            }
            catch
            {
                return false;
            }

        }

        public bool PasarDetallesHistoricos()
        {
            try
            {
                foreach (var item in new SmoScopeDetailDAL().Todos())
                {
                    var newItem = new LARCA20_SmoScopeDetail();
                    newItem.DetailID = item.DetailID;
                    newItem.date = item.date;
                    newItem.OwnerID = item.OwnerID;
                    newItem.Volumen = item.Volumen;
                    newItem.Lvl2ID = item.Lvl2ID;
                    newItem.Lvl3ID = item.Lvl3ID;
                    newItem.originaldate = item.originaldate;
                    newItem.FPC = item.FPC;
                    newItem.BuID = item.BuID;
                    newItem.SmoID = item.SmoID;
                    newItem.ReasonID = item.ReasonID;
                    newItem.Customer = item.Customer;
                    newItem.historic = true;
                    newItem.deleted = item.deleted;

                    new SmoScopeDetailDAL().Guardar(newItem);
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Guardar(LARCA20_SmoScope smo, List<LARCA20_SmoScopeDetail> details)
        {
            try
            {
                if (SMOScopesDAL.Guardar(smo))
                {
                    foreach (var detail in details)
                    {
                        var SmoDetailDAL = new SmoDetailDAL();
                        var d = SmoDetailDAL.Traer(detail.DetailID);
                        d.SmoScopeID = smo.SmoScopeID;
                        SmoDetailDAL.Guardar(d);
                    }
                    return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            { return false; }
        }

        public List<LARCA20_SmoScope> Todos()
        {
            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);
            return SMOScopesDAL.Todos().Where(r => r.deleted == false && r.date >= siev).ToList();
        }

        public List<LARCA20_SmoScope> HistoricosSemana()
        {
            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-8); //los de la ultima semana.
            List<LARCA20_SmoScope> result = SMOScopesDAL.BruteTodos();
            result = result.Where(r => r.deleted == false && r.historic == true && r.date >= siev).ToList();
            return result; 
        }

        public List<LARCA20_SmoScope> TraerGrupo(int groupId)
        {
            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);
            return SMOScopesDAL.TraerGrupo(groupId).Where(r => r.deleted == false && r.date >= siev).ToList();
        }

        public static bool esAgrupable(LARCA20_SmoScope smoScope1, LARCA20_SmoScope smoScope)
        {

            //     if (!((smoScope.SmoScopeID != 0 || smoScope1.SmoScopeID == 0) && smoScope.SmoScopeID == smoScope1.SmoScopeID)) return false;
            //    (smoScope.Fecha != null && smoScope.Fecha.Equals(this.Fecha) || (smoScope.Fecha == null && this.Fecha == null)) ))return false;
            if (!(smoScope.RefIdSMO != null && smoScope.RefIdSMO != 0 && ((smoScope.RefIdSMO == null && smoScope1.RefIdSMO == null) || smoScope.RefIdSMO == smoScope1.RefIdSMO))) return false;
            if (!(smoScope.RefIdBU != null && smoScope.RefIdBU != 0 && ((smoScope.RefIdBU == null && smoScope1.RefIdBU == null) || smoScope.RefIdBU == smoScope1.RefIdBU))) return false;
            //  if ((smoScope.RefIdOwner != null && smoScope.RefIdOwner != 0 && smoScope.RefIdOwner == smoScope1.RefIdOwner)) return false;
            if (!(smoScope.RefIdRC != null && smoScope.RefIdRC != 0 && smoScope.RefIdRC == smoScope1.RefIdRC)) return false;
            //     smoScope.Volumen != null && smoScope.Volumen != 0 && smoScope.Volumen == this.Volumen ))return false;
            // if (!((smoScope.Problem != null || smoScope1.Problem == null) &&  ((smoScope.Problem == null && smoScope1.Problem == null) || (smoScope.Problem == smoScope1.Problem)))) return false;
            //if (!((smoScope.Why1 != null || smoScope1.Why1 == nkull) && smoScope.Why1 == smoScope1.Why1)) return false;
            //if (!((smoScope.Why2 != null || smoScope1.Why2 == null) && smoScope.Why2 == smoScope1.Why2)) return false;
            //if (!((smoScope.Why3 != null || smoScope1.Why3 == null) && smoScope.Why3 == smoScope1.Why3)) return false;
            //if (!((smoScope.ActionPlan != null || smoScope1.ActionPlan == null) && smoScope.ActionPlan == smoScope1.ActionPlan)) return false;
            if (!((((smoScope.RefIdResponsable == null || smoScope1.RefIdResponsable == null)) || smoScope.RefIdResponsable == smoScope1.RefIdResponsable))) return false;
            //  if (!((smoScope.DueDate != null || smoScope1.DueDate == null) && smoScope.DueDate.Equals(smoScope1.DueDate))) return false;
            if (!(smoScope.O_C != null && smoScope.O_C.Equals(smoScope1.O_C))) return false;
            //  smoScope.Borrado.Equals(this.Borrado) ))return false;
            if (!((((smoScope.Level4 == null || smoScope1.Level4 == null)) || smoScope.Level4 == smoScope1.Level4))) return false;
            return true;
        }

        public static bool esAgrupable(LARCA20_SmoScope smoScope1, LARCA20_SmoScope smoScope, string newResponsable)
        {
            LARCA2.Business.Services.ResponsablesBLL rebll = new ResponsablesBLL();


            //     if (!((smoScope.SmoScopeID != 0 || smoScope1.SmoScopeID == 0) && smoScope.SmoScopeID == smoScope1.SmoScopeID)) return false;
            //    (smoScope.Fecha != null && smoScope.Fecha.Equals(this.Fecha) || (smoScope.Fecha == null && this.Fecha == null)) ))return false;
            if (!(smoScope.RefIdSMO != null && smoScope.RefIdSMO != 0 && ((smoScope.RefIdSMO == null && smoScope1.RefIdSMO == null) || smoScope.RefIdSMO == smoScope1.RefIdSMO))) return false;
            if (!(smoScope.RefIdBU != null && smoScope.RefIdBU != 0 && ((smoScope.RefIdBU == null && smoScope1.RefIdBU == null) || smoScope.RefIdBU == smoScope1.RefIdBU))) return false;
            //  if ((smoScope.RefIdOwner != null && smoScope.RefIdOwner != 0 && smoScope.RefIdOwner == smoScope1.RefIdOwner)) return false;
            if (!(smoScope.RefIdRC != null && smoScope.RefIdRC != 0 && smoScope.RefIdRC == smoScope1.RefIdRC)) return false;
            //     smoScope.Volumen != null && smoScope.Volumen != 0 && smoScope.Volumen == this.Volumen ))return false;
            // if (!((smoScope.Problem != null || smoScope1.Problem == null) &&  ((smoScope.Problem == null && smoScope1.Problem == null) || (smoScope.Problem == smoScope1.Problem)))) return false;
            //if (!((smoScope.Why1 != null || smoScope1.Why1 == nkull) && smoScope.Why1 == smoScope1.Why1)) return false;
            //if (!((smoScope.Why2 != null || smoScope1.Why2 == null) && smoScope.Why2 == smoScope1.Why2)) return false;
            //if (!((smoScope.Why3 != null || smoScope1.Why3 == null) && smoScope.Why3 == smoScope1.Why3)) return false;
            //if (!((smoScope.ActionPlan != null || smoScope1.ActionPlan == null) && smoScope.ActionPlan == smoScope1.ActionPlan)) return false;
            //  if (!((((smoScope.RefIdResponsable == null || smoScope1.RefIdResponsable == null)) || smoScope.RefIdResponsable == smoScope1.RefIdResponsable))) return false;

            if (!((smoScope1.RefIdResponsable == null && newResponsable == "") || (smoScope1.RefIdResponsable != null && rebll.TraerSuNombreDeUsuario(Int32.Parse(smoScope1.RefIdResponsable.ToString())) == newResponsable))) return false; //comparacion responsables nuevos


            //  if (!((smoScope.DueDate != null || smoScope1.DueDate == null) && smoScope.DueDate.Equals(smoScope1.DueDate))) return false;
            if (!(smoScope.O_C != null && smoScope.O_C.Equals(smoScope1.O_C))) return false;
            //  smoScope.Borrado.Equals(this.Borrado) ))return false;
            if (!((((smoScope.Level4 == null || smoScope1.Level4 == null)) || smoScope.Level4 == smoScope1.Level4))) return false;
            return true;
        }

        public static bool esIgual(LARCA20_SmoScope smoScope1, LARCA20_SmoScope smoScope)
        {
            LARCA2.Data.Services.ResponsablesDAL redal = new LARCA2.Data.Services.ResponsablesDAL();
            //   LARCA20_Responsable respon = redal.Traer(smoScope.RefIdResponsable.Value);

            if (!((smoScope.SmoScopeID != 0 || smoScope1.SmoScopeID == 0) && smoScope.SmoScopeID == smoScope1.SmoScopeID)) return false;
            //    (smoScope.Fecha != null && smoScope.Fecha.Equals(this.Fecha) || (smoScope.Fecha == null && this.Fecha == null)) ))return false;
            //  smoScope.RefIdSMO != null && smoScope.RefIdSMO != 0 && smoScope.RefIdSMO == this.RefIdSMO ))return false;
            //     smoScope.RefIdBU != null && smoScope.RefIdBU != 0 && smoScope.RefIdBU == this.RefIdBU ))return false;
            //    smoScope.RefIdOwner != null && smoScope.RefIdOwner != 0 && smoScope.RefIdOwner == this.RefIdOwner ))return false;
            //    smoScope.RefIdRC != null && smoScope.RefIdRC != 0 && smoScope.RefIdRC == this.RefIdRC ))return false;
            //     smoScope.Volumen != null && smoScope.Volumen != 0 && smoScope.Volumen == this.Volumen ))return false;
            //    (smoScope.Problem != null || this.Problem == null) && smoScope.Problem == this.Problem ))return false;
            if (!((smoScope.Problem != null || smoScope1.Problem == null) && ((smoScope.Problem == null && smoScope1.Problem == null) || (smoScope.Problem == smoScope1.Problem)))) return false;
            if (!((smoScope.Why1 != null || smoScope1.Why1 == null) && smoScope.Why1 == smoScope1.Why1)) return false;
            if (!((smoScope.Why2 != null || smoScope1.Why2 == null) && smoScope.Why2 == smoScope1.Why2)) return false;
            if (!((smoScope.Why3 != null || smoScope1.Why3 == null) && smoScope.Why3 == smoScope1.Why3)) return false;
            if (!((smoScope.ActionPlan != null || smoScope1.ActionPlan == null) && smoScope.ActionPlan == smoScope1.ActionPlan)) return false;
            //if (!((smoScope.RefIdResponsable != null || smoScope1.RefIdResponsable == null) && (smoScope.RefIdResponsable != 0 || smoScope1.RefIdResponsable == 0) && respon.IdRenglon == redal.Traer(smoScope1.RefIdResponsable.Value).IdRenglon)) return false;
            //  if (!(((smoScope.RefIdResponsable == null && smoScope1.RefIdResponsable == null) || ((smoScope.RefIdResponsable == 0 && smoScope1.RefIdResponsable == null) || smoScope.RefIdResponsable == smoScope1.RefIdResponsable)))) return false;


            if (!(((smoScope.RefIdResponsable == null && smoScope1.RefIdResponsable == null) || ((smoScope.RefIdResponsable == 0 && smoScope1.RefIdResponsable == null) || smoScope.RefIdResponsable == smoScope1.RefIdResponsable)))) return false;

            if (!((smoScope.DueDate != null || smoScope1.DueDate == null) && smoScope.DueDate.Equals(smoScope1.DueDate))) return false;
            if (!(((smoScope.O_C == null && smoScope1.O_C == null) || (smoScope.O_C == smoScope1.O_C)))) return false;
            //  smoScope.Borrado.Equals(this.Borrado) ))return false;
            if (!(((smoScope.Level4 == 0 && smoScope1.Level4 == null) || (smoScope.Level4 == smoScope1.Level4)))) return false;

            return true;
        }

        public static bool esIgual(LARCA20_SmoScope smoScope1, LARCA20_SmoScope smoScope, string newResponsable)
        {
            //en smoscope1 llega el original de la bd, en smoscope llega el que es modificado directo desde el viewmodel
            LARCA2.Business.Services.ResponsablesBLL rebll = new ResponsablesBLL();
            LARCA2.Data.Services.ResponsablesDAL redal = new LARCA2.Data.Services.ResponsablesDAL();
            //   LARCA20_Responsable respon = redal.Traer(smoScope.RefIdResponsable.Value);

            if (!((smoScope.SmoScopeID != 0 || smoScope1.SmoScopeID == 0) && smoScope.SmoScopeID == smoScope1.SmoScopeID)) return false;
            //    (smoScope.Fecha != null && smoScope.Fecha.Equals(this.Fecha) || (smoScope.Fecha == null && this.Fecha == null)) ))return false;
            //  smoScope.RefIdSMO != null && smoScope.RefIdSMO != 0 && smoScope.RefIdSMO == this.RefIdSMO ))return false;
            //     smoScope.RefIdBU != null && smoScope.RefIdBU != 0 && smoScope.RefIdBU == this.RefIdBU ))return false;
            //    smoScope.RefIdOwner != null && smoScope.RefIdOwner != 0 && smoScope.RefIdOwner == this.RefIdOwner ))return false;
            //    smoScope.RefIdRC != null && smoScope.RefIdRC != 0 && smoScope.RefIdRC == this.RefIdRC ))return false;
            //     smoScope.Volumen != null && smoScope.Volumen != 0 && smoScope.Volumen == this.Volumen ))return false;
            //    (smoScope.Problem != null || this.Problem == null) && smoScope.Problem == this.Problem ))return false;
            if (!((smoScope.Problem != null || smoScope1.Problem == null) && ((smoScope.Problem == null && smoScope1.Problem == null) || (smoScope.Problem == smoScope1.Problem)))) return false;
            if (!((smoScope.Why1 != null || smoScope1.Why1 == null) && smoScope.Why1 == smoScope1.Why1)) return false;
            if (!((smoScope.Why2 != null || smoScope1.Why2 == null) && smoScope.Why2 == smoScope1.Why2)) return false;
            if (!((smoScope.Why3 != null || smoScope1.Why3 == null) && smoScope.Why3 == smoScope1.Why3)) return false;
            if (!((smoScope.ActionPlan != null || smoScope1.ActionPlan == null) && smoScope.ActionPlan == smoScope1.ActionPlan)) return false;
            //if (!((smoScope.RefIdResponsable != null || smoScope1.RefIdResponsable == null) && (smoScope.RefIdResponsable != 0 || smoScope1.RefIdResponsable == 0) && respon.IdRenglon == redal.Traer(smoScope1.RefIdResponsable.Value).IdRenglon)) return false;
            //  if (!(((smoScope.RefIdResponsable == null && smoScope1.RefIdResponsable == null) || ((smoScope.RefIdResponsable == 0 && smoScope1.RefIdResponsable == null) || smoScope.RefIdResponsable == smoScope1.RefIdResponsable)))) return false;


            if (!((smoScope1.RefIdResponsable == null && newResponsable == "") || (smoScope1.RefIdResponsable != null && rebll.TraerSuNombreDeUsuario(Int32.Parse(smoScope1.RefIdResponsable.ToString())) == newResponsable))) return false; //comparacion responsables nuevos
            //si no se da que ambos son nulos o que ambos apuntan al mismo nombre de usuario, entonces son distintos

            if (!((smoScope.DueDate != null || smoScope1.DueDate == null) && smoScope.DueDate.Equals(smoScope1.DueDate))) return false;
            if (!((((smoScope.O_C == "0" || smoScope.O_C == null) && smoScope1.O_C == null) || (smoScope.O_C == smoScope1.O_C)))) return false;
            //  smoScope.Borrado.Equals(this.Borrado) ))return false;
            if (!(((smoScope.Level4 == 0 && smoScope1.Level4 == null) || (smoScope.Level4 == smoScope1.Level4)))) return false;

            return true;
        }

        public List<LARCA20_SmoScope> Filtrar(string refidbu, string refidsmo, string role)
        {
            int bu = 0;
            int smo = 0;

            LARCA2.Data.DatabaseModels.LARCA20_Users user = (LARCA2.Data.DatabaseModels.LARCA20_Users)HttpContext.Current.Session["Usuario"];

            if ((refidbu != null) && (refidbu != ""))
            {
                bu = Int32.Parse(refidbu);
            }

            if ((refidsmo != null) && (refidsmo != ""))
            {
                smo = Int32.Parse(refidsmo);
            }

            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);

            List<LARCA20_SmoScope> result = new List<LARCA20_SmoScope>();
            List<LARCA20_SmoScope> result_test = new List<LARCA20_SmoScope>();
            List<LARCA20_SmoScope> result_aux_smo = new List<LARCA20_SmoScope>();
            List<LARCA20_SmoScope> result_aux_bu = new List<LARCA20_SmoScope>();
            List<LARCA20_SmoScopeDetail> lista_tops_level2 = new List<LARCA20_SmoScopeDetail>();
            //result = result.Where(x => x.deleted == false && x.date >= siev).ToList();
            MasterDataBLL smo_list = new MasterDataBLL();
            MasterDataBLL bu_list = new MasterDataBLL();
            var toplvl3 = new ApplicationDataBLL().TraerTopLvl3();
            var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();

            decimal volumen;
            decimal vol;
            switch (role)
            {
                case "1":
                    foreach (var smo_var in smo_list.Todos().Where(x => x.Data == "SMO").ToList())
                    {
                        result_aux_smo.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdSMO == smo_var.id && x.clone != true).ToList());
                    }

                    var result_aux_s = result_aux_smo.GroupBy(p => p.RefIdSMO).ToList();

                    var tops_smo = traer_tops_level2(1);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.RefIdSMO == item.Key).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_smo.Exists(p => p.level == subitem.Key.ToString() && p.smo == item.Key))
                            {
                            volumen = tops_smo.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.smo == item.Key).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }




                    foreach (var bu_var in smo_list.Todos().Where(x => x.Data == "BU").ToList())
                    {
                        result_aux_bu.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdBU == bu_var.id && x.clone != true).ToList().Take(toplvl3).ToList());
                    }

                    var result_aux_b = result_aux_bu.GroupBy(p => p.MasterBU.DataFin).ToList();
                                                           

                    var tops_bu = traer_tops_level2(2);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.MasterBU.DataFin == item.Key.ToString()).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_bu.Exists(p => p.level == subitem.Key.ToString() && p.bu == item.Key.ToString()))
                            {
                            volumen = tops_bu.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.bu == item.Key.ToString()).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }

                    break;
                case "2":
                    foreach (var smo_var in smo_list.Todos().Where(x => x.Data == "SMO").ToList())
                    {
                        result_aux_smo.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdSMO == smo_var.id && x.clone != true).ToList());
                    }

                    result_aux_s = result_aux_smo.GroupBy(p => p.RefIdSMO).ToList();

                    tops_smo = traer_tops_level2(1);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.RefIdSMO == item.Key).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_smo.Exists(p => p.level == subitem.Key.ToString() && p.smo == item.Key))
                            {
                            volumen = tops_smo.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.smo == item.Key).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }


                    foreach (var bu_var in smo_list.Todos().Where(x => x.Data == "BU").ToList())
                    {
                        result_aux_bu.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdBU == bu_var.id && x.clone != true).ToList().Take(toplvl3).ToList());
                    }

                    result_aux_b = result_aux_bu.GroupBy(p => p.MasterBU.DataFin).ToList();
                                                           

                    tops_bu = traer_tops_level2(2);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.MasterBU.DataFin == item.Key.ToString()).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_bu.Exists(p => p.level == subitem.Key.ToString() && p.bu == item.Key.ToString()))
                            {
                            volumen = tops_bu.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.bu == item.Key.ToString()).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }


                    var permisos = user.LARCA20_User_Owner.ToList();
                    var result_total = result.ToList();
                    result.Clear();
                    foreach (var item in result_total)
	                {
		              /* if (permisos.Exists(p => p.IdSmo == item.RefIdSMO && p.LARCA20_MasterData.DataFin == item.MasterBU.DataFin))       
                           {
                                   result.Add(item);    
                           }*/

                        foreach (var subitem in permisos)
                        {
                            if (item.MasterBU.DataFin == subitem.LARCA20_MasterData.DataFin && item.RefIdSMO == subitem.IdSmo)
                            {
                                result.Add(item);
                            }
                        }
	                }
                    

                    break;

                case "6":
                    foreach (var smo_var in smo_list.Todos().Where(x => x.Data == "SMO").ToList())
                    {
                        result_aux_smo.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdSMO == smo_var.id && x.clone != true).ToList());
                    }

                    result_aux_s = result_aux_smo.GroupBy(p => p.RefIdSMO).ToList();

                    tops_smo = traer_tops_level2(1);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.RefIdSMO == item.Key).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_smo.Exists(p => p.level == subitem.Key.ToString() && p.smo == item.Key))
                            {
                            volumen = tops_smo.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.smo == item.Key).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }


                    foreach (var bu_var in smo_list.Todos().Where(x => x.Data == "BU").ToList())
                    {
                        result_aux_bu.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdBU == bu_var.id && x.clone != true).ToList().Take(toplvl3).ToList());
                    }

                    result_aux_b = result_aux_bu.GroupBy(p => p.MasterBU.DataFin).ToList();
                                                           

                    tops_bu = traer_tops_level2(2);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.MasterBU.DataFin == item.Key.ToString()).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_bu.Exists(p => p.level == subitem.Key.ToString() && p.bu == item.Key.ToString()))
                            {
                            volumen = tops_bu.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.bu == item.Key.ToString()).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }


                    permisos = user.LARCA20_User_Owner.ToList();
                    result_total = result.ToList();
                    result.Clear();
                    foreach (var item in result_total)
	                {
		              /* if (permisos.Exists(p => p.IdSmo == item.RefIdSMO && p.LARCA20_MasterData.DataFin == item.MasterBU.DataFin))       
                           {
                                   result.Add(item);    
                           }*/

                        foreach (var subitem in permisos)
                        {
                            if (item.MasterBU.DataFin == subitem.LARCA20_MasterData.DataFin)
                            {
                                result.Add(item);
                            }
                        }
	                }


                    break;

                case "4":

                    foreach (var smo_var in smo_list.Todos().Where(x => x.Data == "SMO").ToList())
                    {
                        result_aux_smo.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdSMO == smo_var.id && x.clone != true).ToList());
                    }

                    result_aux_s = result_aux_smo.GroupBy(p => p.RefIdSMO).ToList();

                    tops_smo = traer_tops_level2(1);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.RefIdSMO == item.Key).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_smo.Exists(p => p.level == subitem.Key.ToString() && p.smo == item.Key))
                            {
                            volumen = tops_smo.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.smo == item.Key).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }


                    foreach (var bu_var in smo_list.Todos().Where(x => x.Data == "BU").ToList())
                    {
                        result_aux_bu.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdBU == bu_var.id && x.clone != true).ToList().Take(toplvl3).ToList());
                    }

                    result_aux_b = result_aux_bu.GroupBy(p => p.MasterBU.DataFin).ToList();
                                                           

                    tops_bu = traer_tops_level2(2);

                    foreach (var item in result_aux_s)
                    {
                        var result_aux = item.Where(i => i.MasterBU.DataFin == item.Key.ToString()).GroupBy(p => p.MasterLvl.Code.Split(Convert.ToChar("."))[0] + "." + p.MasterLvl.Code.Split(Convert.ToChar("."))[1]).ToList();

                        foreach (var subitem in result_aux)
                        {
                            
                            if (tops_bu.Exists(p => p.level == subitem.Key.ToString() && p.bu == item.Key.ToString()))
                            {
                            volumen = tops_bu.SingleOrDefault(t => t.level == subitem.Key.ToString() && t.bu == item.Key.ToString()).volumen;
                              
                           
                            
                            vol = 0;
                            int cant = 0;
                            foreach (var item_list in subitem.OrderByDescending(p => p.Volumen).ToList())
                            {
                                cant++;
                                if (cant == 1)
                                {
                                    result_test.Add(item_list);
                                    vol = vol + Convert.ToDecimal(item_list.Volumen);
                                }

                                else
                                {
                                    if ((vol * 100 / volumen <= 80) )
                                        {
                                            result_test.Add(item_list);
                                            vol = vol + Convert.ToDecimal(item_list.Volumen);
                                        }
                                }
                            }
                                result.AddRange(result_test.OrderByDescending(s => s.Volumen).Take(toplvl3).ToList());
                                result_test.Clear();                            
                        } 
                    }
                    }


                    permisos = user.LARCA20_User_Owner.ToList();
                    result_total = result.ToList();
                    result.Clear();
                    foreach (var item in result_total)
	                {
		              /* if (permisos.Exists(p => p.IdSmo == item.RefIdSMO && p.LARCA20_MasterData.DataFin == item.MasterBU.DataFin))       
                           {
                                   result.Add(item);    
                           }*/

                        foreach (var subitem in permisos)
                        {
                            if (item.RefIdSMO == subitem.IdSmo)
                            {
                                result.Add(item);
                            }
                        }
	                }
                    

                    break;

            }



            List<LARCA20_SmoScope> result2 = new List<LARCA20_SmoScope>();
            foreach (var subitem in result)
            {
                // Chequeo de clones
                result2.AddRange(SMOScopesDAL.Todos().Where(x => x.deleted == false && x.date >= siev && x.RefIdSMO == subitem.RefIdSMO && x.RefIdBU == subitem.RefIdBU && x.RefIdOwner == subitem.RefIdOwner && x.RefIdRC == subitem.RefIdRC && x.clone == true).ToList());
            }

            result.AddRange(result2);


            //  if (refidbu != null && bu != 0)
            //  {
            //      Business.Services.MasterDataBLL mdb = new MasterDataBLL();
            //       List<LARCA20_MasterData> todosConSuDATAFIN = mdb.TraerVariosPorDataFin(mdb.Traer(bu).DataFin);
            //      result = result.Where(x => todosConSuDATAFIN.Exists(a => a.id == x.RefIdBU)).ToList();
            //  }


            //if (refidbu != null && bu != 0)
             //   result = result.Where(x => x.RefIdBU == bu).ToList();



            //if (refidsmo != null && smo != 0)
            //    result = result.Where(x => x.RefIdSMO == smo).ToList();
            return result;
        }


        public List<LARCA20_SmoScope> FiltrarNew(string refidbu, string refidsmo)
        {
            int bu = 0;
            int smo = 0;

            if ((refidbu != null) || (refidbu == ""))
            {
                bu = Int32.Parse(refidbu);
            }

            if ((refidsmo != null) || (refidbu == ""))
            {
                smo = Int32.Parse(refidsmo);
            }

            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);

            List<LARCA20_SmoScope> result = SMOScopesDAL.Todos();
            result = result.Where(x => x.deleted == false && x.date >= siev).ToList();




            if (refidbu != null && bu != 0)
            {
                Business.Services.MasterDataBLL mdb = new MasterDataBLL();
                List<LARCA20_MasterData> todosConSuDATAFIN = mdb.TraerVariosPorDataFin(mdb.Traer(bu).DataFin);
                result = result.Where(x => todosConSuDATAFIN.Exists(a => a.id == x.RefIdBU)).ToList();
            }

            //old
            //if (refidbu != null && bu != 0)
            //  result = result.Where(x => x.RefIdBU == bu).ToList();



            if (refidsmo != null && smo != 0)
                result = result.Where(x => x.RefIdSMO == smo).ToList();
            return result;
        }

        public LARCA20_SmoScope Traer(long id)
        {
            return SMOScopesDAL.Traer(id);
        }

        public bool Eliminar(long id)
        {
            return SMOScopesDAL.Eliminar(id);
        }

        public decimal traerVolumenSMO(long? smo, string level)
        {
            SmoScopeDAL volumen = new SmoScopeDAL();
            var test = volumen.calcular_volumenes(1, "", smo, level);
            return test;
        }

        public decimal traerVolumenBU(string bu, string level)
        {
            SmoScopeDAL volumen = new SmoScopeDAL();
            var test = volumen.calcular_volumenes(2, bu, 0, level);
            return test;
        }

        public List<temp_object> traer_tops_level2(int tipo)
            {
                List<temp_object> historico = new List<temp_object>();
             
             if (tipo == 1)
                 {
                  RCClassificationDAL lista_level2 = new RCClassificationDAL();
                  var listanivel = lista_level2.TodosXLevel("2");

                 MasterDataDAL lista_smo_dal = new MasterDataDAL();
                 var listasmo = lista_smo_dal.TodosFiltro(string.Empty, string.Empty,"SMO");

                  foreach (var item in listasmo)
                  {
                      List<temp_object> historico_aux = new List<temp_object>();
                      foreach (var subitem in listanivel)
                      {
                          temp_object temp_object_aux = new temp_object();
                          temp_object_aux.level = subitem.Code;

                          temp_object_aux.volumen = traerVolumenSMO(item.id, subitem.Code);
                          temp_object_aux.smo = item.id;
                          historico_aux.Add(temp_object_aux);
                      }
                      var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                      historico.AddRange(historico_aux.OrderByDescending(p => p.volumen).Take(toplvl2).ToList());

                  }
                  //var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                  List<temp_object> result_list = historico.ToList();


                 return result_list;
                 }
             else
             {
                 RCClassificationDAL lista_level2 = new RCClassificationDAL();
                 var listanivel = lista_level2.TodosXLevel("2");

                 MasterDataDAL lista_smo_dal = new MasterDataDAL();
                 var listasmo = lista_smo_dal.TodosFiltro(string.Empty, string.Empty, "BU");

                 foreach (var item in listanivel)
                 {
                     List<temp_object> historico_aux = new List<temp_object>();
                     foreach (var subitem in listasmo)
                     {
                         temp_object temp_object_aux = new temp_object();
                         temp_object_aux.level = item.Code;

                         temp_object_aux.volumen = traerVolumenBU(subitem.DataFin.ToString(), item.Code);

                         temp_object_aux.bu = subitem.DataFin;

                         if (historico_aux.Exists(p => p.bu == temp_object_aux.bu) != true)
                             {
                         historico_aux.Add(temp_object_aux);
                             }
                     }

                     var toplvl2 = new ApplicationDataBLL().TraerTopLvl2();
                     historico.AddRange(historico_aux.OrderByDescending(p => p.volumen).Take(toplvl2).ToList());
                 }

                 List<temp_object> result_list = historico.ToList();
                 return result_list;

             }

            }
        
    }
}
