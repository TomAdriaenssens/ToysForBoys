using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ToysForBoysMVC.Models;
using ToysForBoysMVC.Repository;

namespace ToysForBoysMVC.Controllers
{
    public class HomeController : Controller
    {

        private ToysCon db = new ToysCon();
        private int opgestart = 0;
        public ActionResult Index()
        {
            if(User.Identity.IsAuthenticated)
            {
              
                Session["customer"] = db.GetCustomerByEmail(User.Identity.Name);
            }
            var allProductlines = db.GetAllProductLines();
            return View(allProductlines);
        }


        public ActionResult ProductDetails(int id)
        {
            var productDetails = db.GetProductLineDetails(id);
            return View(productDetails);
        }

        [Authorize]
        public ActionResult WinkelMandje(int? id)
        {
            
            List<WinkelMandItem> winkelMandItems = new List<WinkelMandItem>();
            WinkelMandItem newWinkelMandItem = new WinkelMandItem();

            if (opgestart == 0)
            {
                List<orderdetail> openOrderDetails = db.findMANDJEOrders(((customer)Session["customer"]).id);
                if (openOrderDetails.Count() > 0)
                {
                    foreach (var orderDetail in openOrderDetails)
                    {
                        product newProduct = db.GetProductById(orderDetail.productId);
                        if (newProduct != null)
                        {
                            newWinkelMandItem.ID = newProduct.id;
                            newWinkelMandItem.Naam = newProduct.name;
                            newWinkelMandItem.AantalTeBestellen = (Int32)orderDetail.quantityOrdered;
                            newWinkelMandItem.Prijs = newProduct.buyPrice;
                            newWinkelMandItem.AantalInStock = newProduct.quantityInStock;
                            winkelMandItems.Add(newWinkelMandItem);
                        }
                    }
                    Session["winkelMandItems"] = winkelMandItems;
                    Session["orderid"] = openOrderDetails[0].orderId;
                }
                opgestart = 1;
            }

            if (id != null)
            {

                product newProduct = db.GetProductById(id);
                if (newProduct != null)
                {
                    newWinkelMandItem.ID = newProduct.id;
                    newWinkelMandItem.Naam = newProduct.name;
                    newWinkelMandItem.AantalTeBestellen = 1;
                    newWinkelMandItem.Prijs = newProduct.buyPrice;
                    newWinkelMandItem.AantalInStock = newProduct.quantityInStock;
                    if (Session["orderid"] == null)
                    {
                        order winkelmandorder = new order()
                        {
                            orderDate = DateTime.Now,
                            requiredDate = DateTime.Now.AddDays(10),
                            customerId = ((customer)Session["customer"]).id,
                            status = "MANDJE"
            
                        };
                        Session["orderid"] = db.CreateNewOrder(winkelmandorder);

                }

                    if (Session["winkelMandItems"] != null)
                    {

                        winkelMandItems = (List<WinkelMandItem>)Session["winkelMandItems"];
                        var gevonden = 0;

                        foreach (var winkelmandItem in winkelMandItems)
                        {
                            if (winkelmandItem.ID == id)
                            {
                                gevonden = 1;
                                winkelmandItem.AantalTeBestellen += 1;
                                Session["winkelMandItems"] = winkelMandItems;
                                db.UpdateOrderDetailLine((Int32)id, (Int32)Session["orderid"]);
                                return View(winkelMandItems);
                            }
                        }

                        if(gevonden!=1)

                         {
                            winkelMandItems.Add(newWinkelMandItem);
                            Session["winkelMandItems"] = winkelMandItems; 
                        }
                    }
                    else
                    {
                        winkelMandItems.Add(newWinkelMandItem);
                        Session["winkelMandItems"] = winkelMandItems;
                    }
                    db.AddNewOrderLine(newWinkelMandItem, (Int32)Session["orderid"]);
                } 
            }
            else
            {
                winkelMandItems =(List<WinkelMandItem>)Session["winkelMandItems"];
            }

            return View(winkelMandItems);
        }

        public ActionResult WinkelMandje2()
        {
            return RedirectToAction("WinkelMandje");
        }


        [HttpPost]
        public ActionResult WinkelMandje(List<WinkelMandItem> winkelmandItemsForm)
        {
            List<WinkelMandItem> winkelMandItems = new List<WinkelMandItem>();
            if (Session["winkelMandItems"] != null)
            {
                winkelMandItems = (List<WinkelMandItem>)Session["winkelMandItems"];

                foreach (var itemSession in winkelMandItems)
                {
                    foreach(var itemForm in winkelmandItemsForm)
                    {
                        if(itemSession.ID == itemForm.ID)
                        {
                            itemSession.AantalTeBestellen = itemForm.AantalTeBestellen;
                            db.UpdateOrderDetailLine(itemForm.ID, (Int32)Session["orderid"], itemForm.AantalTeBestellen);
                        }
                    }
                }
                Session["winkelMandItems"] = winkelMandItems;

            }
            return View(winkelMandItems);
        }

        
        public ActionResult Verwijderen(int id)
        {
            
            var winkelMandItems = (List<WinkelMandItem>)Session["winkelMandItems"];
            WinkelMandItem verwijderOrderLine = new WinkelMandItem();
            WinkelMandItem idtoDelete = null;
            foreach (var winkelmanditem in winkelMandItems)
            {
                if (winkelmanditem.ID == id)
                {
                    db.VerwijderOrderLine(winkelmanditem, (Int32)Session["orderid"]);
                    idtoDelete = winkelmanditem;
                }
            }

            winkelMandItems.Remove(idtoDelete);
            Session["winkelMandItems"] = winkelMandItems;


            return RedirectToAction("WinkelMandje");
        }

        public ActionResult Bevestigen()
        {
            var winkelMandItems = (List<WinkelMandItem>)Session["winkelMandItems"];
            db.changeOrderStatus((Int32)Session["orderid"]);
            Session["winkelMandItems"] = null;
            Session["orderid"] = null;
            return View(winkelMandItems);

        }



        }
}