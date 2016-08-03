using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class UserOwnerDAL : BaseDAL<LARCA20_User_Owner>
    {
        public override bool Guardar(LARCA20_User_Owner entity)
        {
            try
            {
                if (entity.Id == 0)
                {
                    Context.LARCA20_User_Owner.Add(entity);
                    Context.SaveChanges();
                    long id = entity.Id;
                }
                else
                {
                    Context.Entry(entity).State = System.Data.Entity.EntityState.Modified;
                    Context.SaveChanges();
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public override List<LARCA20_User_Owner> Todos()
        {
            return Context.LARCA20_User_Owner.ToList();
        }

        public List<LARCA20_User_Owner> TodosFiltro(long Tx1)
        {
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA20_User_Owner> ObjFiltro = from q in ObjEnt.LARCA20_User_Owner
                                                           where q.Id == Tx1
                                                           select q;

                List<LARCA20_User_Owner> ListaReturn = new List<LARCA20_User_Owner>();
                ListaReturn = ObjFiltro.ToList();
                return ListaReturn;
            }
        }

        public override LARCA20_User_Owner Traer(long id)
        {
            return Context.LARCA20_User_Owner.SingleOrDefault(u => u.Id == id);
        }

        public List<LARCA20_User_Owner> TraerPorIdUsuario(int idUser)
        {
            return Context.LARCA20_User_Owner.Where(u => u.IdUser == idUser && u.deleted == false).ToList();
        }

        public bool PermisoCheck(long bu, long smo, long owner, long user)
        {
            return Context.LARCA20_User_Owner.Where(u => u.IdBU == bu && u.IdSmo == smo && u.IdOwner == owner && u.deleted == false && u.IdUser != user).Count() > 0;
        }

        public LARCA20_Users UserPermisoCheck(long? bu, long? smo, long? owner)
        {
            try
            {
                return Context.LARCA20_User_Owner.SingleOrDefault(u => u.IdBU == bu && u.IdSmo == smo && u.IdOwner == owner && u.deleted == false).LARCA20_Users;
            }
            catch
            {
                return new LARCA20_Users();
            }
        }


        //esto no funciona, como lo implementamos?
        public override bool Eliminar(long id)
        {
            try
            {
                var entity = Traer(id);
                entity.deleted = true;
                Context.Entry(entity).State = System.Data.Entity.EntityState.Modified;
                Context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}

