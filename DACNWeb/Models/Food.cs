//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DACNWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Food
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Food()
        {
            this.Details = new HashSet<Detail>();
        }
    
        public int IDFood { get; set; }
        public Nullable<int> IDTheLoai { get; set; }
        public Nullable<int> IDMethod { get; set; }
        public string TenMonAn { get; set; }
        public string NoiDung { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public string Image { get; set; }
        public string TieuDe { get; set; }
        public Nullable<int> ActiveTime { get; set; }
        public Nullable<int> TotalTime { get; set; }
        public Nullable<int> Yield { get; set; }
    
        public virtual CategoryFood CategoryFood { get; set; }
        public virtual CookingMethod CookingMethod { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Detail> Details { get; set; }
        public virtual User User { get; set; }
    }
}