using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IPairData
    {
        Task<IEnumerable<UserModel>> GetPairs(int id);
        Task InsertDecision(PairModel pair);
    }
}