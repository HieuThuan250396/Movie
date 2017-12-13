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

            List<Tuple<Tuple<DateTime, int>, List<TimeSpan>>> dsSC = new List<Tuple<Tuple<DateTime, int>, List<TimeSpan>>>();

            foreach(var nc in ngayChieu)
            {
                int idsc = 0;
                List<TimeSpan> dsGC = new List<TimeSpan>();
                bool flag = false;
                foreach(var sc in s)
                {
                    if (sc.ngaychieu.Equals(nc))
                    {
                        dsGC.Add(sc.giochieu);
                        idsc = sc.masuatchieu;
                        flag = true;
                    }
                        
                }
                if(flag)
                dsSC.Add(new Tuple<Tuple<DateTime, int>, List<TimeSpan>>(new Tuple<DateTime, int>(nc, idsc), dsGC));
            }
            
            ViewData["dsSC"] = dsSC;
            return View();
        }
    }
}