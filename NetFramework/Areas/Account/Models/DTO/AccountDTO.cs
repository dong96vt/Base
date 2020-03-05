using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NetFramework.Models.DTO
{
    public class AccountDTO : BaseDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int? Sex { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? LastTimeLogin { get; set; }
        public int Status { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public Guid? GroupRoleID { get; set; }
        public DateTime CreateDate { get; set; }
        public Guid CreateBy { get; set; }
    }
}