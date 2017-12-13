using MovieTicket.Models;
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
        
        qldvEntities2 db = new qldvEntities2();
        // GET: Booking
        public ActionResult Index(string suatChieu)
        {
            ViewBag.SC = suatChieu;
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

        public ActionResult DatVe(int mave, string suatChieu)
        {
            if (!dsVeDangDat.Contains(mave))
            {
                dsVeDangDat.Add(mave);
                
            }
            return RedirectToAction("Index", new { @suatChieu = suatChieu });
        }

        public ActionResult XoaVe(int mave, string suatChieu)
        {
            dsVeDangDat.Remove(mave);
            return RedirectToAction("Index", new { @suatChieu = suatChieu });
        }

        public ActionResult ThanhToan(string suatChieu)
        {
            int sc = Int32.Parse(suatChieu);
            int makh = (int)Session["maKH"];

            foreach(int v in dsVeDangDat)
            {
                db.Database.ExecuteSqlCommand("exec sp_datVe2 {0}, {1}, {2}, {3}", v, sc, makh, null);
            }
            dsVeDangDat.Clear();
            return RedirectToAction("Index", "Videos");
        }
    }
}