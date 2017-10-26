using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieTicket.Models
{
    public class Phim
    {

        public Phim(string v1, string v2, string v3)
        {
            this.maphim = v1;
            this.tenPhim = v2;
            this.urlHinh = v3;
        }

        public string maphim { get; set; }
        public string tenPhim{ get; set; }
    public string urlHinh{ get; set; }
    }
}