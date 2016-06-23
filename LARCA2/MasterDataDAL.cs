using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class MasterDataDAL : BaseDAL<LARCA2.Data.DatabaseModels.LARCA20_MasterData>
    {
        public override bool Guardar(LARCA2.Data.DatabaseModels.LARCA20_MasterData entity)
        {
            try
            {
                if (entity.IdRenglon == 0)
                {
                    Context.LARCA20_MasterData.Add(entity);
                    Context.SaveChanges();
                }
                else
                {
                    //algo aca falla
                    //Lo estuve probando y no me falla.. quizas cambie algo ya 
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

        public override List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> Todos()
        {
            return Context.LARCA20_MasterData.ToList();
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> TodosFiltro(string Tx1, string Tx2)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);
            Tx2 = (Tx2 == null ? "" : Tx2);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_MasterData> ObjFiltro = from q in ObjEnt.LARCA20_MasterData
                                                                                      where q.Data.Contains(Tx1) && q.DataIni.Contains(Tx2)
                                                                                      select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public override LARCA2.Data.DatabaseModels.LARCA20_MasterData Traer(long id)
        {
            return Context.LARCA20_MasterData.SingleOrDefault(u => u.IdRenglon == id);
        }

        // Overload de metodo Traer
        public LARCA2.Data.DatabaseModels.LARCA20_MasterData Traer(string data, int id)
        {
            return Context.LARCA20_MasterData.SingleOrDefault(c => c.Data == data && c.IdRenglon == id);
        }

        // Overload de metodo Traer
        public LARCA2.Data.DatabaseModels.LARCA20_MasterData Traer(string codigo, string ini)
        {
            return Context.LARCA20_MasterData.SingleOrDefault(c => c.Data == codigo && c.DataIni == ini);
        }

        public LARCA2.Data.DatabaseModels.LARCA20_MasterData TraerPorData(string data, string dataIni)
        {
            return Context.LARCA20_MasterData.SingleOrDefault(c => c.Data == data && c.DataIni == dataIni);
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

        public List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> TraerSoloData(string Tx1)
        {
            Tx1 = (Tx1 == null ? "" : Tx1);
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_MasterData> ObjFiltro = from q in ObjEnt.LARCA20_MasterData
                                                                                      where q.Data == Tx1 && q.Borrado == false
                                                                                      select q;

                List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }

        public List<long> TraerExclusiones()
        {
            var lista = new List<long>();
            foreach (var item in Context.LARCA20_MasterDataSMOLess.Where(m => m.borrado == false).ToList())
            {
                lista.Add((Int64)item.RefIdMasterDataSMO);
            }
            return lista;
        }

        public List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> FiltroId(long Tx1)
        {
     
            using (Larca2Entities ObjEnt = new Larca2Entities())
            {
                IQueryable<LARCA2.Data.DatabaseModels.LARCA20_MasterData> ObjFiltro = from q in ObjEnt.LARCA20_MasterData
                                                                                      where q.IdRenglon.Equals(Tx1)
                                                                                      select q;
                List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> ListaReturn = ObjFiltro.ToList();

                return ListaReturn;
            }
        }
    }
}