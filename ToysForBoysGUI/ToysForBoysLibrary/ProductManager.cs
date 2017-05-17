using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class ProductManager
    {

        public ObservableCollection<Product> GetProductsByProductLineName(String name)
        {
            ObservableCollection<Product> products = new ObservableCollection<Product>();

            var dbManager = new ToysForBoysDbManager();

            using (var conProducten = dbManager.GetConnection())
            {
                using (var comProducten = conProducten.CreateCommand())
                {
                    comProducten.CommandType = CommandType.StoredProcedure;
                    

                    if (name != string.Empty)
                    {
                        comProducten.CommandText = "[ToysForBoys].[dbo].[SP_GetAllProductsOfOneProductLineName]";

                        var parName = comProducten.CreateParameter();
                        parName.ParameterName = "@name";
                        parName.Value = name ;
                        comProducten.Parameters.Add(parName);
                    }
                      else comProducten.CommandText = "[toysforboys].[dbo].[SP_GetAllProducts]";
                     


                    conProducten.Open();

                    using (var rdrProducts = comProducten.ExecuteReader())
                    {
                        Int32 prodIdPos = rdrProducts.GetOrdinal("id");
                        Int32 prodNamePos = rdrProducts.GetOrdinal("name");
                        Int32 prodScalePos = rdrProducts.GetOrdinal("scale");
                        Int32 prodDescriptionPos = rdrProducts.GetOrdinal("description");
                        Int32 prodQuantityInStockPos = rdrProducts.GetOrdinal("quantityInStock");
                        Int32 prodQuantityInOrderPos = rdrProducts.GetOrdinal("quantityInOrder");
                        Int32 prodBuyPricePos = rdrProducts.GetOrdinal("buyPrice");
                        Int32 prodLineIdPos = rdrProducts.GetOrdinal("productlineId");

                        Int32   pId;
                        String   pName;
                        String   pScale;
                        String   pDescription;
                        Int32?   pQuantityInStock;
                        Int32?   pQuantityInOrder;
                        Decimal? pBuyPrice;
                        Int32?   pProductlineId;

                        while (rdrProducts.Read())
                        {

                            if (rdrProducts.IsDBNull(prodIdPos))
                            { pId = 0; }
                            else
                            { pId = rdrProducts.GetInt32(prodIdPos); }

                            if (rdrProducts.IsDBNull(prodNamePos))
                            { pName = null; }
                            else
                            { pName  = rdrProducts.GetString(prodNamePos); }

                            if (rdrProducts.IsDBNull(prodDescriptionPos))
                            { pDescription = null; }
                            else
                             { pDescription = rdrProducts.GetString(prodDescriptionPos); }

                            if (rdrProducts.IsDBNull(prodScalePos))
                            { pScale = null; }
                            else
                            { pScale = rdrProducts.GetString(prodScalePos); }

                            if (rdrProducts.IsDBNull(prodQuantityInStockPos))
                            { pQuantityInStock = null; }
                            else
                            { pQuantityInStock = rdrProducts.GetInt32(prodQuantityInStockPos); }

                            if (rdrProducts.IsDBNull(prodQuantityInOrderPos))
                            { pQuantityInOrder = null; }
                            else
                            { pQuantityInOrder = rdrProducts.GetInt32(prodQuantityInOrderPos); }

                            if (rdrProducts.IsDBNull(prodBuyPricePos))
                            { pBuyPrice = null; }
                            else
                            { pBuyPrice = rdrProducts.GetDecimal(prodBuyPricePos); }

                            if (rdrProducts.IsDBNull(prodLineIdPos))
                            { pProductlineId = null; }
                            else
                            { pProductlineId = rdrProducts.GetInt32(prodLineIdPos); }

                           
                            products.Add(new Product(pId, pName, pScale, pDescription, pQuantityInStock, pQuantityInOrder, pBuyPrice, pProductlineId  ));


                        } // do while
                    } // using rdrProducts
                } // using comProducts
            } // using conToysForBoys
            return products;
        }

        public List<Product> AddNewProductToToysForBoys(List<Product> newProducts)
        {
           // throw new NotImplementedException();

  
            List<Product> nietToegevoegdeProducts = new List<Product>();
            var manager = new ToysForBoysDbManager();
            using (var conBieren = manager.GetConnection())
            {
                using (var comInsert = conBieren.CreateCommand())
                {
                    comInsert.CommandType = CommandType.StoredProcedure;
                    comInsert.CommandText = "SP_ToysForBoys_AddNewProduct";

                    var parName = comInsert.CreateParameter();
                    parName.ParameterName = "@name";
                    comInsert.Parameters.Add(parName);

                    var parScale = comInsert.CreateParameter();
                    parScale.ParameterName = "@scale";
                    comInsert.Parameters.Add(parScale);

                    var parDescription = comInsert.CreateParameter();
                    parDescription.ParameterName = "@description";
                    comInsert.Parameters.Add(parDescription);

                    var parQuantityInStock = comInsert.CreateParameter();
                    parQuantityInStock.ParameterName = "@quantityInStock";
                    comInsert.Parameters.Add(parQuantityInStock);

                    var parQuantityInOrder = comInsert.CreateParameter();
                    parQuantityInOrder.ParameterName = "@quantityInOrder";
                    comInsert.Parameters.Add(parQuantityInOrder);

                    var parBuyPrice = comInsert.CreateParameter();
                    parBuyPrice.ParameterName = "@buyPrice";
                    comInsert.Parameters.Add(parBuyPrice);

                    var parProductlineId = comInsert.CreateParameter();
                    parProductlineId.ParameterName = "@productlineId";
                    comInsert.Parameters.Add(parProductlineId);




                    conBieren.Open();


                    foreach (Product eenProduct in newProducts)


                    {
                        try
                        {
                            parName.Value = eenProduct.Name;
                            parScale.Value = eenProduct.Scale;
                            parDescription.Value = eenProduct.Description;
                            parQuantityInStock.Value = eenProduct.QuantityInStock;
                            parQuantityInOrder.Value = eenProduct.QuantityInOrder;
                            parBuyPrice.Value = eenProduct.BuyPrice;
                            parProductlineId.Value = eenProduct.ProductlineId;


                           if (comInsert.ExecuteNonQuery() == 0)
                                nietToegevoegdeProducts.Add(eenProduct);
                        }
                        catch (Exception ex)
                        {
                            nietToegevoegdeProducts.Add(eenProduct);
                        }
                    } // foreach
                } // comInsert
            } // conBieren
            return nietToegevoegdeProducts;
        }


    

        public List<Product> UpdateProductToToysForBoys(List<Product> modifiedProducts)
        {
            List<Product> failedUpdates = new List<Product>();
            var manager = new ToysForBoysDbManager();
            using (var conToys = manager.GetConnection())
            {
                using (var comUpdate = conToys.CreateCommand())
                {
                    comUpdate.CommandType = CommandType.StoredProcedure;
                    comUpdate.CommandText = "[toysforboys].[dbo].[SP_ToysForBoys_UpdateProduct]";

                    var parId = comUpdate.CreateParameter();
                    parId.ParameterName = "@id";
                    comUpdate.Parameters.Add(parId);

                    var parName = comUpdate.CreateParameter();
                    parName.ParameterName = "@name";
                    comUpdate.Parameters.Add(parName);

                    var parScale = comUpdate.CreateParameter();
                    parScale.ParameterName = "@scale";
                    comUpdate.Parameters.Add(parScale);

                    var parDescription = comUpdate.CreateParameter();
                    parDescription.ParameterName = "@description";
                    comUpdate.Parameters.Add(parDescription);

                    var parInStock = comUpdate.CreateParameter();
                    parInStock.ParameterName = "@quantityinstock";
                    comUpdate.Parameters.Add(parInStock);

                    var parInOrder = comUpdate.CreateParameter();
                    parInOrder.ParameterName = "@quantityinorder";
                    comUpdate.Parameters.Add(parInOrder);

                    var parPrice = comUpdate.CreateParameter();
                    parPrice.ParameterName = "@buyprice";
                    comUpdate.Parameters.Add(parPrice);

                    var parProductlineId = comUpdate.CreateParameter();
                    parProductlineId.ParameterName = "@productlineid";
                    comUpdate.Parameters.Add(parProductlineId);

                    conToys.Open();
                    foreach (Product x in modifiedProducts)
                    {
                        try
                        {
                            parId.Value = x.Id;
                            parName.Value = x.Name;
                            parScale.Value = x.Scale;
                            parDescription.Value = x.Description;
                            parInStock.Value = x.QuantityInStock;
                            parInOrder.Value = x.QuantityInOrder;
                            parProductlineId.Value = x.ProductlineId;
                            parPrice.Value = x.BuyPrice;

                            if (comUpdate.ExecuteNonQuery()==0)
                            {
                                failedUpdates.Add(x);
                            }
                        }
                        catch (Exception ex)
                        {
                            failedUpdates.Add(x);
                        }
                    }
                }
            }
            return failedUpdates;
        }
    }
}
