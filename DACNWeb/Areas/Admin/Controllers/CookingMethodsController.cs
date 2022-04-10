using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DACNWeb.Models;
using DACNWeb.ViewModel;

namespace DACNWeb.Areas.Admin.Controllers
{
    public class CookingMethodsController : BaseController
    {
        private DACNEntities db = new DACNEntities();

        // GET: Admin/CookingMethods
        public ActionResult Index()
        {
            return View(db.CookingMethods.ToList());
        }

        // GET: Admin/CookingMethods/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CookingMethod cookingMethod = db.CookingMethods.Find(id);
            if (cookingMethod == null)
            {
                return HttpNotFound();
            }
            return View(cookingMethod);
        }

        // GET: Admin/CookingMethods/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/CookingMethods/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MethodViewModels model)
        {
            if (ModelState.IsValid)
            {
                CookingMethod obj = new CookingMethod {
                    TenPPN = model.TenPPN,
                    IDMethod = model.IDMethod,
                };
                db.CookingMethods.Add(obj);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(model);
        }

        // GET: Admin/CookingMethods/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            CookingMethod cookingMethod = db.CookingMethods.Find(id);

            if (cookingMethod == null)
            {
                return HttpNotFound();
            }
            return View(cookingMethod);
        }

        // POST: Admin/CookingMethods/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CookingMethod model)
        {
            if (ModelState.IsValid)
            {
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Admin/CookingMethods/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CookingMethod cookingMethod = db.CookingMethods.Find(id);
            if (cookingMethod == null)
            {
                return HttpNotFound();
            }
            return View(cookingMethod);
        }

        // POST: Admin/CookingMethods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CookingMethod cookingMethod = db.CookingMethods.Find(id);
            db.CookingMethods.Remove(cookingMethod);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
