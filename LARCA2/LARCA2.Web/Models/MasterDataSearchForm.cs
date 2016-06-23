using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Larca2.Models
{
    public class MasterDataSearchForm
    {
        public LARCA2.Data.DatabaseModels.LARCA20_MasterData MasterData { get; set; }
        public List<LARCA2.Data.DatabaseModels.LARCA20_MasterData> MasterDataList { get; set; }
        public bool[] Selected { get; set; }
    }
}