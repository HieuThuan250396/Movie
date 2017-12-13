using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Controllers
{
    public class VideosController : Controller
    {
        qldvEntities2 db = new qldvEntities2();
        // GET: Videos
        public ActionResult Index()
        {

            return View(db.Database.SqlQuery<Phim>("exec sp_loadTatCaPhim").ToList());
        }
        
    }
}