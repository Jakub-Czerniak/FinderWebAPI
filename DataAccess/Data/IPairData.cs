using FinderWebAPI.Models;

namespace DataAccess.Data
{
    public interface IPairData
    {
        Task InsertDecision(PairModel pair);
    }
}