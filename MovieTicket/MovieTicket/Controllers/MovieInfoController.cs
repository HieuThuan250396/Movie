using MovieTicket.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MovieTicket.Controllers
{
    public class MovieInfoController : Controller
    {
        private qldvEntities2 db = new qldvEntities2();
        // GET: MovieInfo
        public ActionResult Index(int id)
        {
            
            Phim a = db.Database.SqlQuery<Phim>("exec sp_loadChiTietPhim {0}", id).First();
            ViewData["ChiTietPhim"] = a;
            ViewData["TheLoai"] = db.Database.SqlQuery<TheLoai>("exec sp_loadTheLoai {0}", a.matheloai).First().tentheloai;

            List<SuatChieu> s = db.Database.SqlQuery<SuatChieu>("exec sp_loadSuatChieuTheoPhim {0}", id).ToList();
            ViewData["SuatChieu"] = s;
            List<DateTime> ngayChieu = db.Database.SqlQuery<DateTime>("exec sp_loadNgayChieuSuatChieuTheoPhim {0}", id).ToList();

            List<Tuple<DateTime, List<TimeSpan>>> dsSC = new List<Tuple<DateTime, List<TimeSpan>>>();

            foreach(var nc in ngayChieu)
            {
                List<TimeSpan> dsGC = new List<TimeSpan>();
                foreach(var sc in s)
                {
                    if (sc.ngaychieu.Equals(nc))
                        dsGC.Add(sc.giochieu);
                }
                dsSC.Add(new Tuple<DateTime, List<TimeSpan>>(nc, dsGC));
            }

            ViewData["dsSC"] = dsSC;
            return View();
        }
    }
}