//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class SMOScopeDetailBLL
    {
        public Data.Services.SmoScopeDetailDAL SMOScopeDetailDAL;

        public SMOScopeDetailBLL()
        {
            SMOScopeDetailDAL = new Data.Services.SmoScopeDetailDAL();
        }

        public bool Guardar(LARCA20_SmoScopeDetail smo)
        {
            return SMOScopeDetailDAL.Guardar(smo);
        }

        public List<LARCA20_SmoScopeDetail> Todos()
        {
            return SMOScopeDetailDAL.Todos();
        }

     

        public LARCA20_SmoScopeDetail Traer(long id)
        {
            return SMOScopeDetailDAL.Traer(id);
        }

        public List<LARCA20_SmoScopeDetail> TraerDetalle(int id)
        {
            return SMOScopeDetailDAL.TraerDetalles(id);
        }

        public bool Eliminar(long id)
        {
            return SMOScopeDetailDAL.Eliminar(id);
        }
    }
}
