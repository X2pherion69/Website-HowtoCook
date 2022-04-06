using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACNWeb.Models;

namespace DACNWeb.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        private DACNEntities db = new DACNEntities();
        // GET: Admin/Account
        public ActionResult Login()
        {
            if (!Session["UserAdmin"].Equals("")) {
                return RedirectToAction("Index", "Foods");
            }

            ViewBag.Error = "";
            return View("Login");
        }
        public ActionResult DoLogin(FormCollection field)
        {
            ViewBag.Error = "";
            string username = field["username"];
            string password = field["password"];
            User user = db.Users
                .Where(m => m.RoleID == 1 && (m.UserName == username || m.Email == username))
                .FirstOrDefault();
            if (user != null) {
                if (user.Password.Equals(password)) {

                    Session["UserAdmin"] = username;
                    Session["UserId"] = user.UserID.ToString();
                    Session["FullName"] = user.FullName;
                    return RedirectToAction("Index", "Foods");
                }
                else {
                    ViewBag.Error = "<p class='mb-4 text-center'>Mật khẩu không chính xác!</p>";
                }
            }
            else {
                ViewBag.Error = "<p class='mb-4 text-center'>Tài khoản " + username + " không tồn tại!</p>";
            }

            return View("Login");
        }
        public ActionResult Logout()
        {

            Session["UserAdmin"] = "";
            Session["UserId"] = "";
            Session["FullName"] = "";
            return Redirect("~/Admin/Login");
        }
    }
}