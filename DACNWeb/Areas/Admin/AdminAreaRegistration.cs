using System.Web.Mvc;

namespace DACNWeb.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName {
            get {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {

            context.MapRoute(
                "Admin_Login",
                "Admin/Login",
                new { action = "Login", Controller = "Account", id = UrlParameter.Optional },
                new[] { "DACNWeb.Areas.Admin.Controllers" }
            );

            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", Controller = "Foods", id = UrlParameter.Optional },
                new[] { "DACNWeb.Areas.Admin.Controllers" }
            );

        }
    }
}