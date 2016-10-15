using System.Web.Http;

namespace StatsAPI
{
	public class PingController : ApiController
	{
		[HttpGet]
		public IHttpActionResult Ping()
		{
			return Ok();
		}
	}
}
