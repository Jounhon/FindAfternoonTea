using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FindAfternoonTea.Startup))]
namespace FindAfternoonTea
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
