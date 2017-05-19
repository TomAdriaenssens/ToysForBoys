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

        public ObservableCollection<Order> GetOrders()
        {
            ObservableCollection<Order> orderlines = new ObservableCollection<Order>();

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

        public List<Order> UpdateOrdersToToysForBoys(List<Order> modifiedOrders)
        {
            List<Order> failedUpdates = new List<Order>();
            var manager = new ToysForBoysDbManager();
            using (var conOrders = manager.GetConnection())
            {
                using (var comUpdate = conOrders.CreateCommand())
                {
                    comUpdate.CommandType = CommandType.StoredProcedure;
                    comUpdate.CommandText = "[toysforboys].[dbo].[SP_ToysForBoys_UpdateOrder]";

                    var parId = comUpdate.CreateParameter();
                    parId.ParameterName = "@id";
                    comUpdate.Parameters.Add(parId);

                    var parOrderDate = comUpdate.CreateParameter();
                    parOrderDate.ParameterName = "@orderDate";
                    comUpdate.Parameters.Add(parOrderDate);

                    var parRequiredDate = comUpdate.CreateParameter();
                    parRequiredDate.ParameterName = "@requiredDate";
                    comUpdate.Parameters.Add(parRequiredDate);

                    var parShippedDate = comUpdate.CreateParameter();
                    parShippedDate.ParameterName = "@shippedDate";
                    comUpdate.Parameters.Add(parShippedDate);

                    var parComments = comUpdate.CreateParameter();
                    parComments.ParameterName = "@comments";
                    comUpdate.Parameters.Add(parComments);

                    var parCustomerId = comUpdate.CreateParameter();
                    parCustomerId.ParameterName = "@customerId";
                    comUpdate.Parameters.Add(parCustomerId);

                    var parStatus = comUpdate.CreateParameter();
                    parStatus.ParameterName = "@status";
                    comUpdate.Parameters.Add(parStatus);
                    
                    conOrders.Open();
                    foreach (Order x in modifiedOrders)
                    {
                        try
                        {
                            parId.Value = x.Id;
                            parOrderDate.Value = x.OrderDate;
                            parRequiredDate.Value = x.RequiredDate;
                            parShippedDate.Value = x.ShippedDate;
                            parComments.Value = x.Comments;
                            parCustomerId.Value = x.CustomerId;
                            parStatus.Value = x.Status;

                            if (comUpdate.ExecuteNonQuery() == 0)
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
