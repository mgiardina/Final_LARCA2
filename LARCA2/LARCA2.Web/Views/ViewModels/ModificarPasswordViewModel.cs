using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.ComponentModel.DataAnnotations;

namespace Larca2.Views.ViewModels
{
    public class ModificarPasswordViewModel
    {
        [Required]
        public string PasswordViejo { get; set; }
        [Required]
        public string PasswordNuevo { get; set; }
        [Required]
        public string RepeticionPasswordNuevo { get; set; }
        public string Error { get; set; }

        public ModificarPasswordViewModel()
        {
            Error = string.Empty;
        }
    }
}