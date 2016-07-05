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
    [MetadataType(typeof(LARCA20_MasterDataMD))]
    public partial class LARCA20_MasterData
    {
        public class LARCA20_MasterDataMD
        {
            [Required(ErrorMessage = "Required")]
            public string Data { get; set; }
            [Required(ErrorMessage = "Required")]
            public string DataIni { get; set; }
        }
    }
}
