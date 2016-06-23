using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace LARCA2.Data.DatabaseModels
{
    /// <summary>
    /// Clase parcial que contiene las validaciones de los campos del MasterData
    /// </summary>
    [MetadataType(typeof(LARCA20_Level4MD))]
    public partial class LARCA20_Level4
    {
        public class LARCA20_Level4MD
        {
            [Required(ErrorMessage = "Requerido")]
            public string Nombre { get; set; }
        }
    }
}
