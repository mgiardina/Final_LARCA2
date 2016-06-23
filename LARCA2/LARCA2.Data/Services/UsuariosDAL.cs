using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class UsuariosDAL : BaseDAL<LARCA20_Usuarios>
    {
        public override bool Guardar(LARCA20_Usuarios entity)
        {
            try
            {
                if (entity.IdRenglon == 0)
                {
                    Context.LARCA20_Usuarios.Add(entity);
                    Context.SaveChanges();
                    int id = entity.IdRenglon;
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

        public override List<LARCA20_Usuarios> Todos()
        {
            return Context.LARCA20_Usuarios.ToList();
        }

        public List<LARCA20_Usuarios> TodosFiltro(string Tx1, string Tx2)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);
            Tx2 = (Tx2 == null ? "" : Tx2);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA20_Usuarios> ObjFiltro = from q in ObjEnt.LARCA20_Usuarios
                                                        where q.Nombre.Contains(Tx1) && q.Apellido.Contains(Tx2)
                                                        select q;
                List<LARCA20_Usuarios> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public override LARCA20_Usuarios Traer(long id)
        {
            return Context.LARCA20_Usuarios.SingleOrDefault(u => u.IdRenglon == id);
        }

        public LARCA20_Usuarios TraerPorNombreDeUsuario(string username)
        {
            return Context.LARCA20_Usuarios.SingleOrDefault(u => u.Usuario == username && u.Borrado == false);
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

