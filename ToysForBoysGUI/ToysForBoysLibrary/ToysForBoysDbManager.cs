using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.Common

namespace ToysForBoysLibrary
{
    class ToysForBoysDbManager
    {
        private static ConnectionStringSettings conVideoSettings = ConfigurationManager.ConnectionStrings[""];
        private static DbProviderFactory factory =
        DbProviderFactories.GetFactory(conVideoSettings.ProviderName);
        public DbConnection GetConnection()
        {
            var conVideo = factory.CreateConnection();
            conVideo.ConnectionString = conVideoSettings.ConnectionString;
            return conVideo;
        }
    }
}
