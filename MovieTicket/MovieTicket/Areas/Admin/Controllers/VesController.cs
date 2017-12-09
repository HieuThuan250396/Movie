using System;using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MovieTicket.Models;

namespace MovieTicket.Areas.Admin.Controllers
{
    [Authorize(Roles = "1")]
    public class VesController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/Ves
        public ActionResult Index()
        {
            var ves = db.Ves.Include(v => v.KhachHang).Include(v => v.KhuyenMai).Include(v => v.LoaiVe).Include(v => v.SuatChieu);
            return View(ves.ToList());
        }

        // GET: Admin/Ves/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Ve ve = db.Ves.Find(id);
        //    if (ve == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(ve);
        //}

        // GET: Admin/Ves/Create
        //public ActionResult Create()
        //{
        //    ViewBag.makhachhang = new SelectList(db.KhachHangs, "makhachhang", "ho");
        //    ViewBag.makm = new SelectList(db.KhuyenMais, "makm", "makm");
        //    ViewBag.maloaive = new SelectList(db.LoaiVes, "maloaive", "tenloaive");
        //    ViewBag.masuatchieu = new SelectList(db.SuatChieux, "masuatchieu", "masuatchieu");
        //    return View();
        //}

        //// POST: Admin/Ves/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "mave,masuatchieu,makhachhang,giave,tinhtrang,giodat,maloaive,makm")] Ve ve)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Ves.Add(ve);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.makhachhang = new SelectList(db.KhachHangs, "makhachhang", "ho", ve.makhachhang);
        //    ViewBag.makm = new SelectList(db.KhuyenMais, "makm", "makm", ve.makm);
        //    ViewBag.maloaive = new SelectList(db.LoaiVes, "maloaive", "tenloaive", ve.maloaive);
        //    ViewBag.masuatchieu = new SelectList(db.SuatChieux, "masuatchieu", "masuatchieu", ve.masuatchieu);
        //    return View(ve);
        //}

        //// GET: Admin/Ves/Edit/5
        //    public ActionResult Edit(int? id)
        //    {
        //        if (id == null)
        //        {
        //            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //        }
        //        Ve ve = db.Ves.Find(id);
        //        if (ve == null)
        //        {
        //            return HttpNotFound();
        //        }
        //        ViewBag.makhachhang = new SelectList(db.KhachHangs, "makhachhang", "ho", ve.makhachhang);
        //        ViewBag.makm = new SelectList(db.KhuyenMais, "makm", "makm", ve.makm);
        //        ViewBag.maloaive = new SelectList(db.LoaiVes, "maloaive", "tenloaive", ve.maloaive);
        //        ViewBag.masuatchieu = new SelectList(db.SuatChieux, "masuatchieu", "masuatchieu", ve.masuatchieu);
        //        return View(ve);
        //    }

        //// POST: Admin/Ves/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "mave,masuatchieu,makhachhang,giave,tinhtrang,giodat,maloaive,makm")] Ve ve)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(ve).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.makhachhang = new SelectList(db.KhachHangs, "makhachhang", "ho", ve.makhachhang);
        //    ViewBag.makm = new SelectList(db.KhuyenMais, "makm", "makm", ve.makm);
        //    ViewBag.maloaive = new SelectList(db.LoaiVes, "maloaive", "tenloaive", ve.maloaive);
        //    ViewBag.masuatchieu = new SelectList(db.SuatChieux, "masuatchieu", "masuatchieu", ve.masuatchieu);
        //    return View(ve);
        //}

        //// GET: Admin/Ves/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Ve ve = db.Ves.Find(id);
        //    if (ve == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(ve);
        //}

        //// POST: Admin/Ves/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Ve ve = db.Ves.Find(id);
        //    db.Ves.Remove(ve);
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
