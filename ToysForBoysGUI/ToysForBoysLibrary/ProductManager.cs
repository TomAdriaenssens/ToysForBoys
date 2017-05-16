using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToysForBoysLibrary
{
    public class ProductManager
    {

        public Decimal SaldoRekeningRaadplegen(String rekeningNr)
        {
            var dbManager = new ToysForBoysDbManager();
            using (var conToys = dbManager.GetConnection())
            {
                using (var ProductenVanEenLijn = conToys.CreateCommand())
                {
                    ProductenVanEenLijn.CommandType = CommandType.StoredProcedure;
                    ProductenVanEenLijn.CommandText = "GetAllProductsOfOneProductLineName";
                    var parLijnNaam = ProductenVanEenLijn.CreateParameter();
                    parLijnNaam.ParameterName = "@name";
                    parLijnNaam.Value = rekeningNr;
                    ProductenVanEenLijn.Parameters.Add(parLijnNaam);
                    conToys.Open();
                    Object resultaat = ProductenVanEenLijn.ExecuteScalar();
                    if (resultaat == null)
                    {
                        throw new Exception("Speelgoedlijn bestaat niet");
                    }
                    else
                    {
                        return (Decimal)resultaat;
                    }
                }
            }
        }
    }
}
