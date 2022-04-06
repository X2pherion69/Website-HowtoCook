using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DACNWeb.Models;
using PagedList;

namespace DACNWeb.Areas.Admin.Controllers
{
    public class FoodsController : BaseController
    {
        private DACNEntities db = new DACNEntities();


        public ActionResult Index(string currentFilter, string Search, int? page,string sortFood)
        {
            ViewBag.CurrentSort = sortFood;
            ViewBag.DateSortParm = String.IsNullOrEmpty(sortFood) ? "ma_desc" : "";
            ViewBag.NameSortParm = sortFood == "ten" ? "ten_desc" : "ten";
            //var foods = db.Foods.AsQueryable();



            if (Search != null) {
                page = 1;
            }
            else {
                Search = currentFilter;
            }
            var foods = db.Foods.AsQueryable();

            if (!String.IsNullOrWhiteSpace(Search)) {
                foods = db.Foods.Where(n => n.TenMonAn.Contains(Search));
            }
            ViewBag.CurrentFilter = Search;


            switch (sortFood) {
                case "ma_desc":
                    foods = foods.OrderBy(s => s.NgayTao);
                    break;
                case "ten":
                    foods = foods.OrderBy(s => s.TenMonAn);
                    break;
                case "ten_desc":
                    foods = foods.OrderByDescending(s => s.TenMonAn);
                    break;
                default:
                    foods = foods.OrderByDescending(s => s.IDFood);
                    break;
            }


            
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return View(foods.ToPagedList(pageNumber, pageSize));

        }





        // GET: Admin/Foods/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food food = db.Foods.Find(id);
            if (food == null) {
                return HttpNotFound();
            }
            return View(food);
        }

        // GET: Admin/Foods/Create
        //[Authorize(Roles = "admin")]
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.IDTheLoai = new SelectList(db.CategoryFoods, "IDTheLoai", "TenTheLoai");
            ViewBag.IDMethod = new SelectList(db.CookingMethods, "IDMethod", "TenPPN");
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName");

            db = new DACNEntities();
            Food food = new Food();
            food.arrayNL = db.Materials.ToList();
            return View(food);
        }

        // POST: Admin/Foods/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(Food food)
        {
            List<Detailfood> idM = new List<Detailfood>();

            string[] arr = food.idMeterialList.Split('-');

            for(int i=0;i< arr.Length;i++) {
                string[] val = arr[i].Split('&');

                int id = int.Parse(val[0]);
                Detailfood df = new Detailfood();
                df.IDNguyenLieu = id;
                df.SoLuong = val[1];
                idM.Add(df);
            }

            var NL = db.Materials.ToList();
            food.arrayNL = NL;

            if (ModelState.IsValid) {
                //upload file
                if (food.ImageUpload != null && food.ImageUpload.ContentLength > 0) {
                    string filename = Path.GetFileNameWithoutExtension(food.ImageUpload.FileName);
                    string extension = Path.GetExtension(food.ImageUpload.FileName);
                    filename = filename + "_" + long.Parse(DateTime.Now.ToString("ddMMyyyyhhmmss")) + extension;
                    food.Image = "~/Content/img/" + filename;
                    food.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/img/"), filename));
                }
                food.NgayTao = DateTime.Now;
                food.UserID = int.Parse(Session["UserId"].ToString());
                db.Foods.Add(food);
                db.SaveChanges();

                int intfoodid = food.IDFood;

                List<Detail> lstDetail = new List<Detail>();
                foreach (var item in idM) {
                    Detail obj = new Detail();
                    obj.IDFood = intfoodid;
                    obj.IDNguyenLieu = item.IDNguyenLieu;
                    obj.SoLuong = item.SoLuong;
                    lstDetail.Add(obj);
                }
                db.Details.AddRange(lstDetail);
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            ViewBag.IDTheLoai = new SelectList(db.CategoryFoods, "IDTheLoai", "TenTheLoai", food.IDTheLoai);
            ViewBag.IDMethod = new SelectList(db.CookingMethods, "IDMethod", "TenPPN", food.IDMethod);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", food.UserID);


            return View(food);
        }

        // GET: Admin/Foods/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food food = db.Foods.Find(id);
            if (food == null) {
                return HttpNotFound();
            }

            db = new DACNEntities();
            food.arrayNL = db.Materials.ToList();

            ViewBag.IDTheLoai = new SelectList(db.CategoryFoods, "IDTheLoai", "TenTheLoai", food.IDTheLoai);
            ViewBag.IDMethod = new SelectList(db.CookingMethods, "IDMethod", "TenPPN", food.IDMethod);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", food.UserID);
            return View(food);
        }

        // POST: Admin/Foods/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(int id, Food food)
        {
            //List<Detailfood> idM = new List<Detailfood>();

            //string[] arr = food.idMeterialList.Split('-');

            //for (int i = 0; i < arr.Length; i++) {
            //    string[] val = arr[i].Split('&');

            //    int id1 = int.Parse(val[0]);
            //    Detailfood df = new Detailfood();
            //    df.IDNguyenLieu = id1;
            //    df.SoLuong = val[1];
            //    idM.Add(df);
            //}

            var NL = db.Materials.ToList();
            food.arrayNL = NL;


            if (ModelState.IsValid) {
                if (food.ImageUpload != null && food.ImageUpload.ContentLength > 0) {
                    string filename = Path.GetFileNameWithoutExtension(food.ImageUpload.FileName);
                    string extension = Path.GetExtension(food.ImageUpload.FileName);
                    filename = filename + "_" + long.Parse(DateTime.Now.ToString("ddMMyyyyhhmmss")) + extension;
                    food.Image = "~/Content/img/" + filename;
                    food.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/img/"), filename));
                }
                db.Entry(food).State = EntityState.Modified;
                food.NgayTao = DateTime.Now;
                db.SaveChanges();

                //int intfoodid = food.IDFood;

                //List<Detail> lstDetail = new List<Detail>();
                //foreach (var item in idM) {
                //    Detail obj = new Detail();
                //    obj.IDFood = intfoodid;
                //    obj.IDNguyenLieu = item.IDNguyenLieu;
                //    obj.SoLuong = item.SoLuong;
                //    lstDetail.Add(obj);
                //}
                //db.Entry(lstDetail).State = EntityState.Modified;
                //db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDTheLoai = new SelectList(db.CategoryFoods, "IDTheLoai", "TenTheLoai", food.IDTheLoai);
            ViewBag.IDMethod = new SelectList(db.CookingMethods, "IDMethod", "TenPPN", food.IDMethod);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", food.UserID);
            return View(food);
        }

        // GET: Admin/Foods/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null) {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Food food = db.Foods.Find(id);
            if (food == null) {
                return HttpNotFound();
            }
            return View(food);
        }

        // POST: Admin/Foods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Food foods = db.Foods.Find(id);
            var detail = db.Details.Where(t => t.IDFood == id).ToList();
            foreach(var item in detail) {
                db.Details.Remove(item);
            }
            db.Foods.Remove(foods);
            db.SaveChanges();

            return RedirectToAction("Index");
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing) {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
