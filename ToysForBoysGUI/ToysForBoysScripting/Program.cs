using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Smo;

namespace ToysForBoysScripting
{
    public class Program
    {
        string defaultDataPath { get; set; }
        public string defaultLogPath { get; set; }


        static void Main(string[] args)
        {
            Program paths = new Program();
            paths = RetrieveSqlPath();
            Console.WriteLine(paths.defaultDataPath);
            Console.WriteLine(paths.defaultLogPath);
            Console.ReadLine();
        }

        private static Program RetrieveSqlPath()
        {

            using (var connection = new SqlConnection("Data Source=.;Integrated Security=SSPI"))
            {
                var serverConnection = new Microsoft.SqlServer.Management.Common.ServerConnection(connection);
                var server = new Server(serverConnection);
                return new Program { 
                defaultDataPath = string.IsNullOrEmpty(server.Settings.DefaultFile) ? server.MasterDBPath : server.Settings.DefaultFile,
                defaultLogPath  =  string.IsNullOrEmpty(server.Settings.DefaultLog) ? (string)server.MasterDBLogPath : (string)server.Settings.DefaultLog};
            }
        }
    }
}
