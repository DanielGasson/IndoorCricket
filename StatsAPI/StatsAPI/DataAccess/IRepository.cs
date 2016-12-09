using System.Collections.Generic;

namespace StatsAPI.DataAccess
{
	public interface IRepository
	{
		IEnumerable<T> Query<T>(string sql);

		T QuerySingle<T>(string sql);
	}
}
