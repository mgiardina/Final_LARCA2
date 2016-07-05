using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class RCClassificationDAL : BaseDAL<LARCA2.Data.DatabaseModels.LARCA20_RcClasification>
    {

        public override bool Guardar(LARCA2.Data.DatabaseModels.LARCA20_RcClasification entity)
        {
            try
            {
                if (entity.Id == 0)
                {
                    Context.LARCA20_RcClasification.Add(entity);
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

        public override List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> Todos()
        {
            return Context.LARCA20_RcClasification.ToList();
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> TodosFiltro(string Tx1, string Tx2)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);
            Tx2 = (Tx2 == null ? "" : Tx2);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ObjFiltro = from q in ObjEnt.LARCA20_RcClasification
                                                        where q.Code.Contains(Tx1) && q.Description.Contains(Tx2)
                                                        select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> TodosNivel3()
        {
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ObjFiltro = from q in ObjEnt.LARCA20_RcClasification
                                                                                           where q.level_name.Equals("3")
                                                                                           select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }


        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> TodosNivel3_Filtro(string Tx1)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);
           
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ObjFiltro = from q in ObjEnt.LARCA20_RcClasification
                                                                                           where q.Description.Contains(Tx1)
                                                                                           select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }


        public override LARCA2.Data.DatabaseModels.LARCA20_RcClasification Traer(long id)
        {
            return Context.LARCA20_RcClasification.SingleOrDefault(u => u.Id == id);
        }

        public LARCA2.Data.DatabaseModels.LARCA20_RcClasification TraerPorDesc(string desc)
        {
            if (Context.LARCA20_RcClasification.SingleOrDefault(u => u.Description == desc) == null)
                return Context.LARCA20_RcClasification.SingleOrDefault(u => u.Description.Contains(desc.Substring(0,5)));
            return Context.LARCA20_RcClasification.SingleOrDefault(u => u.Description == desc);
        }

        // Overload de metodo Traer
        public LARCA2.Data.DatabaseModels.LARCA20_RcClasification Traer(string codigo)
        {
            return Context.LARCA20_RcClasification.SingleOrDefault(c => c.Code == codigo && c.deleted== false);
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> TodosXLevel(string tx1)
        {
            return Context.LARCA20_RcClasification.Where(q => q.level_name == tx1 && q.deleted == false).OrderBy(q => q.Description).ToList();
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
