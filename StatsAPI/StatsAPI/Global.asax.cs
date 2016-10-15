using Microsoft.Owin.Hosting;
using System.Web;

namespace StatsAPI
{
	public class Global : HttpApplication
	{
		protected void Application_Start()
		{
			string baseUri = "http://localhost:8081";
			WebApp.Start<Startup>(baseUri);
		}
	}
}
