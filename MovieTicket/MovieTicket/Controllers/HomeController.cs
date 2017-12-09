using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Controllers
{
    public class HomeController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();
        public ActionResult Index()
        {
            return View(db.Database.SqlQuery<Phim>("exec sp_loadTatCaPhim").ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

    }
}