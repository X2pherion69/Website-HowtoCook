using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DACNWeb.Models
{
    public class HomeView
    {
        public int IDFood { get; set; }
        public string TenMonAn { get; set; }
        public string TenTacGia { get; set; }
        public string Image { get; set; }
        public string TenNL { get; set; }
        public string NoiDung { get; set; }
        public string TieuDe { get; set; }
        public string TenTheLoai { get; set; }
        public int ActiveTime { get; set; }
        public int TotalTime { get; set; }
        public int Yield { get; set; }
        public string SoLuong { get; set; }
        public string DonVi { get; set; }
        public DateTime? NgayTao { get; set; }
        public List<Material> lstMaterial { get; set; }
        public List<CookingMethod> lstCookingMethod { get; set; }

    }
}