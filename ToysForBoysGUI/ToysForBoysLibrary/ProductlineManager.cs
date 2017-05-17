using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class ProductlineManager
    {

        public static List<Productline> GetProductlines()
        {
            List<Productline> prodlines = new List<Productline>();

            var dbManager = new ToysForBoysDbManager();

            using (var conProducten = dbManager.GetConnection())
            {
                using (var comProducten = conProducten.CreateCommand())
                {
                    comProducten.CommandType = CommandType.StoredProcedure;
                    
                    comProducten.CommandText = "[toysforboys].[dbo].[SP_ProductLines]";
                    
                    conProducten.Open();

                    using (var rdrProducts = comProducten.ExecuteReader())
                    {
                        Int32 prodIdPos = rdrProducts.GetOrdinal("id");
                        Int32 prodNamePos = rdrProducts.GetOrdinal("name");
                        Int32 prodDescriptionPos = rdrProducts.GetOrdinal("description");

                        Int32 pId;
                        String pName;
                        String pDescription;

                        while (rdrProducts.Read())
                        {

                            if (rdrProducts.IsDBNull(prodIdPos))
                            { pId = 0; }
                            else
                            { pId = rdrProducts.GetInt32(prodIdPos); }

                            if (rdrProducts.IsDBNull(prodNamePos))
                            { pName = null; }
                            else
                            { pName = rdrProducts.GetString(prodNamePos); }

                            if (rdrProducts.IsDBNull(prodDescriptionPos))
                            { pDescription = null; }
                            else
                            { pDescription = rdrProducts.GetString(prodDescriptionPos); }


                            prodlines.Add(new Productline(pId, pName, pDescription));


                        } // do while
                    } // using rdrProducts
                } // using comProducts
            } // using conToysForBoys
            return prodlines;
        }
    }
}