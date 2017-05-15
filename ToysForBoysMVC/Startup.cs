using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ToysForBoysMVC.Startup))]
namespace ToysForBoysMVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
