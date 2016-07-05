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
            [Required(ErrorMessage = "Required")]
            public string name { get; set; }
            [Required(ErrorMessage = "Required")]
            public string last_name { get; set; }
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Invalid")]
            public string Email { get; set; }
            [Required(ErrorMessage = "Required")]
            public string user_name { get; set; }
            [Required(ErrorMessage = "Required")]
            public string pass { get; set; }
        }
    }
}
