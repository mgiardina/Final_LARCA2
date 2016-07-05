using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Larca2.Models
{
    public class Level4SearchForm
    {
        public LARCA2.Data.DatabaseModels.LARCA20_Level4 Level4 { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_Level4> Level4List { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> Level3List { get; set; }
        public int filterlimit { get; set; }
        public bool[] Selected { get; set; }
    }
}