using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NetFramework.Areas.Account.Controllers
{
    public class RoleController : Controller
    {
        // GET: Account/Role
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UpdateControlRole()
        {
            return View();
        }
        public ActionResult UpdateMenuRole()
        {
            return View();
        }
    }
}