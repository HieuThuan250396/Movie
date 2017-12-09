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
        public ActionResult Login(string taikhoan, string matkhau)
        {
            try
            {
                //db.NhanViens.Add(nhanVien);
                List<int> kq = db.Database.SqlQuery<int>("exec sp_loadThongTinDangNhapNV {0}, {1}", taikhoan, matkhau).ToList();
                FormsAuthentication.SetAuthCookie(taikhoan, false);
                Session["taikhoan"] = taikhoan;
                ViewBag.Alert = "Đăng nhập thành công";
                return RedirectToAction("Index", "NhanViens");
            }
            catch (Exception ex)
            {
                if (ex.Message == "khong ton tai tai khoan")
                {
                    ViewBag.Alert = "Không tồn tại tài khoản này";
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