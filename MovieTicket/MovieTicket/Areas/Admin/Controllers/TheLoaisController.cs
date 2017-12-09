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
    public class TheLoaisController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/TheLoais
        public ActionResult Index()
        {
            return View(db.Database.SqlQuery<TheLoai>("exec sp_loadTatCaTheLoai").ToList());
        }

        // GET: Admin/TheLoais/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheLoai theLoai = db.Database.SqlQuery<TheLoai>("exec sp_loadTheLoai {0}", id).First<TheLoai>();
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // GET: Admin/TheLoais/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TheLoais/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "matheloai,tentheloai")] TheLoai theLoai)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Database.SqlQuery<TheLoai>("exec sp_addTheLoai {0}", theLoai.tentheloai).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }

            return View(theLoai);
        }

        // GET: Admin/TheLoais/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheLoai theLoai = db.Database.SqlQuery<TheLoai>("exec sp_loadTheLoai {0}", id).First<TheLoai>();
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // POST: Admin/TheLoais/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "matheloai,tentheloai")] TheLoai theLoai)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Database.SqlQuery<TheLoai>("exec sp_editTheLoai {0}, {1}", theLoai.matheloai, theLoai.tentheloai).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            return View(theLoai);
        }

        // GET: Admin/TheLoais/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TheLoai theLoai = db.TheLoais.Find(id);
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // POST: Admin/TheLoais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TheLoai theLoai = db.TheLoais.Find(id);
            db.TheLoais.Remove(theLoai);
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
