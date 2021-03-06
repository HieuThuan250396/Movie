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

    public partial class LoaiVe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiVe()
        {
            this.Ve = new HashSet<Ve>();
        }
        [Range(0, int.MaxValue, ErrorMessage = "Chỉ nhập số")]
        [DisplayName("Mã loại vé")]
        public int maloaive { get; set; }

        [DisplayName("Tên loại vé")]
        public string tenloaive { get; set; }

        [Required(ErrorMessage = "Không được để trống trường này")]
        [DisplayFormat(DataFormatString = "{0:C0}")]
        [DisplayName("Giá vé")]
        public int giave { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ve { get; set; }
    }
}
