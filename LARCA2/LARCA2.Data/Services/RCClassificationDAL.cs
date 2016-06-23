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
                if (entity.IdRenglon == 0)
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
                                                        where q.Codigo.Contains(Tx1) && q.Descripcion.Contains(Tx2)
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
                                                                                           where q.Nivel.Equals("3")
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
                                                                                           where q.Descripcion.Contains(Tx1)
                                                                                           select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }


        public override LARCA2.Data.DatabaseModels.LARCA20_RcClasification Traer(long id)
        {
            return Context.LARCA20_RcClasification.SingleOrDefault(u => u.IdRenglon == id);
        }

        public LARCA2.Data.DatabaseModels.LARCA20_RcClasification TraerPorDesc(string desc)
        {
            if (Context.LARCA20_RcClasification.SingleOrDefault(u => u.Descripcion == desc) == null)
                return Context.LARCA20_RcClasification.SingleOrDefault(u => u.Descripcion.Contains(desc.Substring(0,5)));
            return Context.LARCA20_RcClasification.SingleOrDefault(u => u.Descripcion == desc);
        }

        // Overload de metodo Traer
        public LARCA2.Data.DatabaseModels.LARCA20_RcClasification Traer(string codigo)
        {
            return Context.LARCA20_RcClasification.SingleOrDefault(c => c.Codigo == codigo && c.Borrado== false);
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> TodosXLevel(string tx1)
        {
            return Context.LARCA20_RcClasification.Where(q => q.Nivel == tx1 && q.Borrado == false).OrderBy(q => q.Descripcion).ToList();
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
