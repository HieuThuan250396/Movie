﻿using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Controllers
{
    [Authorize()]
    public class BookingController : Controller
    {

        static private List<int> dsVeDangDat = new List<int>();
        static private int sL;
        static private float tongTien;
        qldvEntities2 db = new qldvEntities2();
        // GET: Booking
        public ActionResult Index(string suatChieu)
        {
            ViewBag.SC = suatChieu;
            ViewBag.TongTien = tongTien > 0 ? tongTien : 0;
            ViewBag.SL = sL > 0 ? sL : 0;

            int sc = int.Parse(suatChieu);
            if (!String.IsNullOrEmpty(suatChieu))
            {
                ViewData["dsVeDangDat"] = dsVeDangDat;
                List<Ve> dsVe = db.Database.SqlQuery<Ve>("exec sp_loadVeTheoSuatChieu {0}", sc).ToList();
                return View(dsVe);
            }
            else
                return View();
        }
        public ActionResult DatVe(int mave, string suatChieu, int gia)
        {
            if (!dsVeDangDat.Contains(mave))
            {
                dsVeDangDat.Add(mave);
                tongTien += gia;
                sL++;
                ViewBag.SL = sL > 0 ? sL : 0;
                ViewBag.TongTien = tongTien;
            }                
            return RedirectToAction("Index", new { @suatChieu = suatChieu });
        }

        public ActionResult XoaVe(int mave, string suatChieu, int gia)
        {
            if (dsVeDangDat.Contains(mave))
            {
                dsVeDangDat.Remove(mave);
                tongTien -= gia;
                sL--;
                ViewBag.SL = sL > 0 ? sL : 0;
                ViewBag.TongTien = tongTien;
            }
            return RedirectToAction("Index", new { @suatChieu = suatChieu });
        }

        public ActionResult ThanhToan(string suatChieu, string makm)
        {
            try
            {
                int sc = Int32.Parse(suatChieu);
                string maKM = makm;
                int makh = (int)Session["maKH"];
                if (dsVeDangDat.Count > 0)
                {
                    foreach (int v in dsVeDangDat)
                    {
                        db.Database.ExecuteSqlCommand("exec sp_datVe2 {0}, {1}, {2}, {3}", v, sc, makh, makm);
                    }
                    tongTien = 0;
                    sL = 0;
                    dsVeDangDat.Clear();
                    return RedirectToAction("Index", "Videos");
                }
                else
                {
                    return RedirectToAction("Index", new { @suatChieu = suatChieu });
                }
            }
            catch(Exception ex)
            {
                return RedirectToAction("Index", new { @suatChieu = suatChieu });
            }
            
            
        }
    }
}