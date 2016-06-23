using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.Business.Entities
{
    public class MasterRow
    {
        public string Day { get; set; }
        public string FPC { get; set; }
        public string ReportingCountry { get; set; }
        public string ProfitCenter { get; set; }
        public string ReasonCode { get; set; }
        public string RootCauseCode { get; set; }
        public string SAPSite { get; set; }
        public string Customer { get; set; }
        public decimal SUCases { get; set; }
    }
}
