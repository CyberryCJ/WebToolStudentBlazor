using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebToolStudentBlazor.Models
{
    public class Students
    {
        public int id { get; set; }
        public string fname { get; set; }
        public string mi { get; set; }
        public string lname { get; set; }

        public DateTime bdate { get; set; }
        public string address { get; set; }
        public string email { get; set; }
    }
}
