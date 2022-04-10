using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using DACNWeb.Models;

namespace DACNWeb.ViewModel
{
    public class MethodViewModels
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MethodViewModels()
        {
            this.Foods = new HashSet<Food>();
        }

        public int IDMethod { get; set; }
        [Required(ErrorMessage = "Hãy nhập phương pháp nấu")]
        public string TenPPN { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Food> Foods { get; set; }
    }
}