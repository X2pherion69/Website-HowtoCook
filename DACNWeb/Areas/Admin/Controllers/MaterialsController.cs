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
using PagedList;

namespace DACNWeb.Areas.Admin.Controllers
{
    public class MaterialsController : BaseController
    {
        private DACNEntities db = new DACNEntities();

        // GET: Admin/Materials
        //public ActionResult Index()
        //{
        //    return View(db.Materials.ToList());
        //}








        public ActionResult Index(string currentFilter, string Search, int? page, string sortMate)
        {
            ViewBag.CurrentSort = sortMate;
            ViewBag.DateSortParm = String.IsNullOrEmpty(sortMate) ? "ma_desc" : "";
            ViewBag.NameSortParm = sortMate == "ten" ? "ten_desc" : "ten";
            //var foods = db.Foods.AsQueryable();



            if (Search != null) {
                page = 1;
            }
            else {
                Search = currentFilter;
            }
            var meterial = db.Materials.AsQueryable();

            if (!String.IsNullOrWhiteSpace(Search)) {
                meterial = db.Materials.Where(n => n.TenNL.Contains(Search));
            }
            ViewBag.CurrentFilter = Search;


            switch (sortMate) {
                case "ma_desc":
                    meterial = meterial.OrderBy(s => s.IDNguyenLieu);
                    break;
                case "ten":
                    meterial = meterial.OrderBy(s => s.TenNL);
                    break;
                case "ten_desc":
                    meterial = meterial.OrderByDescending(s => s.TenNL);
                    break;
                default:
                    meterial = meterial.OrderByDescending(s => s.IDNguyenLieu);
                    break;
            }



            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return View(meterial.ToPagedList(pageNumber, pageSize));

        }








        // GET: Admin/Materials/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material material = db.Materials.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            return View(material);
        }

        // GET: Admin/Materials/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Materials/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MaterialViewModels model)
        {
            if (ModelState.IsValid)
            {
                Material lst = new Material {
                    IDNguyenLieu = model.IDNguyenLieu,
                    TenNL = model.TenNL,
                    DonVi = model.DonVi,
                };

                db.Materials.Add(lst);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(model);
        }
        

        // GET: Admin/Materials/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material material = db.Materials.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            return View(material);
        }

        // POST: Admin/Materials/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Material model)
        {
            if (ModelState.IsValid)
            {
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        // GET: Admin/Materials/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material material = db.Materials.Find(id);
            if (material == null)
            {
                return HttpNotFound();
            }
            return View(material);
        }

        // POST: Admin/Materials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Material material = db.Materials.Find(id);
            db.Materials.Remove(material);
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
