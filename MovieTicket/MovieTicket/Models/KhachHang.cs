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

    public partial class KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {
            this.Ves = new HashSet<Ve>();
        }
        [DisplayName("Mã khách hàng")]
        public int makhachhang { get; set; }
        [DisplayName("Họ")]
        public string ho { get; set; }
        [DisplayName("Tên lót")]
        public string tenlot { get; set; }
        [DisplayName("Tên")]
        public string ten { get; set; }
        [DisplayName("Ngày sinh")]
        public System.DateTime ngaysinh { get; set; }
        [DisplayName("Giới tính")]
        public string gioitinh { get; set; }
        [DisplayName("Số nhà")]
        public string sonha { get; set; }
        [DisplayName("Tên đường")]
        public string tenduong { get; set; }
        [DisplayName("Quận")]
        public string quan { get; set; }
        [DisplayName("Thành phố")]
        public string thanhpho { get; set; }
        [DisplayName("Số điện thoại")]
        public string dienthoai { get; set; }
        [DisplayName("Email")]
        public string email { get; set; }
        [DisplayName("Mật khẩu")]
        public string matkhau { get; set; }

    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ve> Ves { get; set; }
    }
}
