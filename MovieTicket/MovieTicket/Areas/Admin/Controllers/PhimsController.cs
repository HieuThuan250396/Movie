using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MovieTicket.Models;
using PagedList;

namespace MovieTicket.Areas.Admin.Controllers
{
    public class PhimsController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/Phims
        public ActionResult Index(string sortOrder, string currentFilter, string searchString, int? page)
        {
            ViewBag.CurrentSort = sortOrder;

            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
            
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }
            ViewBag.CurrentFilter = searchString;
            //search
            var phims = from s in db.Phims.Include(p => p.TheLoai)
                           select s;
            if (!String.IsNullOrEmpty(searchString))
            {
                phims = phims.Where(s => s.tenphim.Contains(searchString));
            }
            //sort
            switch (sortOrder)
            {
                case "name_desc":
                    phims = phims.OrderByDescending(s => s.tenphim);
                    break;
                case "Date":
                    phims = phims.OrderBy(s => s.ngaykhoichieu);
                    break;
                case "date_desc":
                    phims = phims.OrderByDescending(s => s.ngaykhoichieu);
                    break;
                default:
                    phims = phims.OrderBy(s => s.tenphim);
                    break;
            }
            
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(phims.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Phims/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phim phim = db.Phims.Find(id);
            if (phim == null)
            {
                return HttpNotFound();
            }
            return View(phim);
        }

        // GET: Admin/Phims/Create
        public ActionResult Create()
        {
            ViewBag.matheloai = new SelectList(db.TheLoais, "matheloai", "tentheloai");
            return View();
        }

        // POST: Admin/Phims/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maphim,matheloai,daodien,tenphim,ngaykhoichieu,ngayketthuc,mota,hinh,nhasanxuat,thoiluong,trailer")] Phim phim)
        {
            if (ModelState.IsValid)
            {
                db.Phims.Add(phim);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.matheloai = new SelectList(db.TheLoais, "matheloai", "tentheloai", phim.matheloai);
            return View(phim);
        }

        // GET: Admin/Phims/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phim phim = db.Phims.Find(id);
            if (phim == null)
            {
                return HttpNotFound();
            }
            ViewBag.matheloai = new SelectList(db.TheLoais, "matheloai", "tentheloai", phim.matheloai);
            return View(phim);
        }

        // POST: Admin/Phims/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maphim,matheloai,daodien,tenphim,ngaykhoichieu,ngayketthuc,mota,hinh,nhasanxuat,thoiluong,trailer")] Phim phim)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phim).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.matheloai = new SelectList(db.TheLoais, "matheloai", "tentheloai", phim.matheloai);
            return View(phim);
        }

        // GET: Admin/Phims/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Phim phim = db.Phims.Find(id);
            if (phim == null)
            {
                return HttpNotFound();
            }
            return View(phim);
        }

        // POST: Admin/Phims/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Phim phim = db.Phims.Find(id);
            db.Phims.Remove(phim);
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
