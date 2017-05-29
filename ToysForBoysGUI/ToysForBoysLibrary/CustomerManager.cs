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
    public class CustomerManager
    {


        public ObservableCollection<Customer> GetAllCustomers()
        {
            ObservableCollection<Customer> customers = new ObservableCollection<Customer>();

            var dbManager = new ToysForBoysDbManager();

            using (var conCustomers = dbManager.GetConnection())
            {
                using (var comCustomers = conCustomers.CreateCommand())
                {
                    comCustomers.CommandType = CommandType.StoredProcedure;

                    comCustomers.CommandText = "[toysforboys].[dbo].[SP_GetAllCustomers]";

                    conCustomers.Open();

                    using (var rdrCustomers = comCustomers.ExecuteReader())
                    {
                        Int32 prodIdPos = rdrCustomers.GetOrdinal("id");
                        Int32 prodNamePos = rdrCustomers.GetOrdinal("name");
                        Int32 prodStreetAndNumberPos = rdrCustomers.GetOrdinal("streetAndNumber");
                        Int32 prodCityPos = rdrCustomers.GetOrdinal("city");
                        Int32 prodStatePos = rdrCustomers.GetOrdinal("state");
                        Int32 prodPostalCodePos = rdrCustomers.GetOrdinal("postalCode");
                        Int32 prodCountryIdPos = rdrCustomers.GetOrdinal("countryId");
                        Int32 prodEmailPos = rdrCustomers.GetOrdinal("email");

                        Int32 pId;
                        String pName;
                        String pStreetAndNumber;
                        String pCity;
                        String pState;
                        String pPostalCode;
                        Int32 pCountryId;
                        String pEmail;

                        while (rdrCustomers.Read())
                        {

                            if (rdrCustomers.IsDBNull(prodIdPos))
                            { pId = 0; }
                            else
                            { pId = rdrCustomers.GetInt32(prodIdPos); }

                            if (rdrCustomers.IsDBNull(prodNamePos))
                            { pName = null; }
                            else
                            { pName = rdrCustomers.GetString(prodNamePos); }

                            if (rdrCustomers.IsDBNull(prodStreetAndNumberPos))
                            { pStreetAndNumber = null; }
                            else
                            { pStreetAndNumber = rdrCustomers.GetString(prodStreetAndNumberPos); }

                            if (rdrCustomers.IsDBNull(prodCityPos))
                            { pCity = null; }
                            else
                            { pCity = rdrCustomers.GetString(prodCityPos); }

                            if (rdrCustomers.IsDBNull(prodStatePos))
                            { pState = null; }
                            else
                            { pState = rdrCustomers.GetString(prodStatePos); }

                            if (rdrCustomers.IsDBNull(prodPostalCodePos))
                            { pPostalCode = null; }
                            else
                            { pPostalCode = rdrCustomers.GetString(prodPostalCodePos); }

                            if (rdrCustomers.IsDBNull(prodCountryIdPos))
                            { pCountryId = 0; }
                            else
                            { pCountryId = rdrCustomers.GetInt32(prodCountryIdPos); }

                            if (rdrCustomers.IsDBNull(prodEmailPos))
                            { pEmail = null; }
                            else
                            { pEmail = rdrCustomers.GetString(prodEmailPos); }


                            customers.Add(new Customer(pId, pName, pStreetAndNumber, pCity, pState, pPostalCode, pCountryId, pEmail));


                        } // do while
                    } // using rdrCustomers
                } // using comCustomers
            } // using conCustomers
            return customers;
        }

        public ObservableCollection<Customer> GetCustomersByName(String name)
        {
            ObservableCollection<Customer> products = new ObservableCollection<Customer>();

            var dbManager = new ToysForBoysDbManager();

            using (var conProducten = dbManager.GetConnection())
            {
                using (var comProducten = conProducten.CreateCommand())
                {
                    comProducten.CommandType = CommandType.StoredProcedure;
                    

                    if (!string.IsNullOrEmpty(name))
                    {
                        comProducten.CommandText = "[ToysForBoys].[dbo].[SP_GetAlLCustomers]";

                        var parName = comProducten.CreateParameter();
                        parName.ParameterName = "@name";
                        parName.Value = name ;
                        comProducten.Parameters.Add(parName);
                    }
                      else comProducten.CommandText = "[toysforboys].[dbo].[SP_GetAllProducts]";
                     


                    conProducten.Open();

                    using (var rdrCustomers = comProducten.ExecuteReader())
                    {
                        Int32 prodIdPos = rdrCustomers.GetOrdinal("id");
                        Int32 prodNamePos = rdrCustomers.GetOrdinal("name");
                        Int32 prodStreetAndNumberPos = rdrCustomers.GetOrdinal("streetAndNumber");
                        Int32 prodCityPos = rdrCustomers.GetOrdinal("city");
                        Int32 prodStatePos = rdrCustomers.GetOrdinal("state");
                        Int32 prodPostalCodePos = rdrCustomers.GetOrdinal("postalCode");
                        Int32 prodCountryIdPos = rdrCustomers.GetOrdinal("countryId");
                        Int32 prodEmailPos = rdrCustomers.GetOrdinal("email");

                        Int32    pId;
                        String   pName;
                        String   pStreetAndNumber;
                        String   pCity;
                        String   pState;
                        String   pPostalCode;
                        Int32   pCountryId;
                        String   pEmail;

                        while (rdrCustomers.Read())
                        {

                            if (rdrCustomers.IsDBNull(prodIdPos))
                            { pId = 0; }
                            else
                            { pId = rdrCustomers.GetInt32(prodIdPos); }

                            if (rdrCustomers.IsDBNull(prodNamePos))
                            { pName = null; }
                            else
                            { pName  = rdrCustomers.GetString(prodNamePos); }

                            if (rdrCustomers.IsDBNull(prodStreetAndNumberPos))
                            { pStreetAndNumber = null; }
                            else
                             { pStreetAndNumber = rdrCustomers.GetString(prodStreetAndNumberPos); }

                            if (rdrCustomers.IsDBNull(prodCityPos))
                            { pCity = null; }
                            else
                            { pCity = rdrCustomers.GetString(prodCityPos); }

                            if (rdrCustomers.IsDBNull(prodStatePos))
                            { pState = null; }
                            else
                            { pState = rdrCustomers.GetString(prodStatePos); }

                            if (rdrCustomers.IsDBNull(prodPostalCodePos))
                            { pPostalCode = null; }
                            else
                            { pPostalCode = rdrCustomers.GetString(prodPostalCodePos); }

                            if (rdrCustomers.IsDBNull(prodCountryIdPos))
                            { pCountryId = 0; }
                            else
                            { pCountryId = rdrCustomers.GetInt32(prodCountryIdPos); }

                            if (rdrCustomers.IsDBNull(prodEmailPos))
                            { pEmail = null; }
                            else
                            { pEmail = rdrCustomers.GetString(prodEmailPos); }

                           
                            products.Add(new Customer(pId, pName, pStreetAndNumber, pCity, pState, pPostalCode, pCountryId, pEmail));


                        } // do while
                    } // using rdrProducts
                } // using comProducts
            } // using conToysForBoys
            return products;
        }

        public List<Customer> AddNewCustomerToToysForBoys(List<Customer> newProducts)
        {
           // throw new NotImplementedException();

  
            List<Customer> nietToegevoegdeProducts = new List<Customer>();
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
                    parScale.ParameterName = "@streetAndNumber";
                    comInsert.Parameters.Add(parScale);

                    var parDescription = comInsert.CreateParameter();
                    parDescription.ParameterName = "@city";
                    comInsert.Parameters.Add(parDescription);

                    var parQuantityInStock = comInsert.CreateParameter();
                    parQuantityInStock.ParameterName = "@state";
                    comInsert.Parameters.Add(parQuantityInStock);

                    var parQuantityInOrder = comInsert.CreateParameter();
                    parQuantityInOrder.ParameterName = "@postalCode";
                    comInsert.Parameters.Add(parQuantityInOrder);

                    var parBuyPrice = comInsert.CreateParameter();
                    parBuyPrice.ParameterName = "@countryId";
                    comInsert.Parameters.Add(parBuyPrice);

                    var parProductlineId = comInsert.CreateParameter();
                    parProductlineId.ParameterName = "@email";
                    comInsert.Parameters.Add(parProductlineId);




                    conBieren.Open();


                    foreach (Customer eenProduct in newProducts)


                    {
                        try
                        {
                            parName.Value = eenProduct.Name;
                            parScale.Value = eenProduct.StreetAndNumber;
                            parDescription.Value = eenProduct.City;
                            parQuantityInStock.Value = eenProduct.State;
                            parQuantityInOrder.Value = eenProduct.PostalCode;
                            parBuyPrice.Value = eenProduct.CountryId;
                            parProductlineId.Value = eenProduct.Email;


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

        public List<Customer> UpdateCustomerToToysForBoys(List<Customer> modifiedProducts)
        {
            List<Customer> failedUpdates = new List<Customer>();
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
                    parScale.ParameterName = "@streetAndNumber";
                    comUpdate.Parameters.Add(parScale);

                    var parDescription = comUpdate.CreateParameter();
                    parDescription.ParameterName = "@city";
                    comUpdate.Parameters.Add(parDescription);

                    var parInStock = comUpdate.CreateParameter();
                    parInStock.ParameterName = "@state";
                    comUpdate.Parameters.Add(parInStock);

                    var parInOrder = comUpdate.CreateParameter();
                    parInOrder.ParameterName = "@postalCode";
                    comUpdate.Parameters.Add(parInOrder);

                    var parPrice = comUpdate.CreateParameter();
                    parPrice.ParameterName = "@countryId";
                    comUpdate.Parameters.Add(parPrice);

                    var parProductlineId = comUpdate.CreateParameter();
                    parProductlineId.ParameterName = "@email";
                    comUpdate.Parameters.Add(parProductlineId);

                    conToys.Open();
                    foreach (Customer x in modifiedProducts)
                    {


                        try
                        {
                            parId.Value = x.Id;
                            parName.Value = x.Name;
                            parScale.Value = x.StreetAndNumber;
                            parDescription.Value = x.City;
                            parInStock.Value = x.State;
                            parInOrder.Value = x.PostalCode;
                            parProductlineId.Value = x.CountryId;
                            parPrice.Value = x.Email;

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
