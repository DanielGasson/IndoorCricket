using System.Web.Http.Results;
using NUnit.Framework;

namespace StatsAPI.Tests
{
	[TestFixture]
	public class PingControllerTests
	{
		[Test]
		public void when_successfully_calling_ping()
		{
			var sut = new PingController();

			var result = sut.Ping();

			Assert.IsNotNull(result as OkResult);
		}
	}
}
