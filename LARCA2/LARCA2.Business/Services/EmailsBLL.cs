//using LARCA2.Data;
using LARCA2.Data.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LARCA2.Data.DatabaseModels;

namespace LARCA2.Business.Services
{
    public class EmailsBLL
    {
        public Data.Services.EmailsDAL EmailsDAL;

        public EmailsBLL()
        {
            EmailsDAL = new Data.Services.EmailsDAL();
        }

        public bool Guardar(LARCA20_Emails email)
        {
            return EmailsDAL.Guardar(email);
        }

        public List<LARCA20_Emails> Todos()
        {
            return EmailsDAL.Todos();
        }

        public LARCA20_Emails Traer(long id)
        {
            return EmailsDAL.Traer(id);
        }

        public bool Eliminar(long id)
        {
            return EmailsDAL.Eliminar(id);
        }

        public bool EmailExiste(string messageId)
        {
            return EmailsDAL.EmailExiste(messageId);
        }

        public bool Procesado(long id)
        {
            var email = EmailsDAL.Traer(id);
            email.Procesado = true;
            return EmailsDAL.Guardar(email);
        }
    }
}
