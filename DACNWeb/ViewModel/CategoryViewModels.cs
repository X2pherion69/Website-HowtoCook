using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using DACNWeb.Models;

namespace DACNWeb.ViewModel
{
    public class CategoryViewModels
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CategoryViewModels()
        {
            this.Foods = new HashSet<Food>();
        }

        public int IDTheLoai { get; set; }
        [Required(ErrorMessage = "Hãy nhập tên nguyên liệu")]
        public string TenTheLoai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Food> Foods { get; set; }
    }
}