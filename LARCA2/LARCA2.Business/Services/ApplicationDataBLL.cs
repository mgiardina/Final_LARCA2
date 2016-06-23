using LARCA2.Data.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class ApplicationDataBLL
    {
        public Data.Services.ApplicationDataDAL ApplicationDataDAL;

        public ApplicationDataBLL()
        {
            ApplicationDataDAL = new Data.Services.ApplicationDataDAL();
        }

        public int TraeXlsRowFrom()
        {
            return ApplicationDataDAL.Todos()[0].XlsRowFrom;
        }

        public int TraeXlsColumnFrom()
        {
            return ApplicationDataDAL.Todos()[0].XlsColumnFrom;
        }

        public List<LARCA20_AuxData> Todos()
        {
            return ApplicationDataDAL.Todos();
        }

        public bool Guardar(LARCA20_AuxData AuxData)
        {
            return ApplicationDataDAL.Guardar(AuxData);
        }

        public LARCA20_AuxData Traer(long id)
        {
            return ApplicationDataDAL.Traer(id);
        }

        public int TraerTopLvl2()
        {
            return Traer(1).TopLvl2;
        }

        public int TraerTopLvl3()
        {
            return Traer(1).TopLvl3;
        }

        public int TraerCantidadAdjuntos()
        {
            return Traer(1).CntAdjuntos;
        }

        public int TraerDias()
        {
            return Traer(1).DiasReporte;
        }
    }   
}
