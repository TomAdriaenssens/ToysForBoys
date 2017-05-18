using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class OrderManager
    {

        public List<Order> GetOrders()
        {
            List<Order> orderlines = new List<Order>();

            var dbManager = new ToysForBoysDbManager();

            using (var conOrders = dbManager.GetConnection())
            {
                using (var comOrders = conOrders.CreateCommand())
                {
                    comOrders.CommandType = CommandType.StoredProcedure;

                    comOrders.CommandText = "[toysforboys].[dbo].[SP_ToysForBoys_GetAllOrders]";

                    conOrders.Open();

                    using (var rdrProducts = comOrders.ExecuteReader())
                    {
                        Int32 ordIdPos = rdrProducts.GetOrdinal("id");
                        Int32 ordOrderDatePos = rdrProducts.GetOrdinal("orderDate");
                        Int32 ordRequiredDatePos = rdrProducts.GetOrdinal("requiredDate");
                        Int32 ordShippedDatePos = rdrProducts.GetOrdinal("shippedDate");
                        Int32 ordCommentsPos = rdrProducts.GetOrdinal("comments");
                        Int32 ordCustomerIdPos = rdrProducts.GetOrdinal("customerId");
                        Int32 ordStatusPos = rdrProducts.GetOrdinal("status");

                        Int32 pId;
                        DateTime pOrderDate;
                        DateTime pRequiredDate;
                        DateTime pShippedDate;
                        string pComments;
                        int pCustomerId;
                        string pStatus;

                        while (rdrProducts.Read())
                        {

                            if (rdrProducts.IsDBNull(ordIdPos))
                            { pId = 0; }
                            else
                            { pId = rdrProducts.GetInt32(ordIdPos); }

                            if (rdrProducts.IsDBNull(ordOrderDatePos))
                            { pOrderDate = DateTime.MinValue; }
                            else
                            { pOrderDate = rdrProducts.GetDateTime(ordOrderDatePos); }

                            if (rdrProducts.IsDBNull(ordRequiredDatePos))
                            { pRequiredDate = DateTime.MinValue ; }
                            else
                            { pRequiredDate = rdrProducts.GetDateTime(ordRequiredDatePos); }

                            if (rdrProducts.IsDBNull(ordShippedDatePos))
                            { pShippedDate = DateTime.MinValue; }
                            else
                            { pShippedDate = rdrProducts.GetDateTime(ordShippedDatePos); }

                            if (rdrProducts.IsDBNull(ordCommentsPos))
                            { pComments = null; }
                            else
                            { pComments = rdrProducts.GetString(ordCommentsPos); }

                            if (rdrProducts.IsDBNull(ordCustomerIdPos))
                            { pCustomerId = 0; }
                            else
                            { pCustomerId = rdrProducts.GetInt32(ordCustomerIdPos); }

                            if (rdrProducts.IsDBNull(ordStatusPos))
                            { pStatus = null; }
                            else
                            { pStatus = rdrProducts.GetString(ordStatusPos); }


                            orderlines.Add(new Order(pId, pOrderDate, pRequiredDate, pShippedDate, pComments, pCustomerId, pStatus));


                        } // do while
                    } // using rdrProducts
                } // using comProducts
            } // using conToysForBoys
            return orderlines;
        }
    }
}