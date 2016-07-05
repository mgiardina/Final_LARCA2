using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class UsuariosDAL : BaseDAL<LARCA20_Users>
    {
        public override bool Guardar(LARCA20_Users entity)
        {
            try
            {
                if (entity.Id == 0)
                {
                    Context.LARCA20_Users.Add(entity);
                    Context.SaveChanges();
                    int id = entity.Id;
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

        public override List<LARCA20_Users> Todos()
        {
            return Context.LARCA20_Users.ToList();
        }

        public List<LARCA20_Users> TodosFiltro(string Tx1, string Tx2)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);
            Tx2 = (Tx2 == null ? "" : Tx2);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA20_Users> ObjFiltro = from q in ObjEnt.LARCA20_Users
                                                        where q.name.Contains(Tx1) && q.last_name.Contains(Tx2)
                                                        select q;
                List<LARCA20_Users> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public override LARCA20_Users Traer(long id)
        {
            return Context.LARCA20_Users.SingleOrDefault(u => u.Id == id);
        }

        public LARCA20_Users TraerPorNombreDeUsuario(string username)
        {
            return Context.LARCA20_Users.SingleOrDefault(u => u.user_name == username && u.deleted == false);
        }

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

