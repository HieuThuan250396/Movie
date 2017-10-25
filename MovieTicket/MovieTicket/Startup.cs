using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MovieTicket.Startup))]
namespace MovieTicket
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
