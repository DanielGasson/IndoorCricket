using System.Configuration;

namespace StatsAPI
{
	public class ConnectionProperties : IConnectionProperties
	{
		private readonly string _connectionString;

		public ConnectionProperties()
		{
			_connectionString = ConfigurationManager.ConnectionStrings["DatabaseConnection"].ConnectionString;
		}

		public string ConnectionString
		{
			get
			{
				return _connectionString;
			}
		}
	}
}
