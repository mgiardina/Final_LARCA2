using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace LARCA2.Data.DatabaseModels
{
    /// <summary>
    /// Clase parcial que contiene las validaciones de los campos del RcClasification
    /// </summary>
    [MetadataType(typeof(LARCA20_UsuarioMD))]
    public partial class LARCA20_Usuario
    {
        public class LARCA20_UsuarioMD
        {
            [Required(ErrorMessage = "Requerido")]
            public string Nombre { get; set; }
            [Required(ErrorMessage = "Requerido")]
            public string Apellido { get; set; }
            [Required(ErrorMessage = "Requerido")]
            [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Inválido")]
            public string Email { get; set; }
            [Required(ErrorMessage = "Requerido")]
            public string Usuario { get; set; }
            [Required(ErrorMessage = "Requerida")]
            public string Clave { get; set; }
        }
    }
}
