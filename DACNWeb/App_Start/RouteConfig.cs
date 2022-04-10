using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DACNWeb
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "PhuongPhap",
                url: "phuong-phap/{ID}",
                defaults: new { controller = "Food", action = "Method", title = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "NguyenLieu",
                url: "nguyen-lieu/{ID}",
                defaults: new { controller = "Food", action = "Material", title = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Baiviet",
                url: "bai-viet/{ID}",
                defaults: new { controller = "Home", action = "Recipe", title = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
