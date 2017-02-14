using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GapiJs.Startup))]
namespace GapiJs
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
