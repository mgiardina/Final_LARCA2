using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class Level4DAL : BaseDAL<LARCA2.Data.DatabaseModels.LARCA20_Level4>
    {

        public override bool Guardar(LARCA2.Data.DatabaseModels.LARCA20_Level4 entity)
        {
            try
            {
                //if (entity.RefIdLevel3 == 0)
                if (entity.Id == 0)
                {
                    Context.LARCA20_Level4.Add(entity);
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

        public override List<LARCA2.Data.DatabaseModels.LARCA20_Level4> Todos()
        {
            return Context.LARCA20_Level4.OrderBy(q => q.LARCA20_RcClasification.Description).ThenBy(q => q.name).ToList();
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_Level4> TodosFiltro(string Tx1)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);        
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_Level4> ObjFiltro = from q in ObjEnt.LARCA20_Level4
                                                        where q.RefIdLevel3.ToString().Equals(Tx1)
                                                        select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_Level4> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public override LARCA2.Data.DatabaseModels.LARCA20_Level4 Traer(long id)
        {
            return Context.LARCA20_Level4.SingleOrDefault(u => u.Id == id);
        }

        // Overload de metodo Traer
        //public LARCA2.Data.DatabaseModels.LARCA20_Level4 Traer(string nombre)
        //{
        //    return Context.LARCA20_Level4.SingleOrDefault(c => c.Nombre == nombre);
        //}


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

        public List<LARCA2.Data.DatabaseModels.LARCA20_Level4> ValidarMaximo(int lvl3)
        {
            return Context.LARCA20_Level4.Where(q => q.RefIdLevel3==lvl3 && q.deleted== false).ToList();
        }
    }
}
