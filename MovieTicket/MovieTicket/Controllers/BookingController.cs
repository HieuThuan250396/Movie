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
        public ActionResult Index(string suatChieu = "5")
        {
            if (!String.IsNullOrEmpty(suatChieu))
            {
                ViewData["dsVeDangDat"] = dsVeDangDat;
                return View(db.Database.SqlQuery<Ve>("exec sp_loadVeTheoSuatChieu {0}", suatChieu).ToList());
            }
            else
                return View();
        }

        public ActionResult DatVe(int mave)
        {
            if (!dsVeDangDat.Contains(mave))
            {
                dsVeDangDat.Add(mave);
                
            }
            return RedirectToAction("Index");
        }

        public ActionResult XoaVe(int mave)
        {
            dsVeDangDat.Remove(mave);
            return RedirectToAction("Index");
        }

        public ActionResult ThanhToan()
        {
            foreach(int v in dsVeDangDat)
            {
                ;
            }
            return RedirectToAction("Index");
        }
    }
}