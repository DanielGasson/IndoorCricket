using System.Collections.Generic;
using Dapper;
using MySql.Data.MySqlClient;

namespace StatsAPI.DataAccess.Adaptors
{
	public class MySqlAdaptor : IDataAccessAdaptor
	{
		private readonly IConnectionProperties _connectionProperties;

		public MySqlAdaptor(IConnectionProperties connectionProperties)
		{
			_connectionProperties = connectionProperties;
		}

		public IEnumerable<T> Query<T>(string query)
		{
			using (var connection = new MySqlConnection(_connectionProperties.ConnectionString))
			{
				return connection.Query<T>(query);
			}
		}

		public T QuerySingle<T>(string query)
		{
			using (var connection = new MySqlConnection(_connectionProperties.ConnectionString))
			{
				return connection.QueryFirst<T>(query);
			}
		}
	}
}
