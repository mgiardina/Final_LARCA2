using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LARCA2.Business.Entities
{
    public class ReportRow
    {
        public string SMO { get; set; }
        public string RBU { get; set; }
        public string CUT { get; set; }
        public string VOLUME { get; set; }
        public string GAP { get; set; }
        public string PROBLEM { get; set; }
        public string WHY1 { get; set; }
        public string WHY2 { get; set; }
        public string WHY3 { get; set; }
        public string ACTIONPLAN { get; set; }
        public string RESPONSIBLE { get; set; }
        public string GAPANALYSIS { get; set; }
        public string LEVEL4 { get; set; }
        public List<ReportRow> Details { get; set; }
    }
}
