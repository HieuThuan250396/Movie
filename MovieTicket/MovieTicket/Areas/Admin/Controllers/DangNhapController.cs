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
            //try
            //{

            //    //db.NhanViens.Add(nhanVien);
            //    List<int> kq = db.Database.SqlQuery<int>("exec sp_loadThongTinDangNhapNV {0}, {1}", taikhoan, matkhau).ToList();
            //    ViewBag.Alert = "Đăng nhập thành công";
            //    return RedirectToAction("Index", "NhanViens");
            //}
            //catch (Exception ex)
            //{
            //    if (ex.Message == "khong ton tai tai khoan")
            //    {
            //        ViewBag.Alert = "Không tồn tại tài khoản này";
            //        return View("Login");
            //    }
            //    else if(ex.Message == "khong dung mat khau")
            //    {
            //        ViewBag.Alert = "Không đúng mật khẩu";
            //        return View("Login");
            //    }
            //    else
            //        return View("Login");
            //}

            if (ModelState.IsValid)
            {
                if (new MyMembershipProvider().ValidateUser(taikhoan, matkhau))
                {
                    FormsAuthentication.SetAuthCookie(taikhoan, false);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }
 
            // If we got this far, something failed, redisplay form
            return View();


        }
    }
}