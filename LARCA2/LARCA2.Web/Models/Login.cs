using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.ComponentModel.DataAnnotations;

namespace Larca2.Models
{
    public class Login
    {
        public string NombreUsuario { get; set; }
        [Required]
        public string Clave { get; set; }
        [Required]
        public int Empresa { get; set; }  
    }
}