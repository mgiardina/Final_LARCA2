using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class ResponsablesDAL : BaseDAL<LARCA20_Responsable>
    {
        public override bool Guardar(LARCA20_Responsable entity)
        {
            try
            {
                if (entity.IdRenglon == 0)
                {
                    Context.LARCA20_Responsable.Add(entity);
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

        public override List<LARCA20_Responsable> Todos()
        {
            return Context.LARCA20_Responsable.ToList();
        }

        public override LARCA20_Responsable Traer(long id)
        {
            return Context.LARCA20_Responsable.SingleOrDefault(u => u.IdRenglon == id);
        }

        public LARCA20_Responsable TraerPorNombreDeResponsable(string name)
        {
            return Context.LARCA20_Responsable.SingleOrDefault(u => u.Nombre == name);
        }

        public LARCA20_Responsable TraerPorNombreDeUsuario(string username)
        {

          LARCA20_Usuarios user = Context.LARCA20_Usuarios.Where(x => x.Usuario == username).FirstOrDefault();

            return Context.LARCA20_Responsable.SingleOrDefault(u => u.RefIdUsuario == user.IdRenglon);
        }

        public string TraerSuNombreDeUsuario(int refIdResponsable)
        {
            return Context.LARCA20_Usuarios.Where(x => x.IdRenglon == Context.LARCA20_Responsable.FirstOrDefault(u => u.IdRenglon == refIdResponsable).RefIdUsuario).ToList()[0].Usuario;

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

