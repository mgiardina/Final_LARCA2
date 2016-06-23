using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Larca2.Models
{
    public class RcClasificationSearchForm
    {
        public LARCA2.Data.DatabaseModels.LARCA20_RcClasification RcClasification { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> RcClasificationList { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_RcClasification> Level3List { get; set; }
        public bool[] Selected { get; set; }
    }
}