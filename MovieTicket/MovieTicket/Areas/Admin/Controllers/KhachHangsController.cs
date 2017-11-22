using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MovieTicket.Models;
using System.Data.SqlClient;
using System.Data.Entity.Core;

namespace MovieTicket.Areas.Admin.Controllers
{
    public class KhachHangsController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/KhachHangs
        public ActionResult Index()
        {
            return View(db.Database.SqlQuery<KhachHang>("exec sp_loadTatCaKhachHang").ToList());
        }

        // GET: Admin/KhachHangs/Details/5
        public ActionResult Details(int? id)
        {
           
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.Database.SqlQuery<KhachHang>("exec sp_loadChiTietKhacHang {0}", id).First<KhachHang>();

            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // GET: Admin/KhachHangs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/KhachHangs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "makhachhang,ho,tenlot,ten,ngaysinh,gioitinh,sonha,tenduong,quan,thanhpho,dienthoai,email,matkhau")] KhachHang khachHang)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Database.SqlQuery<KhachHang>("exec sp_addKhachHang {0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11}", khachHang.ho.ToString(),khachHang.tenlot.ToString(), khachHang.ten.ToString(), khachHang.ngaysinh,khachHang.gioitinh.ToString(), khachHang.sonha.ToString(), khachHang.tenduong.ToString(), khachHang.quan.ToString(), khachHang.thanhpho.ToString(), khachHang.dienthoai.ToString(),khachHang.email.ToString(), khachHang.matkhau.ToString()).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                
            }
            catch(EntityCommandExecutionException ex)
            {
                
                return RedirectToAction("Index");
            }
            return View(khachHang);
        }

        // GET: Admin/KhachHangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.Database.SqlQuery<KhachHang>("exec sp_loadChiTietKhacHang {0}", id).First<KhachHang>();
            
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // POST: Admin/KhachHangs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "makhachhang,ho,tenlot,ten,ngaysinh,gioitinh,sonha,tenduong,quan,thanhpho,dienthoai,email,matkhau")] KhachHang khachHang)
        {
            //if (ModelState.IsValid)
            //{
            //    db.Entry(khachHang).State = EntityState.Modified;
            //    db.SaveChanges();
            //    return RedirectToAction("Index");
            //}
            try
            {
                if (ModelState.IsValid)
                {
                    db.Database.SqlQuery<KhachHang>
                        ("exec sp_editKhachHang {0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11},{12}",
                        khachHang.makhachhang.ToString(),khachHang.ho.ToString(), 
                        khachHang.tenlot.ToString(), khachHang.ten.ToString(), khachHang.ngaysinh,
                        khachHang.gioitinh.ToString(), khachHang.sonha.ToString(), khachHang.tenduong.ToString(),
                        khachHang.quan.ToString(), khachHang.thanhpho.ToString(), khachHang.dienthoai.ToString(),
                        khachHang.email.ToString(), khachHang.matkhau.ToString()).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            return View(khachHang);
        }

        //// GET: Admin/KhachHangs/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    KhachHang khachHang = db.KhachHangs.Find(id);
        //    if (khachHang == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(khachHang);
        //}

        //// POST: Admin/KhachHangs/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    KhachHang khachHang = db.KhachHangs.Find(id);
        //    db.KhachHangs.Remove(khachHang);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        

        
    }
}
