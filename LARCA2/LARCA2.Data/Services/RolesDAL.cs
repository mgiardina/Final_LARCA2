using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class RolesDAL : BaseDAL<LARCA20_Roles>
    {
        public override bool Guardar(LARCA20_Roles entity)
        {
            try
            {
                if (entity.IdRenglon == 0)
                {
                    Context.LARCA20_Roles.Add(entity);
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

        public override List<LARCA20_Roles> Todos()
        {
            return Context.LARCA20_Roles.Where(r => r.Borrado == false).ToList();
        }

        public override LARCA20_Roles Traer(long id)
        {
            return Context.LARCA20_Roles.SingleOrDefault(r => r.IdRenglon == id);
        }

        public override bool Eliminar(long id)
        {
            try
            {
                var entity = Traer(id);
                entity.Borrado = false;
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
