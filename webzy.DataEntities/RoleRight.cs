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
    
    public partial class RoleRight
    {
        public int Id { get; set; }
        public Nullable<int> RoleFk { get; set; }
        public Nullable<int> RightFk { get; set; }
        public string Remark { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifedOn { get; set; }
    
        public virtual Right Right { get; set; }
        public virtual Role Role { get; set; }
    }
}
