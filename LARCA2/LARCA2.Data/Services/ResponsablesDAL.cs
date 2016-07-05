using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class ResponsablesDAL : BaseDAL<LARCA20_Responsable>
    {
        public override bool Guardar(LARCA20_Responsable entity)
        {
            try
            {
                if (entity.Id == 0)
                {
                    Context.LARCA20_Responsable.Add(entity);
                    Context.SaveChanges();
                    int id = entity.Id;
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

        public override List<LARCA20_Responsable> Todos()
        {
            return Context.LARCA20_Responsable.ToList();
        }

        public override LARCA20_Responsable Traer(long id)
        {
            return Context.LARCA20_Responsable.SingleOrDefault(u => u.Id == id);
        }

        public LARCA20_Responsable TraerPorNombreDeResponsable(string name)
        {
            return Context.LARCA20_Responsable.SingleOrDefault(u => u.Name == name);
        }

        public LARCA20_Responsable TraerPorNombreDeUsuario(string username)
        {

          LARCA20_Users user = Context.LARCA20_Users.Where(x => x.user_name == username).FirstOrDefault();

            return Context.LARCA20_Responsable.SingleOrDefault(u => u.RefIdUser == user.Id);
        }

        public string TraerSuNombreDeUsuario(int refIdResponsable)
        {
            return Context.LARCA20_Users.Where(x => x.Id == Context.LARCA20_Responsable.FirstOrDefault(u => u.Id == refIdResponsable).RefIdUser).ToList()[0].user_name;

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

