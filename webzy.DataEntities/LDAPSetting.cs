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
    
    public partial class LDAPSetting
    {
        public int Id { get; set; }
        public string DomainName { get; set; }
        public string LDAPAddress { get; set; }
        public string Remark { get; set; }
        public string ModifyBy { get; set; }
        public Nullable<System.DateTime> ModifyOn { get; set; }
    }
}
