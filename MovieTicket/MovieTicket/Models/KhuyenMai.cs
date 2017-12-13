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
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class KhuyenMai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhuyenMai()
        {
            this.Ves = new HashSet<Ve>();
        }

        [DisplayName("Mã khuyến mãi")]
        public int makm { get; set; }
        [DisplayName("Ngày bắt đầu")]
        [Required(ErrorMessage = "Không được để trống trường này")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public System.DateTime ngaybatdau { get; set; }
        [Required(ErrorMessage = "Không được để trống trường này")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [DisplayName("Ngày kết thúc")]
        public System.DateTime ngayketthuc { get; set; }
        [Required(ErrorMessage = "Không được để trống trường này")]
        [DisplayFormat(DataFormatString = "{0:C0}")]
        [DisplayName("Giá trị")]
        public double giatri { get; set; }

        public bool tinhtrang { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ves { get; set; }
    }
}
