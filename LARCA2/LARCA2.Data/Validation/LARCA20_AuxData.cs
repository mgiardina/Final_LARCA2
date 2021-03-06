﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace LARCA2.Data.DatabaseModels
{
    /// <summary>
    /// Clase parcial que contiene las validaciones de los campos del MasterData
    /// </summary>
    [MetadataType(typeof(LARCA20_AuxDataMD))]
    public partial class LARCA20_AuxData
    {
        public class LARCA20_AuxDataMD
        {
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[0-9]*$", ErrorMessage = "Invalid, Only numbers")]
            public string TopLvl2 { get; set; }
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[0-9]*$", ErrorMessage = "Invalid, Only numbers")]
            public string TopLvl3 { get; set; }
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[0-9]*$", ErrorMessage = "Invalid, Only numbers")]
            public string Toplvl4 { get; set; }
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[0-9]*$", ErrorMessage = "Invalid, Only numbers")]
            public string XlsRowFrom { get; set; }
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[0-9]*$", ErrorMessage = "Invalid, Only numbers")]
            public string XlsColumnFrom { get; set; }
            [Required(ErrorMessage = "Required")]
            [RegularExpression("^[0-9]*$", ErrorMessage = "Invalid, Only numbers")]
            public string qtyattach { get; set; }
        }
    }
}
