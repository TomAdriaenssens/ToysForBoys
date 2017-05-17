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

        public ObservableCollection<Productline> GetProductlineNames()
        {
            ObservableCollection<Productline> productlines = new ObservableCollection<Productline>();

            var dbManager = new ToysForBoysDbManager();

            using (var conProducten = dbManager.GetConnection())
            {
                using (var comProducten = conProducten.CreateCommand())
                {
                    comProducten.CommandType = CommandType.StoredProcedure;
                    comProducten.CommandText = "[toysforboys].[dbo].[SP_GetAllProducts]";
             
                    conProducten.Open();

                    using (var rdrProductlines = comProducten.ExecuteReader())
                    {
                        Int32 prodIdPos = rdrProductlines.GetOrdinal("id");
                        Int32 prodNamePos = rdrProductlines.GetOrdinal("name");
                        Int32 prodDescriptionPos = rdrProductlines.GetOrdinal("description");

                        Int32 pId;
                        String pName;
                        String pDescription;

                        while (rdrProductlines.Read())
                        {

                            if (rdrProductlines.IsDBNull(prodIdPos))
                            { pId = 0; }
                            else
                            { pId = rdrProductlines.GetInt32(prodIdPos); }

                            if (rdrProductlines.IsDBNull(prodNamePos))
                            { pName = null; }
                            else
                            { pName = rdrProductlines.GetString(prodNamePos); }

                            if (rdrProductlines.IsDBNull(prodDescriptionPos))
                            { pDescription = null; }
                            else
                            { pDescription = rdrProductlines.GetString(prodDescriptionPos); }


                            productlines.Add(new Productline(pId, pName, pDescription));


                        } // do while
                    } // using rdrProducts
                } // using comProducts
            } // using conToysForBoys
            return productlines;
        }
    }
}