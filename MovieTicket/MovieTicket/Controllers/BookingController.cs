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
                db.Database.SqlQuery<Ve>("exec sp_datVe {0} {1} {2} {3}", v, v, v, v).ToList();
            }
            return RedirectToAction("Index");
        }
    }
}