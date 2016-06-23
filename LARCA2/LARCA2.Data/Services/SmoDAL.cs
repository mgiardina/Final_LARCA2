using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.Data.Services
{
    public class SmoDAL : BaseDAL<LARCA20_SmoScope>
    {
        public override bool Guardar(LARCA20_SmoScope entity)
        {
            try
            {
                if (entity.SmoScopeID == 0)
                {
                    Context.LARCA20_SmoScope.Add(entity);
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

        public override List<LARCA20_SmoScope> Todos()
        {
            return Context.LARCA20_SmoScope.Where(s => s.Borrado == false).ToList();
        }

        public override LARCA20_SmoScope Traer(long id)
        {
            return Context.LARCA20_SmoScope.SingleOrDefault(s => s.SmoScopeID == id);
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
