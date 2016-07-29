//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
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

        public List<LARCA20_SmoScope> Filtrar(string refidbu, string refidsmo)
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




            //  if (refidbu != null && bu != 0)
            //  {
            //      Business.Services.MasterDataBLL mdb = new MasterDataBLL();
            //       List<LARCA20_MasterData> todosConSuDATAFIN = mdb.TraerVariosPorDataFin(mdb.Traer(bu).DataFin);
            //      result = result.Where(x => todosConSuDATAFIN.Exists(a => a.id == x.RefIdBU)).ToList();
            //  }


            if (refidbu != null && bu != 0)
                result = result.Where(x => x.RefIdBU == bu).ToList();



            if (refidsmo != null && smo != 0)
                result = result.Where(x => x.RefIdSMO == smo).ToList();
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
    }
}
