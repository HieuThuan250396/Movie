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
    [Authorize(Roles = "2")]
    public class PhongChieuxController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/PhongChieux
        public ActionResult Index()
        {
            return View(db.Database.SqlQuery<PhongChieu>("exec sp_loadTatCaPhongChieu").ToList());
        }

        // GET: Admin/PhongChieux/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhongChieu phongChieu = db.Database.SqlQuery<PhongChieu>("exec sp_loadChiTietPhongChieu {0}", id).First<PhongChieu>();
            if (phongChieu == null)
            {
                return HttpNotFound();
            }
            return View(phongChieu);
        }

        // GET: Admin/PhongChieux/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/PhongChieux/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maphong,tenphong,soghebandau")] PhongChieu phongChieu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.PhongChieux.Add(phongChieu);
                    db.Database.SqlQuery<PhongChieu>("exec sp_addPhongChieu {0}", phongChieu.tenphong).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            
            return View(phongChieu);
        }

        // GET: Admin/PhongChieux/Edit/5
        public ActionResult Edit(int? id)
        {
            
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhongChieu phongChieu = db.Database.SqlQuery<PhongChieu>("exec sp_loadChiTietPhongChieu {0}", id).First<PhongChieu>();
            if (phongChieu == null)
            {
                return HttpNotFound();
            }
            return View(phongChieu);
        }

        // POST: Admin/PhongChieux/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maphong,tenphong,soghebandau")] PhongChieu phongChieu)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.Entry(phongChieu).State = EntityState.Modified;
                    db.Database.SqlQuery<PhongChieu>("exec sp_editPhongChieu {0},{1},{2}", phongChieu.maphong, phongChieu.tenphong, phongChieu.soghebandau).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            
            return View(phongChieu);
        }

        //// GET: Admin/PhongChieux/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    PhongChieu phongChieu = db.PhongChieux.Find(id);
        //    if (phongChieu == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(phongChieu);
        //}

        //// POST: Admin/PhongChieux/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    PhongChieu phongChieu = db.PhongChieux.Find(id);
        //    db.PhongChieux.Remove(phongChieu);
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
