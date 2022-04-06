using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACNWeb.Models;
using PagedList;

namespace DACNWeb.Controllers
{
    public class FoodController : Controller
    {
        private DACNEntities db = new DACNEntities();
        // GET: Food
        
        public ActionResult Method(string currentFilter, string Search, int? page, int id, string sortFood)
        {

            ViewBag.CurrentSort = sortFood;
            ViewBag.DateSortParm = String.IsNullOrEmpty(sortFood) ? "ma_desc" : "";
            ViewBag.NameSortParm = sortFood == "ten" ? "ten_desc" : "ten";

            var NL = db.Materials.ToList();
            var PP = db.CookingMethods.ToList();
            var method = db.Foods.Where(n => n.IDMethod == id).AsQueryable();

            if (Search != null) {
                page = 1;
            }
            else {
                Search = currentFilter;
            }
            if (!String.IsNullOrWhiteSpace(Search)) {
                method = db.Foods.Where(n => n.IDMethod == id).AsQueryable().Where(n => n.TenMonAn.Contains(Search)).AsQueryable();
            }
            ViewBag.CurrentFilter = Search;
            switch (sortFood) {
                case "ma_desc":
                    method = method.OrderBy(s => s.NgayTao);
                    break;
                case "ten":
                    method = method.OrderBy(s => s.TenMonAn);
                    break;
                case "ten_desc":
                    method = method.OrderByDescending(s => s.TenMonAn);
                    break;
                default:
                    method = method.OrderByDescending(s => s.IDFood);
                    break;
            }

            int pageSize = 12;
            int pageNumber = (page ?? 1);
            ViewBag.arrayNL = NL;
            ViewBag.arrayPPN = PP;
            return View(method.ToPagedList(pageNumber, pageSize));

        }
        public ActionResult Material (string currentFilter, string Search, int? page, int id, string sortFood)
        {
            ViewBag.CurrentSort = sortFood;
            ViewBag.DateSortParm = String.IsNullOrEmpty(sortFood) ? "ma_desc" : "";
            ViewBag.NameSortParm = sortFood == "ten" ? "ten_desc" : "ten";

            var NL = db.Materials.ToList();
            var PP = db.CookingMethods.ToList();

            var Home = (from a in db.Foods
                        join c in db.Details on a.IDFood equals c.IDFood
                        join d in db.Materials on c.IDNguyenLieu equals d.IDNguyenLieu
                        join e in db.Users on a.UserID equals e.UserID
                        where d.IDNguyenLieu.Equals(id)
                        select new HomeView {
                            TenMonAn = a.TenMonAn,
                            TenTacGia = e.FullName,
                            Image = a.Image,
                            TenNL = d.TenNL,
                            IDFood = a.IDFood,
                            NgayTao = a.NgayTao,
                        }).AsQueryable();




            if (Search != null) {
                page = 1;
            }
            else {
                Search = currentFilter;
            }
            if (!String.IsNullOrWhiteSpace(Search)) {
                Home = (from a in db.Foods
                        join c in db.Details on a.IDFood equals c.IDFood
                        join d in db.Materials on c.IDNguyenLieu equals d.IDNguyenLieu
                        join e in db.Users on a.UserID equals e.UserID
                        where d.IDNguyenLieu.Equals(id)
                        select new HomeView {
                            TenMonAn = a.TenMonAn,
                            TenTacGia = e.FullName,
                            Image = a.Image,
                            TenNL = d.TenNL,
                            IDFood = a.IDFood,
                            NgayTao = a.NgayTao,
                        }).Where(n => n.TenMonAn.Contains(Search)).AsQueryable();
            }

            ViewBag.CurrentFilter = Search;

            switch (sortFood) {
                case "ma_desc":
                    Home = Home.OrderBy(s => s.NgayTao);
                    break;
                case "ten":
                    Home = Home.OrderBy(s => s.TenMonAn);
                    break;
                case "ten_desc":
                    Home = Home.OrderByDescending(s => s.TenMonAn);
                    break;
                default:
                    Home = Home.OrderByDescending(s => s.IDFood);
                    break;
            }

            int pageSize = 12;
            int pageNumber = (page ?? 1);
            ViewBag.arrayNL = NL;
            ViewBag.arrayPPN = PP;
            return View(Home.ToPagedList(pageNumber, pageSize));

        }


    }
}