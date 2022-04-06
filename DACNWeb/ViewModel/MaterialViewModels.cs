using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using DACNWeb.Models;

namespace DACNWeb.ViewModel
{
    public class MaterialViewModels
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MaterialViewModels()
        {
            this.Details = new HashSet<Detail>();
        }

        public int IDNguyenLieu { get; set; }
        [Required(ErrorMessage = "Hãy nhập tên nguyên liệu")]
        public string TenNL { get; set; }
        public string DonVi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detail> Details { get; set; }
    }
}