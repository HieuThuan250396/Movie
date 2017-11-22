using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace MovieTicket.Models
{
    public class KhachHangAdd
    {

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
        
    }
}