using System.Collections.Generic;
using Dapper;
using MySql.Data.MySqlClient;

namespace StatsAPI.DataAccess
{
	public class DapperRepository : IRepository
	{
		private readonly IConnectionProperties _connectionProperties;

		public DapperRepository(IConnectionProperties connectionProperties)
		{
			_connectionProperties = connectionProperties;
		}

		public IEnumerable<T> Query<T>(string sql)
		{
			using (var connection = new MySqlConnection(_connectionProperties.ConnectionString))
			{
				return connection.Query<T>(sql);
			}
		}

		public T QuerySingle<T>(string sql)
		{
			using (var connection = new MySqlConnection(_connectionProperties.ConnectionString))
			{
				return connection.QueryFirst<T>(sql);
			}
		}
	}
}
