﻿//using LARCA2.Data;
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

        public bool Guardar(LARCA20_SmoScope smo, List<LARCA20_SmoScopeDetail> details)
        {
            try
            {
                if (SMOScopesDAL.Guardar(smo))
                {
                    foreach (var detail in details)
                    {
                        var SmoDetailDAL = new SmoDetailDAL();
                        detail.SmoScopeID = smo.SmoScopeID;
                        SmoDetailDAL.Guardar(detail);
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
            return SMOScopesDAL.Todos().Where(r => r.Borrado == false && r.Fecha >= siev).ToList();
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
            if (!(((smoScope.RefIdResponsable == null && smoScope1.RefIdResponsable == null) || (smoScope.RefIdResponsable == smoScope1.RefIdResponsable)))) return false;
            if (!((smoScope.DueDate != null || smoScope1.DueDate == null) && smoScope.DueDate.Equals(smoScope1.DueDate))) return false;
            if (!(((smoScope.O_C == null && smoScope1.O_C == null) || (smoScope.O_C == smoScope1.O_C)))) return false;
            //  smoScope.Borrado.Equals(this.Borrado) ))return false;
            if (!(((smoScope.Level4 == 0 && smoScope1.Level4 == null) || (smoScope.Level4 == smoScope1.Level4)))) return false;
          
            return true;
        }
        public List<LARCA20_SmoScope> Filtrar(string refidbu, string refidsmo)
        {
            int bu = Int32.Parse(refidbu);
            int smo = Int32.Parse(refidsmo);

            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);

            List<LARCA20_SmoScope> result = SMOScopesDAL.Todos().Where(x => x.Borrado == false && x.Fecha >= siev).ToList();

           
            if (refidbu != null && bu != 0)
                result = result.Where(x => x.RefIdBU == bu).ToList();
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