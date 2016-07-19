//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class UserOwnerBLL
    {
        public Data.Services.UserOwnerDAL UserOwnerDAL;

        public UserOwnerBLL()
        {
            UserOwnerDAL = new Data.Services.UserOwnerDAL();
        }

        public bool Guardar(LARCA20_User_Owner user)
        {
            return UserOwnerDAL.Guardar(user);
        }

        public List<LARCA20_User_Owner> Todos()
        {
            return UserOwnerDAL.Todos();
        }

       /* public List<LARCA20_User_Owner> TodosFiltro(string txNombre, string txApellido)
        {
            return UserOwnerDAL.TodosFiltro(txNombre, txApellido);
        }
        */
        public LARCA20_User_Owner Traer(long id)
        {
            return UserOwnerDAL.Traer(id);
        }

        public bool PermisoCheck(long bu, long smo, long owner)
        {
            return UserOwnerDAL.PermisoCheck(bu, smo, owner);
        }

        public List<LARCA20_User_Owner> TraerPorIdUsuario(int IdUser)
        {
            return UserOwnerDAL.TraerPorIdUsuario(IdUser);
        }

        public bool Eliminar(long id)
        {
            return UserOwnerDAL.Eliminar(id);
        }
    }
}
