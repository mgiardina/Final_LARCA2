using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class UsuariosRolesDAL : BaseDAL<LARCA20_UsuariosRoles>
    {
        public override bool Guardar(LARCA20_UsuariosRoles entity)
        {
            try
            {
                if (entity.IdRenglon == 0)
                {
                    Context.LARCA20_UsuariosRoles.Add(entity);
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

        public override List<LARCA20_UsuariosRoles> Todos()
        {
            return Context.LARCA20_UsuariosRoles.ToList();
        }

        public List<LARCA20_UsuariosRoles> TodosFiltro(string Tx1, string Tx2)
        {
            Tx1 = (Tx1 == null ? "0" : Tx1);
            Tx2 = (Tx2 == null ? "" : Tx2);
            int ValPaso = Convert.ToInt32(Tx1);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA20_UsuariosRoles> ObjFiltro = from q in ObjEnt.LARCA20_UsuariosRoles
                                                           where q.RefIdUsuario == ValPaso
                                                        select q;
                List<LARCA20_UsuariosRoles> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public override LARCA20_UsuariosRoles Traer(long id)
        {
            return Context.LARCA20_UsuariosRoles.SingleOrDefault(u => u.RefIdUsuario == id);
        }

        public override bool Eliminar(long id)
        {
            try
            {
                var entity = Traer(id);
                entity.Borrado = true;
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
