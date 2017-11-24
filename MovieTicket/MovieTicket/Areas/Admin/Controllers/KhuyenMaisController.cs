﻿using System;
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
    public class KhuyenMaisController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();

        // GET: Admin/KhuyenMais
        public ActionResult Index()
        {
            //return View(db.KhuyenMais.ToList());
            return View(db.Database.SqlQuery<KhuyenMai>("exec sp_loadTatCaKhuyenMai").ToList());
        }

        // GET: Admin/KhuyenMais/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhuyenMai khuyenMai = db.Database.SqlQuery<KhuyenMai>("exec sp_loadChiTietKhuyenMai {0}", id).First<KhuyenMai>();
            if (khuyenMai == null)
            {
                return HttpNotFound();
            }
            return View(khuyenMai);
        }

        // GET: Admin/KhuyenMais/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/KhuyenMais/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "makm,ngaybatdau,ngayketthuc,giatri")] KhuyenMai khuyenMai)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.KhuyenMais.Add(khuyenMai);
                    db.Database.SqlQuery<KhuyenMai>("exec sp_addKhuyenMai {0},{1},{2}",khuyenMai.ngaybatdau, khuyenMai.ngayketthuc, khuyenMai.giatri).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            return View(khuyenMai);
        }

        // GET: Admin/KhuyenMais/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhuyenMai khuyenMai = db.KhuyenMais.Find(id);
            if (khuyenMai == null)
            {
                return HttpNotFound();
            }
            return View(khuyenMai);
        }

        // POST: Admin/KhuyenMais/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "makm,ngaybatdau,ngayketthuc,giatri")] KhuyenMai khuyenMai)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.Entry(khuyenMai).State = EntityState.Modified;
                    db.Database.SqlQuery<KhuyenMai>("exec sp_editKhuyenMai {0},{1},{2},{3}", khuyenMai.makm, khuyenMai.ngaybatdau, khuyenMai.ngayketthuc, khuyenMai.giatri).ToList();
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch(EntityCommandExecutionException ex)
            {
                return RedirectToAction("Index");
            }
            
            return View(khuyenMai);
        }

        //// GET: Admin/KhuyenMais/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    KhuyenMai khuyenMai = db.KhuyenMais.Find(id);
        //    if (khuyenMai == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(khuyenMai);
        //}

        //// POST: Admin/KhuyenMais/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    KhuyenMai khuyenMai = db.KhuyenMais.Find(id);
        //    db.KhuyenMais.Remove(khuyenMai);
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
