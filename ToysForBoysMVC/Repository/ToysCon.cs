using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ToysForBoysMVC.Models;

namespace ToysForBoysMVC.Repository
{
    public class ToysCon
    {

        public List<productline> GetAllProductLines()
        {
            using (var db = new toysforboysEntities())
            {
                List<productline> AllProductLines = db.GetAllProductLines2().ToList();
                return AllProductLines;
            }

            
        }

        public List<product> GetProductLineDetails(int id)
        {
            using (var db = new toysforboysEntities())
            {
                var query = from productLineDetails in db.products.Include("productline")
                            where  productLineDetails.productline.id == id
                            orderby productLineDetails.name
                            select productLineDetails;
                return query.ToList();
            }

        }

        //public List<productline> GetAllProductLines()
        //{
        //    using (var db = new toysforboysEntities())
        //    {
        //        return db.productlines.OrderBy(m => m.name).ToList();
        //    }
        //}
    }
}