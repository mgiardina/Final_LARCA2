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
            public string user_name { get; set; }
        }
    }
}
