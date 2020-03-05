using NetFramework.Models.DAO;
using NetFramework.Models.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NetFramework.Controllers
{
    public class BaseManagerController<TDTO, T> : Controller where TDTO : BaseDTO where T : class
    {
        private BaseDAO<TDTO, T> baseDAO = new BaseDAO<TDTO, T>();
        public ActionResult Index()
        {
            return View(baseDAO.GetAll());
        }

        public ActionResult Edit(Guid? id)
        {
            ViewBag.Title = id == null ? "Insert" : "Update";
            return View(baseDAO.Get(id));
        }
        [HttpPost]
        public ActionResult Insert(TDTO input)
        {
            CheckValidation_Insert();
            if (ModelState.IsValid)
            {
                input.ID = Guid.NewGuid();
                input.CreareDate = DateTime.Now;
                input.CreateBy = Guid.Empty;
                input.DeleteFlg = false;
                if (baseDAO.Insert(input) == 1) return RedirectToAction("Index");
                return View("Error");
            }
            return View("Edit");
        }
        public virtual void CheckValidation_Insert()
        {
        }
        [HttpPost]
        public ActionResult Update(TDTO input)
        {
            CheckValidation_Update();
            if (ModelState.IsValid)
            {
                input.UpdateDate = DateTime.Now;
                input.UpdateBy = Guid.Empty;
                if (baseDAO.Update(input) == 1) return RedirectToAction("Index");
                return View("Error");
            }
            return View("Edit");
        }
        public virtual void CheckValidation_Update()
        {
        }
        public ActionResult Delete(TDTO input)
        {
            Func<TDTO[], int> action = baseDAO.Delete;
            if (typeof(T).GetProperty("DeleteFlg") != null)
            {
                input.DeleteFlg = true;
                action = baseDAO.Update;
            }
            TDTO[] inputs = { input };
            if (action(inputs) == 1) return RedirectToAction("Index");
            return View("Error");
        }

    }
}