using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(dotNETMVCClient.Startup))]
namespace dotNETMVCClient
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
