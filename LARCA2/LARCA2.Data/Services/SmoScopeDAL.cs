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
            return Context.LARCA20_SmoScope.Where(s => s.historic == false).ToList();
        }

        public List<LARCA20_SmoScope> TraerGrupo(int groupId)
        {

            // DateTime siev = DateTime.Now.AddDays(-7);
            return Context.LARCA20_SmoScope.Where(s => s.historic == false && s.GroupId == groupId).ToList();
        }

        public List<LARCA20_SmoScope> Filtrar(List<LARCA20_User_Owner> permisos)
        {
            var listaResult = new List<LARCA20_SmoScope>();
            foreach (var permiso in permisos)
            {
                var listTemp = Context.LARCA20_SmoScope.Where(s => s.historic == false).ToList().Where(s => s.RefIdBU == permiso.IdBU && s.RefIdSMO == permiso.IdSmo).ToList();
                listaResult.AddRange(listTemp);
            }
            // DateTime siev = DateTime.Now.AddDays(-7);
            return listaResult;
        }

        public override LARCA20_SmoScope Traer(long id)
        {
            return Context.LARCA20_SmoScope.SingleOrDefault(r => r.SmoScopeID == id);
        }

        public List<LARCA20_SmoScope> TodosConExclusiones()
        {
            var list = Context.LARCA20_SmoScope.Where(r => r.deleted == false && r.historic == false).ToList();
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

        public decimal calcular_volumenes(int tipo, long? bu, long? smo, string level)
            {
               var test = Context.SP_VOLUMEN(tipo, smo, bu, level).FirstOrDefault();
               
                return Convert.ToDecimal(test);

            }
    }
}
