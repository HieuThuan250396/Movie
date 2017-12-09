﻿using MovieTicket.Areas.Admin.Security;
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
        public ActionResult Login(string sdt, string matkhau)
        {
            try
            {
                //db.NhanViens.Add(nhanVien);
                List<int> kq = db.Database.SqlQuery<int>("exec sp_loadThongTinDangNhap {0}, {1}", sdt, matkhau).ToList();
                FormsAuthentication.SetAuthCookie(sdt, false);
                KhachHang a = db.KhachHangs.SingleOrDefault(s => s.dienthoai.Equals(sdt));
                Session["taikhoan"] = a.ho + " " + a.tenlot + " " + a.ten;
                ViewBag.Alert = "Đăng nhập thành công";
                return RedirectToAction("Index", "NhanViens");
            }
            catch (Exception ex)
            {
                if (ex.Message == "Sdt ko ton tai")
                {
                    ViewBag.Alert = "Số điện thoại không tồn tại";
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