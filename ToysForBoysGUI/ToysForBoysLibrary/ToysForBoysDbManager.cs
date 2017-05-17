using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.Common;


namespace ToysForBoysLibrary
{
    public class ToysForBoysDbManager
    {
        private static ConnectionStringSettings conToysForBoysSetting = ConfigurationManager.ConnectionStrings["toysforboys"];

        private static DbProviderFactory factory =
            DbProviderFactories.GetFactory(conToysForBoysSetting.ProviderName);

        public DbConnection GetConnection()
        {
            var contoysForBoys = factory.CreateConnection();
            contoysForBoys.ConnectionString = conToysForBoysSetting.ConnectionString;
            return contoysForBoys;
        }
    }
}
