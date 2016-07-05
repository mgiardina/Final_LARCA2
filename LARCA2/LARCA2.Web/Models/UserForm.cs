using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Larca2.Models
{
    public class UserForm
    {
        public LARCA2.Data.DatabaseModels.LARCA20_Users Usuario { get; set; }
        public bool Responsible { get; set; }
    }
}