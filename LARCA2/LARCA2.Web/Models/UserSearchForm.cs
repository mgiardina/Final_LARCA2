using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Larca2.Models
{
    public class UserSearchForm
    {
        public LARCA2.Business.Services.UsuariosBLL UsuariosBLL { get; set; }
        public LARCA2.Data.DatabaseModels.LARCA20_Users Usuario { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_Users> Usuarios { get; set; }
        public bool[] Selected { get; set; }

        public UserSearchForm()
        {
            UsuariosBLL = new LARCA2.Business.Services.UsuariosBLL();
        }
    }
}