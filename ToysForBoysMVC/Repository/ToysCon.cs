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
                
                return db.productlines.OrderBy(m => m.name).ToList();
           
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

        public List<country> GetAllCountries()
        {
            using (var db = new toysforboysEntities())
            {
                var query = (from countries in db.countries
                             select countries).ToList();
                return query;
            }
                
        }
        public void RegisterCustomer(RegisterViewModel model)
        {
            customer newcustomer = new customer() { name = model.Name, streetAndNumber = model.StreetAndNr, city = model.City, state = model.State, postalCode = model.PostalCode, countryId = model.CountryID };
            using (var db = new toysforboysEntities())
            {
                db.customers.Add(newcustomer);
                db.SaveChanges();
            }
        }

        public customer GetCustomerByEmail(string email)
        {
            using (var db = new toysforboysEntities())
            {
                var customer = db.customers.Find(email);
                return customer;
            }
        }

        public product GetProductById(int? id)
        {
            using (var db = new toysforboysEntities())
            {
                var product = db.products.Find(id);
                return product;
            }
        }

        //public List<productline> GetAllProductLines()
        //{
        //    
        //}
    }
}