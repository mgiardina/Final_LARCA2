using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Larca2.Models;

namespace Larca2.Views.ViewModels
{
    public class LoginViewModel
    {
        public Login Usuario { get; set; }
        public bool UsuarioInvalido { get; set; }
        public string Error { get; set; }
        public string Log { get; set; }

        public LoginViewModel()
        {
            Usuario = new Login();
            UsuarioInvalido = false;
        }
    }
}