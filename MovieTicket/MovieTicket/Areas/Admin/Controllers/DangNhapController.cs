using MovieTicket.Areas.Admin.Security;
using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace MovieTicket.Areas.Admin.Controllers
{
    public class DangNhapController : Controller
    {

        private qldvEntities2 db = new qldvEntities2();
        // GET: Admin/DangNhap
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
        public ActionResult Login(string taikhoan, string matkhau)
        {
            try
            {
                //db.NhanViens.Add(nhanVien);
                List<int> kq = db.Database.SqlQuery<int>("exec sp_loadThongTinDangNhapNV {0}, {1}", taikhoan, matkhau).ToList();
                FormsAuthentication.SetAuthCookie(taikhoan, false);
                NhanVien a = db.NhanVien.SingleOrDefault(s => s.taikhoan.Equals(taikhoan));
                Session["taikhoan"] = a.taikhoan;
                ViewBag.Alert = "Đăng nhập thành công";
                return RedirectToAction("Index", "Index");
            }
            catch (Exception ex)
            {
                if (ex.Message == "khong ton tai tai khoan")
                {
                    ViewBag.Alert = "Tài khoản không tồn tại";
                    return View("Login");
                }
                else if (ex.Message == "khong dung mat khau")
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