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
    
    public partial class ContactPerson
    {
        public int Id { get; set; }
        public int CustomerFk { get; set; }
        public string Name { get; set; }
        public string HPNumber { get; set; }
        public string OfficeNumber { get; set; }
        public string EmailAddress { get; set; }
        public Nullable<int> StatusFk { get; set; }
        public string Remark { get; set; }
        public string ModifiedBy { get; set; }
        public System.DateTime ModifiedOn { get; set; }
    
        public virtual Status Status { get; set; }
        public virtual Customer Customer { get; set; }
    }
}
