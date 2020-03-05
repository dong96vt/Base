using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NetFramework.Models.DTO
{
    public class MenuDTO : BaseDTO
    {
        public string Code { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public Nullable<System.Guid> ParentID { get; set; }
    }
}