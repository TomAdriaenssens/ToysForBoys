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
            using (var db = new ToysForBoysEntities())
            {
                
                return db.productlines.OrderBy(m => m.name).ToList();
           
            }


        }

        public List<product> GetProductLineDetails(int id)
        {
            using (var db = new ToysForBoysEntities())
            {
                var query = from productLineDetails in db.products.Include("productline")
                            where  productLineDetails.productline.id == id && productLineDetails.buyPrice != 0
                            orderby productLineDetails.name
                            select productLineDetails;
                return query.ToList();
            }

        }

        public List<country> GetAllCountries()
        {
            using (var db = new ToysForBoysEntities())
            {
                var query = (from countries in db.countries
                             select countries).ToList();
                return query;
            }
                
        }
        public void RegisterCustomer(RegisterViewModel model)
        {
            customer newcustomer = new customer() { name = model.Name, streetAndNumber = model.StreetAndNr, city = model.City, state = model.State, postalCode = model.PostalCode, countryId = model.CountryID , email=model.Email};
            using (var db = new ToysForBoysEntities())
            {
                db.customers.Add(newcustomer);
                db.SaveChanges();
            }
        }

        public customer GetCustomerByEmail(string email)
        {
            using (var db = new ToysForBoysEntities())
            {
                customer customer = (from custom in db.customers
                               where custom.email == email
                               select custom).FirstOrDefault();
                return customer;
            }
        }

        public product GetProductById(int? id)
        {
            using (var db = new ToysForBoysEntities())
            {
                var product = db.products.Find(id);
                return product;
            }
        }

        public int CreateNewOrder(order order)
        {
            var neworderid = 0;
            using (var db = new ToysForBoysEntities())
            {
                db.orders.Add(order);
                db.SaveChanges();
                neworderid = order.id;
            }
            return neworderid;
        }

        public void AddNewOrderLine(WinkelMandItem winkelMandItem, int orderID)
        {
            using (var db = new ToysForBoysEntities())
            {

                orderdetail newOrderDetail = new orderdetail();
                newOrderDetail.orderId = orderID;
                newOrderDetail.priceEach = winkelMandItem.Prijs;
                newOrderDetail.quantityOrdered = winkelMandItem.AantalTeBestellen;
                newOrderDetail.productId = winkelMandItem.ID;
                db.orderdetails.Add(newOrderDetail);
                db.SaveChanges();
            }
        }



        public void UpdateOrderDetailLine(int productId, int OrderId)
        {


            using (var db = new ToysForBoysEntities())
            {
                orderdetail orderdetail = (from order in db.orderdetails
                                           where (order.orderId == OrderId) && (order.productId == productId)
                                           select order).FirstOrDefault();
                if (orderdetail != null)
                {
                    orderdetail.quantityOrdered += 1;           
                    db.SaveChanges(); 
                }
            }

        }

        public void UpdateOrderDetailLine(int productId, int OrderId, int aantal)
        {


            using (var db = new ToysForBoysEntities())
            {
                orderdetail orderdetail = (from order in db.orderdetails
                                           where (order.orderId == OrderId) && (order.productId == productId)
                                           select order).FirstOrDefault();
                if (orderdetail != null)
                {
                    orderdetail.quantityOrdered = aantal;
                    db.SaveChanges();
                }
            }

        }

        public void VerwijderOrderLine(WinkelMandItem winkelMandItem, int orderID)
        {


            using (var db = new ToysForBoysEntities())
            {
                orderdetail orderdetail = (from order in db.orderdetails
                                           where (order.orderId == orderID) && (order.productId == winkelMandItem.ID)
                                           select order).FirstOrDefault();
                if (orderdetail != null)
                {
                    db.orderdetails.Remove(orderdetail);
                    db.SaveChanges();
                }
            }

        }

        public List<orderdetail> findMANDJEOrders(int id)
        {
            List<orderdetail> mandjeOrderDetails = new List<orderdetail>();
            using (var db = new ToysForBoysEntities())
            {
                order openOrderCustomer = (from order in db.orders
                                           where (order.customerId == id) && (order.status == "MANDJE")
                                           select order).FirstOrDefault();
                if (openOrderCustomer != null)
                {
                    mandjeOrderDetails = (from orderdetails in db.orderdetails
                                          where orderdetails.orderId == openOrderCustomer.id
                                          select orderdetails).ToList();
                }
            }


            return mandjeOrderDetails;
        }

        public void changeOrderStatus(int id)
        {
            using (var db = new ToysForBoysEntities())
            {
                order openOrderCustomer = (from order in db.orders
                                           where (order.id == id)
                                           select order).FirstOrDefault();
                if (openOrderCustomer != null)
                {
                    openOrderCustomer.status = "ORDERED";
                    db.SaveChanges();
                }
            }
        }


        //public List<productline> GetAllProductLines()
        //{
        //    
        //}
    }
}