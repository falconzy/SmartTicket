//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace webzy.DataEntities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Site
    {
        public int Id { get; set; }
        public int CustomerFk { get; set; }
        public Nullable<int> CountryFk { get; set; }
        public string SiteName { get; set; }
        public string Address { get; set; }
        public int StatusFk { get; set; }
        public string Remark { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    
        public virtual Country Country { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual Status Status { get; set; }
    }
}
