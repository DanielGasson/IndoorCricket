using Owin;
using System.Web.Http;
using System.Web.Http.Cors;

namespace StatsAPI
{
	public class Startup
	{
		public void Configuration(IAppBuilder app)
		{
			var webApiConfiguration = ConfigureWebApi();
			app.UseWebApi(webApiConfiguration);
		}

		private HttpConfiguration ConfigureWebApi()
		{
			var config = new HttpConfiguration();

			// Enable cross origin request sharing
			var cors = new EnableCorsAttribute("*", "*", "*");
			config.EnableCors(cors);

			// Routes
			config.Routes.MapHttpRoute(
				name: "ActionApi",
				routeTemplate: "cricket/{controller}/{action}/{id}",
				defaults: new { id = RouteParameter.Optional }
			);

			return config;
		}
	}
}
