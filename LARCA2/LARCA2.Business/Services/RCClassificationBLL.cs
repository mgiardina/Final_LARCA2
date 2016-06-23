//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class RCClassificationBLL
    {
        public Data.Services.RCClassificationDAL RCClassificationDAL;

        public RCClassificationBLL()
        {
            RCClassificationDAL = new Data.Services.RCClassificationDAL();
        }

        public bool Guardar(LARCA20_RcClasification rcClassification)
        {
            return RCClassificationDAL.Guardar(rcClassification);
        }

        public List<LARCA20_RcClasification> Todos()
        {
            return RCClassificationDAL.Todos();
        }

        public List<LARCA20_RcClasification> TodosNivel3()
        {
            return RCClassificationDAL.TodosNivel3();
        }

        public List<LARCA20_RcClasification> TodosNivel3_Filtro(string tx1)
        {
            return RCClassificationDAL.TodosNivel3_Filtro(tx1);
        }

        public List<LARCA20_RcClasification> TodosFiltro(string tx1, string tx2)
        {
            return RCClassificationDAL.TodosFiltro(tx1, tx2);
        }

        public List<LARCA20_RcClasification> TodosXLevel(string tx1)
        {
            return RCClassificationDAL.TodosXLevel(tx1);
        }

        public LARCA20_RcClasification Traer(long id)
        {
            return RCClassificationDAL.Traer(id);
        }

        public LARCA20_RcClasification TraerPorDesc(string desc)
        {
            return RCClassificationDAL.TraerPorDesc(desc);
        }

        public LARCA20_RcClasification Traer(string codigo)
        {
            return RCClassificationDAL.Traer(codigo);
        }

        public bool Eliminar(long id)
        {
            return RCClassificationDAL.Eliminar(id);
        }
    }
}
