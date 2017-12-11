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
    [Authorize(Roles = "ql")]
    public class SuatChieuxController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/SuatChieux
        public ActionResult Index()
        {
            //var suatChieux = db.SuatChieux.Include(s => s.Phim).Include(s => s.PhongChieu);
            
            return View(db.Database.SqlQuery<SuatChieu>("exec sp_loadSuatChieu").ToList());
        }

        // GET: Admin/SuatChieux/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SuatChieu suatChieu = db.Database.SqlQuery<SuatChieu>("exec sp_loadChiTietSuatChieu {0}", id).First<SuatChieu>();
            if (suatChieu == null)
            {
                return HttpNotFound();
            }
            return View(suatChieu);
        }

        // GET: Admin/SuatChieux/Create
        public ActionResult Create()
        {
            ViewBag.maphim = new SelectList(db.Phims, "maphim", "tenphim");
            ViewBag.maphong = new SelectList(db.PhongChieux, "maphong", "tenphong");
            return View();
        }

        // POST: Admin/SuatChieux/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "masuatchieu,maphim,maphong,giochieu,gioketthuc,ngaychieu,soghecontrong")] SuatChieu suatChieu)
        {

            try
            {
                if (ModelState.IsValid)
                {

                    //db.SuatChieux.Add(suatChieu);sp_addSuatChieu
                    //var maphim = db.Phims.Where(s => s.tenphim.Equals(suatChieu.maphim)).Single();
                    //var maphong = db.PhongChieux.Where(s => s.tenphong.Equals(suatChieu.maphong)).Single();
                    db.Database.SqlQuery<SuatChieu>("exec sp_addSuatChieu {0}, {1}, {2}, {3}", suatChieu.maphim, suatChieu.maphong, suatChieu.giochieu, suatChieu.ngaychieu).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            
            return View(suatChieu);
        }

        // GET: Admin/SuatChieux/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SuatChieu suatChieu = db.Database.SqlQuery<SuatChieu>("exec sp_loadChiTietSuatChieu {0}", id).First<SuatChieu>();
            if (suatChieu == null)
            {
                return HttpNotFound();
            }
            ViewBag.maphim = new SelectList(db.Phims, "maphim", "tenphim", suatChieu.maphim);
            ViewBag.maphong = new SelectList(db.PhongChieux, "maphong", "tenphong", suatChieu.maphong);
            return View(suatChieu);
        }

        // POST: Admin/SuatChieux/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "masuatchieu,maphim,maphong,giochieu,gioketthuc,ngaychieu,soghecontrong")] SuatChieu suatChieu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Database.SqlQuery<SuatChieu>("exec sp_editSuatChieu {0}, {1}, {2}, {3}, {4}, {5}",suatChieu.masuatchieu, suatChieu.maphim, suatChieu.maphong, suatChieu.giochieu, suatChieu.gioketthuc, suatChieu.ngaychieu).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            ViewBag.maphim = new SelectList(db.Phims, "maphim", "tenphim", suatChieu.maphim);
            ViewBag.maphong = new SelectList(db.PhongChieux, "maphong", "tenphong", suatChieu.maphong);
            return View(suatChieu);
        }

        // GET: Admin/SuatChieux/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SuatChieu suatChieu = db.SuatChieux.Find(id);
            if (suatChieu == null)
            {
                return HttpNotFound();
            }
            return View(suatChieu);
        }

        // POST: Admin/SuatChieux/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SuatChieu suatChieu = db.SuatChieux.Find(id);
            db.SuatChieux.Remove(suatChieu);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

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
