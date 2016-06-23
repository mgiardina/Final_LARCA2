using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.Business.Services
{
    public class SmoBLL
    {
        public Data.Services.SmoDAL SMOScopeDAL;
        public Data.Services.SmoDetailDAL SmoDetailDAL;

        public SmoBLL()
        {
            SMOScopeDAL = new Data.Services.SmoDAL();
            SmoDetailDAL = new Data.Services.SmoDetailDAL();
        }

        public bool Guardar(LARCA20_SmoScope smo, List<LARCA20_SmoScopeDetail> details)
        {
            try
            {
                if (SMOScopeDAL.Guardar(smo))
                {
                    foreach (var detail in details)
                    {
                        detail.SmoScopeID = smo.SmoScopeID;
                        SmoDetailDAL.Guardar(detail);
                    }
                    return true;
                }
                else
                return false; 
            }
            catch(Exception ex)
            {return false;}
               
            
            
        }

        public List<LARCA20_SmoScope> Todos()
        {
            return SMOScopeDAL.Todos();
        }

        public LARCA20_SmoScope Traer(long id)
        {
            return SMOScopeDAL.Traer(id);
        }

        public bool Eliminar(long id)
        {
            return SMOScopeDAL.Eliminar(id);
        }
    }
}
