using LARCA2.Data.DatabaseModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.Data.Services
{
    public class SmoDetailDAL : BaseDAL<LARCA20_SmoScopeDetail>
    {
        public override bool Guardar(LARCA20_SmoScopeDetail entity)
        {
            try
            {
                if (entity.DetailID == 0)
                {
                  //  entity.MasterBUDetail = null;
                  //  entity.MasterSMODetail = null;
                    Context.LARCA20_SmoScopeDetail.Add(entity);
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

        public override List<LARCA20_SmoScopeDetail> Todos()
        {
            return Context.LARCA20_SmoScopeDetail.Where(s => s.deleted == false).ToList();
        }

        public override LARCA20_SmoScopeDetail Traer(long id)
        {
            return Context.LARCA20_SmoScopeDetail.SingleOrDefault(s => s.SmoScopeID == id);
        }

        public override bool Eliminar(long id)
        {
            try
            {
                var entity = Traer(id);
                entity.deleted = false;
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
