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
    public class LoaiVesController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/LoaiVes
        public ActionResult Index()
        {
            return View(db.LoaiVes.ToList());
        }

        // GET: Admin/LoaiVes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiVe loaiVe = db.LoaiVes.Find(id);
            if (loaiVe == null)
            {
                return HttpNotFound();
            }
            return View(loaiVe);
        }

        // GET: Admin/LoaiVes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiVes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maloaive,tenloaive,giave")] LoaiVe loaiVe)
        {
            if (ModelState.IsValid)
            {
                db.LoaiVes.Add(loaiVe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiVe);
        }

        // GET: Admin/LoaiVes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiVe loaiVe = db.LoaiVes.Find(id);
            if (loaiVe == null)
            {
                return HttpNotFound();
            }
            return View(loaiVe);
        }

        // POST: Admin/LoaiVes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maloaive,tenloaive,giave")] LoaiVe loaiVe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiVe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiVe);
        }

        // GET: Admin/LoaiVes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiVe loaiVe = db.LoaiVes.Find(id);
            if (loaiVe == null)
            {
                return HttpNotFound();
            }
            return View(loaiVe);
        }

        // POST: Admin/LoaiVes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LoaiVe loaiVe = db.LoaiVes.Find(id);
            db.LoaiVes.Remove(loaiVe);
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
