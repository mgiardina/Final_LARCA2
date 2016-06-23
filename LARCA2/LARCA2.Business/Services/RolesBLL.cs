//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class RolesBLL
    {
        public Data.Services.RolesDAL RolesDAL;

        public RolesBLL()
        {
            RolesDAL = new Data.Services.RolesDAL();
        }

        public bool Guardar(LARCA20_Roles rol)
        {
            return RolesDAL.Guardar(rol);
        }

        public List<LARCA20_Roles> Todos()
        {
            return RolesDAL.Todos();
        }

        public LARCA20_Roles Traer(long id)
        {
            return RolesDAL.Traer(id);
        }

        public bool Eliminar(long id)
        {
            return RolesDAL.Eliminar(id);
        }
    }
}
