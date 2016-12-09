using System.Collections.Generic;

namespace StatsAPI.DataAccess
{
	public interface IDataAccessAdaptor
	{
		IEnumerable<T> Query<T>(string query);

		T QuerySingle<T>(string query);
	}
}
