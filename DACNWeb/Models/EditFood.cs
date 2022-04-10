using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DACNWeb.Models
{
    public class EditFood
    {
        public EditFood()
        {
            Image = "~/Content/img/no-image-available.jpg";
        }
        public int IDFood { get; set; }
        public Nullable<int> IDTheLoai { get; set; }
        public Nullable<int> IDMethod { get; set; }
        [Required(ErrorMessage = "Tên món ăn không được bỏ trống")]
        public string TenMonAn { get; set; }
        [Required(ErrorMessage = "Vui lòng ghi nội dung bài viết")]
        public string NoiDung { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        [DisplayName("Hình ảnh")]
        public string Image { get; set; }
        public string Video { get; set; }
        [Required(ErrorMessage = "Vui lòng ghi thông tin tiêu đề bài viết")]
        public string TieuDe { get; set; }
        [Required(ErrorMessage = "Vui lòng ghi nội dung bài viết")]
        [Range(1, 10000, ErrorMessage = "Thời gian không được âm!")]
        [DisplayName("Thời gian chuẩn bị (phút)")]
        public Nullable<int> ActiveTime { get; set; }
        [Range(1, 10000, ErrorMessage = "Thời gian không được âm!")]
        [DisplayName("Tổng thời gian (phút)")]
        public Nullable<int> TotalTime { get; set; }
        [Range(1, 100, ErrorMessage = "Số người phải lớn hơn 1!")]
        [DisplayName("Khẩu phần ăn")]
        public Nullable<int> Yield { get; set; }

        public virtual CategoryFood CategoryFood { get; set; }
        public virtual CookingMethod CookingMethod { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detail> Details { get; set; }
        public virtual User User { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageUpload { get; set; }


        public List<Material> arrayNL;
        public string idMeterialList { get; set; }
    }
}