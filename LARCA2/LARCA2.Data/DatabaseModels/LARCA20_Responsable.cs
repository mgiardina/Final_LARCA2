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
    
    public partial class LARCA20_Responsable
    {
        public LARCA20_Responsable()
        {
            this.ResponsableSmo = new HashSet<LARCA20_SmoScope>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Last_name { get; set; }
        public string Email { get; set; }
        public Nullable<int> RefIdUser { get; set; }
        public bool deleted { get; set; }
    
        public virtual ICollection<LARCA20_SmoScope> ResponsableSmo { get; set; }
    }
}
