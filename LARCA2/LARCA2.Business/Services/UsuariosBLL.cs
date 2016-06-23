//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class UsuariosBLL
    {
        public Data.Services.UsuariosDAL UsuariosDAL;

        public UsuariosBLL()
        {
            UsuariosDAL = new Data.Services.UsuariosDAL();
        }

        public bool Guardar(LARCA20_Usuarios user)
        {
            return UsuariosDAL.Guardar(user);
        }

        public List<LARCA20_Usuarios> Todos()
        {
            return UsuariosDAL.Todos();
        }

        public List<LARCA20_Usuarios> TodosFiltro(string txNombre, string txApellido)
        {
            return UsuariosDAL.TodosFiltro(txNombre, txApellido);
        }

        public LARCA20_Usuarios Traer(long id)
        {
            return UsuariosDAL.Traer(id);
        }

        public LARCA20_Usuarios TraerPorNombreDeUsuario(string username)
        {
            return UsuariosDAL.TraerPorNombreDeUsuario(username);
        }

        public bool Eliminar(long id)
        {
            return UsuariosDAL.Eliminar(id);
        }
    }
}
