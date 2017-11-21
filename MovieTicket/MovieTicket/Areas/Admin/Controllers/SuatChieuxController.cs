using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MovieTicket.Models;

namespace MovieTicket.Areas.Admin.Controllers
{
    public class SuatChieuxController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/SuatChieux
        public ActionResult Index()
        {
            var suatChieux = db.SuatChieux.Include(s => s.Phim).Include(s => s.PhongChieu);
            return View(suatChieux.ToList());
        }

        // GET: Admin/SuatChieux/Details/5
        public ActionResult Details(int? id)
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

        // GET: Admin/SuatChieux/Create
        public ActionResult Create()
        {
            ViewBag.maphim = new SelectList(db.Phims, "maphim", "daodien");
            ViewBag.maphong = new SelectList(db.PhongChieux, "maphong", "tenphong");
            return View();
        }

        // POST: Admin/SuatChieux/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "masuatchieu,maphim,maphong,giochieu,gioketthuc,ngaychieu")] SuatChieu suatChieu)
        {
            if (ModelState.IsValid)
            {
                db.SuatChieux.Add(suatChieu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.maphim = new SelectList(db.Phims, "maphim", "daodien", suatChieu.maphim);
            ViewBag.maphong = new SelectList(db.PhongChieux, "maphong", "tenphong", suatChieu.maphong);
            return View(suatChieu);
        }

        // GET: Admin/SuatChieux/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.maphim = new SelectList(db.Phims, "maphim", "daodien", suatChieu.maphim);
            ViewBag.maphong = new SelectList(db.PhongChieux, "maphong", "tenphong", suatChieu.maphong);
            return View(suatChieu);
        }

        // POST: Admin/SuatChieux/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "masuatchieu,maphim,maphong,giochieu,gioketthuc,ngaychieu")] SuatChieu suatChieu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(suatChieu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.maphim = new SelectList(db.Phims, "maphim", "daodien", suatChieu.maphim);
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
