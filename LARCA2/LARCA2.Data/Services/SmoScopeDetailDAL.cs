using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class SmoScopeDetailDAL : BaseDAL<LARCA20_SmoScopeDetail>
    {
        public override bool Guardar(LARCA20_SmoScopeDetail entity)
        {
            try
            {
                if (entity.SmoScopeID == 0)
                {
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
            return Context.LARCA20_SmoScopeDetail.Where(r => r.Borrado == false).ToList();
        }

        public override LARCA20_SmoScopeDetail Traer(long id)
        {
            return Context.LARCA20_SmoScopeDetail.SingleOrDefault(r => r.DetailID == id);
        }

        public bool Existe(long? buId, string customer, long? lvl2Id, long? lvl3Id, long? smoId, decimal volume, long? reasonId, DateTime dateDesde)
        {
            return Context.LARCA20_SmoScopeDetail.Where(dt => dt.BuID == buId && dt.Customer == customer && dt.Lvl2ID == lvl2Id && dt.Lvl3ID == lvl3Id && dt.SmoID == smoId && dt.Volumen == volume && dt.ReasonID == reasonId && dt.Fecha > dateDesde).ToList().Count > 0;
        }

        public List<LARCA20_SmoScopeDetail> TraerDetalles(int id)
        {
            return Context.LARCA20_SmoScopeDetail.Where(r => r.SmoScopeID == id).ToList();
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
