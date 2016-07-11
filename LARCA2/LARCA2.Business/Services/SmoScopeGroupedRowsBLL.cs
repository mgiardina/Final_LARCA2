//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class SMOScopeGroupedRowsBLL
    {
        public SmoScopeGroupedRowsDAL SMOScopeGroupedRowsDAL;

        public SMOScopeGroupedRowsBLL()
        {
            SMOScopeGroupedRowsDAL = new SmoScopeGroupedRowsDAL();

        }

        public bool Guardar(LARCA20_SmoScopeGroupedRows smo)
        {
            return SMOScopeGroupedRowsDAL.Guardar(smo);
        }

        public LARCA20_SmoScopeGroupedRows crearGroup(LARCA20_SmoScope smo)
        {
            LARCA20_SmoScopeGroupedRows nuevo = new LARCA20_SmoScopeGroupedRows();

            nuevo.GroupSmoID = smo.SmoScopeID;
            nuevo.date = smo.date;
            nuevo.ActionPlan = smo.ActionPlan;
            nuevo.deleted = smo.deleted;
            nuevo.DueDate = smo.DueDate;
            nuevo.Level4 = smo.Level4;
            nuevo.O_C = smo.O_C;
            nuevo.Problem = smo.Problem;
            nuevo.RefIdBU = smo.RefIdBU;
            nuevo.RefIdOwner = smo.RefIdOwner;
            nuevo.RefIdRC = smo.RefIdRC;
            nuevo.RefIdResponsable = smo.RefIdResponsable;
        nuevo.RefIdSMO = smo.RefIdSMO;
        nuevo.Volumen = smo.Volumen;
        nuevo.Why1 = smo.Why1;
        nuevo.Why2 = smo.Why2;
        nuevo.Why3 = smo.Why3;
        
    
            return nuevo;
        }

        public List<LARCA20_SmoScopeGroupedRows> Todos()
        {
            Business.Services.ApplicationDataBLL repo = new Business.Services.ApplicationDataBLL();
            DateTime siev = DateTime.Now.AddDays(-repo.Todos().First().SmoDays.Value);
            return SMOScopeGroupedRowsDAL.Todos().Where(r => r.deleted == false && r.date >= siev).ToList();
        }

        public LARCA20_SmoScopeGroupedRows Traer(long id)
        {
            return SMOScopeGroupedRowsDAL.Traer(id);
        }

        public List<LARCA20_SmoScopeGroupedRows> TraerPorGroupId(int id)
        {
           
            return SMOScopeGroupedRowsDAL.TraerPorGroupId(id);
        }

        public bool Eliminar(long id)
        {
            return SMOScopeGroupedRowsDAL.Eliminar(id);
        }
    }
}
