using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Data.Services
{
    public class EmailsDAL : BaseDAL<LARCA20_Emails>
    {
        public override bool Guardar(LARCA20_Emails entity)
        {
            try
            {
                if (entity.EmailID == 0)
                {
                    Context.LARCA20_Emails.Add(entity);
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

        public override List<LARCA20_Emails> Todos()
        {
            return Context.LARCA20_Emails.ToList();
        }

        public override LARCA20_Emails Traer(long id)
        {
            return Context.LARCA20_Emails.SingleOrDefault(e => e.EmailID == id);
        }

        //Chequeo si existe el email en la base de datos
        public bool EmailExiste(string messageId)
        {
            return Context.LARCA20_Emails.Count(e=> e.MessageID == messageId && e.deleted) > 0;
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
