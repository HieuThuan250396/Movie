using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Controllers
{
    public class MovieInfoController : Controller
    {
        // GET: MovieInfo
        public ActionResult Index()
        {
            return View();
        }
    }
}