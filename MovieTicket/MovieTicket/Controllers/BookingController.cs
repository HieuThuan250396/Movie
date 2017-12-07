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
        qldvEntities2 db = new qldvEntities2();
        // GET: Booking
        public ActionResult Index(string suatChieu)
        {
            if (!String.IsNullOrEmpty(suatChieu))
            {
                List<Ve> ve = db.Database.SqlQuery<Ve>("exec sp_loadVeTheoSuatChieu {0}", suatChieu).ToList();
                return View(ve);
            }
            else
                return View();
        }
    }
}