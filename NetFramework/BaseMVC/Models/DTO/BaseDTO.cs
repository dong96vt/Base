using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace NetFramework.Models.DTO
{
    public class BaseDTO
    {
        public Guid? ID { get; set; }
        public System.Guid CreateBy { get; set; }
        public System.DateTime CreareDate { get; set; }
        public Nullable<System.Guid> UpdateBy { get; set; }
        public Nullable<System.DateTime> UpdateDate { get; set; }
        public bool DeleteFlg { get; set; }
    }
}