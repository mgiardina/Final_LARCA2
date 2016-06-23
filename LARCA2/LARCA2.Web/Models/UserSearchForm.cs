using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Larca2.Models
{
    public class UserSearchForm
    {
        public LARCA2.Data.DatabaseModels.LARCA20_Usuarios Usuario { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_Usuarios> Usuarios { get; set; }
        public bool[] Selected { get; set; }
    }
}