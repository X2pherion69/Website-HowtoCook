using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DACNWeb.Models;

namespace DACNWeb.ViewModel
{
    public class RequiredSelectListItem : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            var list = value as List<SelectListItem>;
            if (list != null) {
                return list.Where(x => x.Selected == true).Count() > 0;
            }
            return false;
        }
    }
    
    public class NewFoodViewModels
    {
        [RequiredSelectListItem(ErrorMessage = "Vui lòng chọn ít nhất 1 tag")]
        public List<SelectListItem> food_detail { get; set; }
        public int IDFood { get; set; }
        public int? UserID { get; set; }
        public string TenMonAn { get; set; }
        [AllowHtml]
        [Required(ErrorMessage = "Hãy nhập nội dung cho bài viết")]
        public string NoiDung { get; set; }
        [StringLength(200)]
        [MinLength(10, ErrorMessage = "Ít nhất 10 ký tự")]
        [Required(ErrorMessage = "Vui lòng nhập tiêu đề !")]
        public string TieuDe { get; set; }
        public string Image { get; set; }
        public string Video { get; set; }
        public DateTime? NgayTao { get; set; }
        [DisplayName("Thời gian chuẩn bị (phút)")]
        public int ActiveTime { get; set; }
        [DisplayName("Tổng thời gian (phút)")]
        public int TotalTime { get; set; }
        [DisplayName("Khẩu phần ăn")]
        public int Yield { get; set; }


        public List<CookingMethod> method { get; set; }
        public List<CategoryFood> category { get; set; }


        [NotMapped]
        public HttpPostedFileBase ImageUpload { get; set; }

        public NewFoodViewModels()
        {
            Image = "~/Content/img/logo.png";
        }
    }
}