using System.Web.Http;

namespace StatsAPI.Controllers
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
