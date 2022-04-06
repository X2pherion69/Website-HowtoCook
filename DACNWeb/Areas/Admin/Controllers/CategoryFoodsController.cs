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
    public class CategoryFoodsController : BaseController
    {
        private DACNEntities db = new DACNEntities();

        // GET: Admin/CategoryFoods
        public ActionResult Index()
        {
            return View(db.CategoryFoods.ToList());
        }

        // GET: Admin/CategoryFoods/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryFood categoryFood = db.CategoryFoods.Find(id);
            if (categoryFood == null)
            {
                return HttpNotFound();
            }
            return View(categoryFood);
        }

        // GET: Admin/CategoryFoods/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/CategoryFoods/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CategoryViewModels model)
        {
            if (ModelState.IsValid)
            {
                CategoryFood obj = new CategoryFood {
                    TenTheLoai = model.TenTheLoai,
                    IDTheLoai = model.IDTheLoai,
                };
                db.CategoryFoods.Add(obj);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(model);
        }

        // GET: Admin/CategoryFoods/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryFood categoryFood = db.CategoryFoods.Find(id);
            if (categoryFood == null)
            {
                return HttpNotFound();
            }
            return View(categoryFood);
        }

        // POST: Admin/CategoryFoods/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CategoryFood model)
        {
            if (ModelState.IsValid)
            {
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Admin/CategoryFoods/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CategoryFood categoryFood = db.CategoryFoods.Find(id);
            if (categoryFood == null)
            {
                return HttpNotFound();
            }
            return View(categoryFood);
        }

        // POST: Admin/CategoryFoods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CategoryFood categoryFood = db.CategoryFoods.Find(id);
            db.CategoryFoods.Remove(categoryFood);
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
