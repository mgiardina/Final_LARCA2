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

        public bool Guardar(LARCA20_Users user)
        {
            return UsuariosDAL.Guardar(user);
        }

        public List<LARCA20_Users> Todos()
        {
            return UsuariosDAL.Todos();
        }

        public List<LARCA20_Users> TodosFiltro(string txNombre, string txApellido)
        {
            return UsuariosDAL.TodosFiltro(txNombre, txApellido);
        }

        public LARCA20_Users Traer(long id)
        {
            return UsuariosDAL.Traer(id);
        }

        public int TraerUltimoId()
        {
            return UsuariosDAL.TraerUltimoId();
        }

        public LARCA20_Users TraerPorNombreDeUsuario(string username)
        {
            return UsuariosDAL.TraerPorNombreDeUsuario(username);
        }
        
           public bool ExisteUsuario(string username)
        {
            return UsuariosDAL.ExisteUsuario(username);
        }


        public LARCA20_Users TraerPrimerAdminDisponible()
        {
            return UsuariosDAL.TraerPrimerAdminDisponible();
        }

        public string TraerRolUsuario(long usuarioId)
        {
            return UsuariosDAL.TraerRolUsuario(usuarioId).Description;
        }

        public bool Eliminar(long id)
        {
            return UsuariosDAL.Eliminar(id);
        }
    }
}
