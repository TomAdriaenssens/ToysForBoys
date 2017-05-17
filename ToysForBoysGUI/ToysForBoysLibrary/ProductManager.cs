using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
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
                    //else comProducten.CommandText = "[ToysForBoys].[dbo].[SP_GetAllProducts]";
                     else comProducten.CommandText = "select * from [ToysForBoys].[dbo].[Products]";


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
    }
}
