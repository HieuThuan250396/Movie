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
    [Authorize(Roles = "bv")]
    public class VeDangDatsController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/VeDangDats
        public ActionResult Index()
        {
            return View(db.VeDangDats.ToList());
        }

        // GET: Admin/VeDangDats/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VeDangDat veDangDat = db.VeDangDats.Find(id);
            if (veDangDat == null)
            {
                return HttpNotFound();
            }
            return View(veDangDat);
        }

        // GET: Admin/VeDangDats/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/VeDangDats/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "mave,masuatchieu,makhachhang,giave,tinhtrang,giodat,maloaive,makm")] VeDangDat veDangDat)
        {
            if (ModelState.IsValid)
            {
                db.VeDangDats.Add(veDangDat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(veDangDat);
        }

        // GET: Admin/VeDangDats/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VeDangDat veDangDat = db.VeDangDats.Find(id);
            if (veDangDat == null)
            {
                return HttpNotFound();
            }
            return View(veDangDat);
        }

        // POST: Admin/VeDangDats/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "mave,masuatchieu,makhachhang,giave,tinhtrang,giodat,maloaive,makm")] VeDangDat veDangDat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(veDangDat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(veDangDat);
        }

        // GET: Admin/VeDangDats/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VeDangDat veDangDat = db.VeDangDats.Find(id);
            if (veDangDat == null)
            {
                return HttpNotFound();
            }
            return View(veDangDat);
        }

        // POST: Admin/VeDangDats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            VeDangDat veDangDat = db.VeDangDats.Find(id);
            db.VeDangDats.Remove(veDangDat);
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
