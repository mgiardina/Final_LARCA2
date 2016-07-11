using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class SmoScopeGroupedRowsDAL : BaseDAL<LARCA20_SmoScopeGroupedRows>
    {
        public override bool Guardar(LARCA20_SmoScopeGroupedRows entity)
        {
            try
            {
                if (entity.SmoScopeID == 0)
                {
                    Context.LARCA20_SmoScopeGroupedRows.Add(entity);
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

        public override List<LARCA20_SmoScopeGroupedRows> Todos()
        {
            
           // DateTime siev = DateTime.Now.AddDays(-7);
            return Context.LARCA20_SmoScopeGroupedRows.ToList();
        }

        public List<LARCA20_SmoScopeGroupedRows> TraerPorGroupId(int id)
        {
            return Context.LARCA20_SmoScopeGroupedRows.Where(r => r.GroupSmoID == id).ToList();
        }

        public override LARCA20_SmoScopeGroupedRows Traer(long id)
        {
            return Context.LARCA20_SmoScopeGroupedRows.SingleOrDefault(r => r.SmoScopeID == id);
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
