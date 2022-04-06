using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACNWeb.Models;
using PagedList;

namespace DACNWeb.Controllers
{
    public class HomeController : Controller
    {
        private DACNEntities db = new DACNEntities();


        public ActionResult Index(string currentFilter, string Search, int? page, string sortFood)
        {
            ViewBag.CurrentSort = sortFood;
            ViewBag.DateSortParm = String.IsNullOrEmpty(sortFood) ? "ma_desc" : "";
            ViewBag.NameSortParm = sortFood == "ten" ? "ten_desc" : "ten";



            var NL = db.Materials.ToList();
            var PP = db.CookingMethods.ToList();
            var Home = (from a in db.Foods
                        select new HomeView {
                            TenMonAn = a.TenMonAn,
                            NoiDung = a.NoiDung,
                            Image = a.Image,
                            TieuDe = a.TieuDe,
                            IDFood = a.IDFood,
                            TenTacGia = a.User.FullName,
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
                               select new HomeView {
                                   TenMonAn = a.TenMonAn,
                                   NoiDung = a.NoiDung,
                                   Image = a.Image,
                                   TieuDe = a.TieuDe,
                                   IDFood = a.IDFood,
                                   TenTacGia = a.User.FullName,
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


            
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            //Home = Home.OrderByDescending(s => s.IDFood).ToList();
            ViewBag.arrayNL = NL;
            ViewBag.arrayPPN = PP;
            return View(Home.ToPagedList(pageNumber, pageSize));

        }


        public ActionResult Contact()
        {
            return View();

        }


        public ActionResult Search(string currentFilter, string Search, int? page, string sortFood)
        {
            ViewBag.CurrentSort = sortFood;
            ViewBag.DateSortParm = String.IsNullOrEmpty(sortFood) ? "ma_desc" : "";
            ViewBag.NameSortParm = sortFood == "ten" ? "ten_desc" : "ten";
            var Home = (from a in db.Foods
                        select new HomeView {
                            TenMonAn = a.TenMonAn,
                            Image = a.Image,
                            IDFood = a.IDFood,
                            NgayTao = a.NgayTao,
                            TenTacGia = a.User.FullName,
                        }).AsQueryable();
            if (Search != null) {
                page = 1;
            }
            else {
                Search = currentFilter;
            }
            if (!String.IsNullOrWhiteSpace(Search)) {
                Home = Home = (from a in db.Foods
                               select new HomeView {
                                   TenMonAn = a.TenMonAn,
                                   NoiDung = a.NoiDung,
                                   Image = a.Image,
                                   TieuDe = a.TieuDe,
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
            int pageSize = 16;
            int pageNumber = (page ?? 1);

            return View(Home.ToPagedList(pageNumber, pageSize));

        }




        public ActionResult Recipe(int id)
        {

            var objRecipe = db.Foods.Where(n => n.IDFood == id).FirstOrDefault();
            //var detailrecipe = db.Details.Where(p => p.IDFood == objRecipe.IDFood).Select(p => p.IDNguyenLieu).ToList();
            var Home = (from a in db.Foods
                        join b in db.CategoryFoods on a.IDTheLoai equals b.IDTheLoai
                        join c in db.Details on a.IDFood equals c.IDFood
                        join d in db.Materials on c.IDNguyenLieu equals d.IDNguyenLieu
                        join e in db.Users on a.UserID equals e.UserID
                        where a.IDFood.Equals(id)
                        select new HomeView {
                            TenMonAn = a.TenMonAn,
                            TenTheLoai = b.TenTheLoai,
                            TenTacGia = e.FullName,
                            NoiDung = a.NoiDung,
                            Image = a.Image,
                            TieuDe = a.TieuDe,
                            TenNL = d.TenNL,
                            IDFood = a.IDFood,
                            SoLuong = c.SoLuong,
                            DonVi = d.DonVi,
                        }).ToList();

            ViewBag.arrayMaterial = Home;
            return View(objRecipe);
        }
    }
}