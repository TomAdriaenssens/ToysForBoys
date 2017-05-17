using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToysForBoysMVC.Repository;

namespace ToysForBoysMVC.Controllers
{
    public class HomeController : Controller
    {

        private ToysCon db = new ToysCon();
        public ActionResult Index()
        {
            var allProductlines = db.GetAllProductLines();
            return View(allProductlines);
        }


        public ActionResult ProductDetails(int id)
        {
            var productDetails = db.GetProductLineDetails(id);
            return View(productDetails);
        }
        
    }
}