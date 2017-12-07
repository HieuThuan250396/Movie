using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Controllers
{
    public class BookingController : Controller
    {

        static List<int> dsVeDangDat = new List<int>();
        qldvEntities2 db = new qldvEntities2();
        // GET: Booking
        public ActionResult Index(string suatChieu = "5")
        {
            if (!String.IsNullOrEmpty(suatChieu))
            {
                List<Ve> ve = db.Database.SqlQuery<Ve>("exec sp_loadVeTheoSuatChieu {0}", suatChieu).ToList();
                return View(ve);
            }
            else
                return View();
        }

        public ActionResult Book(int mave)
        {
            if (!dsVeDangDat.Contains(mave))
                dsVeDangDat.Add(mave);

            return View();
        }
    }
}