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
