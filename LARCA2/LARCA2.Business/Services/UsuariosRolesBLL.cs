//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class UsuariosRolesBLL
    {
        public Data.Services.UsuariosRolesDAL UsuariosRolesDAL;

        public UsuariosRolesBLL()
        {
            UsuariosRolesDAL = new Data.Services.UsuariosRolesDAL();
        }

        public bool Guardar(LARCA20_UsersRoles userRol)
        {
            return UsuariosRolesDAL.Guardar(userRol);
        }

        public List<LARCA20_UsersRoles> Todos()
        {
            return UsuariosRolesDAL.Todos();
        }

        public List<LARCA20_UsersRoles> TodosFiltro(string tx1, string tx2)
        {
            return UsuariosRolesDAL.TodosFiltro(tx1, tx2);
        }

        public LARCA20_UsersRoles Traer(long id)
        {
            return UsuariosRolesDAL.Traer(id);
        }

        public bool Eliminar(long id)
        {
            return UsuariosRolesDAL.Eliminar(id);
        }
    }
}
