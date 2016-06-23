using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class SmoScopeDAL : BaseDAL<LARCA20_SmoScope>
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
            
           // DateTime siev = DateTime.Now.AddDays(-7);
            return Context.LARCA20_SmoScope.ToList();
        }

        public override LARCA20_SmoScope Traer(long id)
        {
            return Context.LARCA20_SmoScope.SingleOrDefault(r => r.SmoScopeID == id);
        }

        public List<LARCA20_SmoScope> TodosConExclusiones()
        {
            var list = Context.LARCA20_SmoScope.Where(r => r.Borrado == false).ToList();
            var finalList = new List<LARCA20_SmoScope>();
            var exclusiones = new MasterDataDAL().TraerExclusiones();
            foreach (var item in list)
            {
                if (!exclusiones.Contains(item.RefIdSMO.Value))
                {
                    finalList.Add(item);
                }
            }
            return finalList;
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
