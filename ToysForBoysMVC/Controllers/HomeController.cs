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

        public ActionResult WinkelMandje(int? id)
        {
            List<WinkelMandItem> winkelMandItems = new List<WinkelMandItem>();
            WinkelMandItem newWinkelMandItem = new WinkelMandItem();

            
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
                            //customerId
                        };
                    }

                    if (Session["winkelMandItems"] != null)
                    {
                        winkelMandItems = (List<WinkelMandItem>)Session["winkelMandItems"];
                        winkelMandItems.Add(newWinkelMandItem);
                        Session["winkelMandItems"] = winkelMandItems;
                    }
                    else
                    {
                        winkelMandItems.Add(newWinkelMandItem);
                        Session["winkelMandItems"] = winkelMandItems;
                    }
                } 
            }

            return View(winkelMandItems);
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
                        }
                    }
                }
                Session["winkelMandItems"] = winkelMandItems;

            }
            return View(winkelMandItems);
        }

        }
}