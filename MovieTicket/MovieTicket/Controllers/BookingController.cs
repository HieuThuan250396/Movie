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
                return View(db.Database.SqlQuery<SuatChieu>("exec sp_loadSuatChieu").ToList());
            }
            else
                return View();
        }
    }
}