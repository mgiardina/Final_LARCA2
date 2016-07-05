//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LARCA2.Data.DatabaseModels
{
    using System;
    using System.Collections.Generic;
    
    public partial class LARCA20_SmoScope
    {
        public LARCA20_SmoScope()
        {
            this.SmoScopeDetail = new HashSet<LARCA20_SmoScopeDetail>();
        }
    
        public long SmoScopeID { get; set; }
        public Nullable<long> RefIdSMO { get; set; }
        public Nullable<long> RefIdBU { get; set; }
        public Nullable<long> RefIdOwner { get; set; }
        public Nullable<long> RefIdRC { get; set; }
        public Nullable<decimal> Volumen { get; set; }
        public string Problem { get; set; }
        public string Why1 { get; set; }
        public string Why2 { get; set; }
        public string Why3 { get; set; }
        public string ActionPlan { get; set; }
        public Nullable<int> RefIdResponsable { get; set; }
        public Nullable<System.DateTime> DueDate { get; set; }
        public string O_C { get; set; }
        public Nullable<long> Level4 { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public bool deleted { get; set; }
    
        public virtual ICollection<LARCA20_SmoScopeDetail> SmoScopeDetail { get; set; }
        public virtual LARCA20_MasterData MasterBU { get; set; }
        public virtual LARCA20_MasterData MasterOwner { get; set; }
        public virtual LARCA20_MasterData MasterSMO { get; set; }
        public virtual LARCA20_RcClasification MasterLvl { get; set; }
        public virtual LARCA20_Responsable ResponsableSmo { get; set; }
    }
}
