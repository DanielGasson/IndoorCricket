using System.Web.Http.Results;
using NUnit.Framework;
using StatsAPI.Controllers;

namespace StatsAPI.Tests.ControllerTests
{
	[TestFixture]
	public class PingControllerTests
	{
		[Test]
		public void when_successfully_calling_ping()
		{
			var sut = new PingController();

			var result = sut.Ping();

		    Assert.That(result as OkResult, Is.Not.Null);
		}
	}
}
