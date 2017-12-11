using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Areas.Admin.Controllers
{
    [Authorize(Roles = "bv,ql")]
    public class IndexController : Controller
    {
        // GET: Admin/Index
        public ActionResult Index()
        {
            return View();
        }
    }
}