﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MovieTicket.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SuatChieu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SuatChieu()
        {
            this.Ves = new HashSet<Ve>();
        }

        [DisplayName("Mã suất chiếu")]
        public int masuatchieu { get; set; }
        [DisplayName("Mã phim")]
        public int maphim { get; set; }
        [DisplayName("Mã phòng")]
        public int maphong { get; set; }
        [DisplayName("Giờ chiếu")]
        public System.TimeSpan giochieu { get; set; }
        [DisplayName("Giờ kết thúc")]
        public System.TimeSpan gioketthuc { get; set; }
        [DisplayName("Ngày chiếu")]
        public System.DateTime ngaychieu { get; set; }
        [DisplayName("Số ghế còn trống")]
        public int soghecontrong { get; set; }
        [DisplayName("Phim")]
        public virtual Phim Phim { get; set; }
        [DisplayName("Phòng chiếu")]
        public virtual PhongChieu PhongChieu { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ves { get; set; }
    }
}
