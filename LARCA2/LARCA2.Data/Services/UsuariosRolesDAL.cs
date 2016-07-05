using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class UsuariosRolesDAL : BaseDAL<LARCA20_UsersRoles>
    {
        public override bool Guardar(LARCA20_UsersRoles entity)
        {
            try
            {
                if (entity.Id == 0)
                {
                    Context.LARCA20_UsersRoles.Add(entity);
                    Context.SaveChanges();
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

        public override List<LARCA20_UsersRoles> Todos()
        {
            return Context.LARCA20_UsersRoles.ToList();
        }

        public List<LARCA20_UsersRoles> TodosFiltro(string Tx1, string Tx2)
        {
            Tx1 = (Tx1 == null ? "0" : Tx1);
            Tx2 = (Tx2 == null ? "" : Tx2);
            int ValPaso = Convert.ToInt32(Tx1);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA20_UsersRoles> ObjFiltro = from q in ObjEnt.LARCA20_UsersRoles
                                                           where q.RefIdUser == ValPaso
                                                        select q;
                List<LARCA20_UsersRoles> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public override LARCA20_UsersRoles Traer(long id)
        {
            return Context.LARCA20_UsersRoles.SingleOrDefault(u => u.RefIdUser == id);
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
