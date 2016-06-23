//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class ResponsablesBLL
    {
        public Data.Services.ResponsablesDAL ResponsablesDAL;

        public ResponsablesBLL()
        {
            ResponsablesDAL = new Data.Services.ResponsablesDAL();
        }

        public bool Guardar(LARCA20_Responsable user)
        {
            return ResponsablesDAL.Guardar(user);
        }

        public List<LARCA20_Responsable> Todos()
        {
            return ResponsablesDAL.Todos();
        }


        public LARCA20_Responsable Traer(long id)
        {
            return ResponsablesDAL.Traer(id);
        }

        public LARCA20_Responsable TraerPorNombreDeUsuario(string username)
        {
            return ResponsablesDAL.TraerPorNombreDeUsuario(username);
        }

        public string TraerSuNombreDeUsuario(int id)
        {
            return ResponsablesDAL.TraerSuNombreDeUsuario(id);
        }

        public bool Eliminar(long id)
        {
            return ResponsablesDAL.Eliminar(id);
        }
    }
}
