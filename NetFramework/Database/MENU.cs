//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NetFramework.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class MENU
    {
        public System.Guid ID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public Nullable<System.Guid> ParentID { get; set; }
        public System.Guid CreateBy { get; set; }
        public System.DateTime CreareDate { get; set; }
        public Nullable<System.Guid> UpdateBy { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public bool DeleteFlg { get; set; }
    }
}
