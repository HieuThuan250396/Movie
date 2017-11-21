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
        // GET: Videos
        public ActionResult Index()
        {
            List<Phim> video = new List<Phim> { };
            /*{ new Phim("123", "Lorem Ipsum", "gridallbum1"), 
                                                new Phim("124", "Lorem Ipsum", "gridallbum2"),
                                                new Phim("125", "Lorem Ipsum", "gridallbum3"),
                                                new Phim("126", "Lorem Ipsum", "gridallbum4"),
                                                new Phim("127", "Lorem Ipsum", "gridallbum5"),
                                                new Phim("128", "Lorem Ipsum", "gridallbum6"),
                                                new Phim("129", "Lorem Ipsum", "gridallbum7"),
                                                new Phim("130", "Lorem Ipsum", "gridallbum8"),
                                                new Phim("131", "Lorem Ipsum", "gridallbum9"),
                                                new Phim("132", "Lorem Ipsum", "gridallbum10"),
                                                new Phim("133", "Lorem Ipsum", "gridallbum11"),
                                                new Phim("134", "Lorem Ipsum", "gridallbum1")};
            */ViewData["ListPhim"] = video;
            return View();
        }
    }
}