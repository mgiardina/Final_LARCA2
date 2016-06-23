using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class ApplicationDataDAL : BaseDAL<LARCA2.Data.DatabaseModels.LARCA20_AuxData>
    {
        public LARCA2.Data.DatabaseModels.Larca2Entities Context;
        public ApplicationDataDAL()
        {
            Context = new Larca2Entities();
        }

        public override List<LARCA2.Data.DatabaseModels.LARCA20_AuxData> Todos()
        {
            //return Context.LARCA20_AuxData.SingleOrDefault(d => d.RowId == 1);
            return Context.LARCA20_AuxData.ToList();
        }

        public override bool Guardar(LARCA2.Data.DatabaseModels.LARCA20_AuxData entity)
        {
            try
            {
                if (entity.RowId == 0)
                {
                    Context.LARCA20_AuxData.Add(entity);
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

        public override LARCA2.Data.DatabaseModels.LARCA20_AuxData Traer(long id)
        {
            return Context.LARCA20_AuxData.SingleOrDefault(u => u.RowId == id);
        }

        public override bool Eliminar(long id)
        {
            try
            {
                var entity = Traer(id);
                //entity.Borrado = true;
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
