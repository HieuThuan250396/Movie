using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MovieTicket.Controllers
{
    public class DangNhap1Controller : Controller
    {
        private qldvEntities2 db = new qldvEntities2();
        // GET: DangNhap
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Login()
        {
            ViewBag.Alert = ViewBag.Alert == "" ? "" : ViewBag.Alert;
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string dienthoai, string matkhau)
        {
            try
            {
                //db.NhanViens.Add(nhanVien);
                List<int> kq = db.Database.SqlQuery<int>("exec sp_loadThongTinDangNhap {0}, {1}", dienthoai, matkhau).ToList();
                FormsAuthentication.SetAuthCookie(dienthoai, false);
                KhachHang a = db.KhachHangs.SingleOrDefault(s => s.dienthoai.Equals(dienthoai));
                Session["taikhoan"] = a.ho + " " + a.tenlot + " " + a.ten;
                Session["maKH"] = a.makhachhang;
                string mk = a.matkhau;
                ViewBag.Alert = "Đăng nhập thành công";
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                if (ex.Message == "Sdt ko ton tai")
                {
                    ViewBag.Alert = "Không tồn tại Số điện thoại này";
                    return View("Login");
                }
                else if (ex.Message == "Mat khau ko dung")
                {
                    ViewBag.Alert = "Không đúng mật khẩu";
                    return View("Login");
                }
                else
                    return View("Login");
            }

        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon(); // it will clear the session at the end of request
            return RedirectToAction("Login", "DangNhap");
        }
    }
}