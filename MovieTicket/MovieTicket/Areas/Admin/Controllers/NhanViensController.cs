using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MovieTicket.Models;
using System.Data.Entity.Core;

namespace MovieTicket.Areas.Admin.Controllers
{
    public class NhanViensController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();
        [CustomAuthorization(LoginPage = "~/Admin/NhanVien/Login")]
        public ActionResult Login()
        {
            return View();
        }
        // GET: Admin/NhanViens
        public ActionResult Index()
        {
            return View(db.Database.SqlQuery<NhanVien>("exec sp_loadDsNhanVien").ToList());
        }

        // GET: Admin/NhanViens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            // = db.NhanViens.Find(id);
            NhanVien nhanVien = db.Database.SqlQuery<NhanVien>("exec sp_loadNhanVien {0}", id).First<NhanVien>();
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhanVien);
        }

        // GET: Admin/NhanViens/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/NhanViens/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "manv,taikhoan,matkhau,vaitro")] NhanVien nhanVien)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.NhanViens.Add(nhanVien);
                    db.Database.SqlQuery<NhanVien>("exec sp_addNhanVien {0},{1},{2}", nhanVien.taikhoan, nhanVien.matkhau, nhanVien.vaitro ).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {

                return RedirectToAction("Index");
            }
            return View(nhanVien);
        }

        // GET: Admin/NhanViens/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.Database.SqlQuery<NhanVien>("exec sp_loadNhanVien {0}", id).First<NhanVien>();
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhanVien);
        }

        // POST: Admin/NhanViens/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "manv,taikhoan,matkhau,vaitro")] NhanVien nhanVien)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.NhanViens.Add(nhanVien);
                    db.Database.SqlQuery<NhanVien>("exec sp_editNhanVien {0},{1},{2}", nhanVien.taikhoan, nhanVien.matkhau, nhanVien.vaitro ).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {

                return RedirectToAction("Index");
            }
            return View(nhanVien);
        }

        // GET: Admin/NhanViens/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    NhanVien nhanVien = db.NhanViens.Find(id);
        //    if (nhanVien == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(nhanVien);
        //}

        //// POST: Admin/NhanViens/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    NhanVien nhanVien = db.NhanViens.Find(id);
        //    db.NhanViens.Remove(nhanVien);
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
