using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace LARCA2.Data.DatabaseModels
{
    /// <summary>
    /// Clase parcial que contiene las validaciones de los campos del usuario
    /// </summary>
    [MetadataType(typeof(LARCA20_RcClasificationMD))]
    public partial class LARCA20_RcClasification
    {
        public class LARCA20_RcClasificationMD
        {
            [Required(ErrorMessage = "Requerido")]
            public string Nivel { get; set; }
            [Required(ErrorMessage = "Requerido")]
            public string Codigo { get; set; }
            [Required(ErrorMessage = "Requerido")]
            public string Descripcion { get; set; }
        }
    }
}
