namespace DataAccess.DbAccess
{
    public interface ISqlDataAccess
    {
        Task<IEnumerable<T>> LoadData<T, U>(string storedProcedure, U parameters, string connectionID = "DefaultConnection");
        Task SaveData<T>(string storedProcedure, T parameters, string connectionID = "DefaultConnection");
    }
}