using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace Labtest_4.Models
{
    public class Shop
    {
        public int ShopId { get; set; }
        public string ShopName { get; set; }
        public string Contact { get; set; }
        public int LevelId { get; set; }
        public int BlockId { get; set; }
    }
}