//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class Level4BLL
    {
        public Data.Services.Level4DAL Level4DAL;

        public Level4BLL()
        {
            Level4DAL = new Data.Services.Level4DAL();
        }

        public bool Guardar(LARCA20_Level4 rcClassification)
        {
            return Level4DAL.Guardar(rcClassification);
        }

        public List<LARCA20_Level4> Todos()
        {
            return Level4DAL.Todos();
        }

        public List<LARCA20_Level4> TodosFiltro(string tx1)
        {
             return Level4DAL.TodosFiltro(tx1);
       }

        public LARCA20_Level4 Traer(long id)
        {
            return Level4DAL.Traer(id);
        }

        //public LARCA20_Level4 Traer(string codigo)
        //{
        //    return Level4DAL.Traer(codigo);
        //}

        public bool Eliminar(long id)
        {
            return Level4DAL.Eliminar(id);
        }

        public bool ValidarMaximo(string lvl3)
        {
            List<LARCA20_Level4> ListXLevel3 = new List<LARCA20_Level4>();
            ListXLevel3 = Level4DAL.ValidarMaximo(Convert.ToInt32(lvl3));

            // obtengo el max que esta establecido en la tabla Aux_Data para esto
            Data.Services.ApplicationDataDAL AuxD = new Data.Services.ApplicationDataDAL();
            
            var AuxData = AuxD.Todos();

            int ValMaxPermitido = (int)AuxData[0].Toplvl4;

            bool tof = false;
            if (ListXLevel3.Count >= ValMaxPermitido)
                tof = true;

            return tof;
        }
    }
}
