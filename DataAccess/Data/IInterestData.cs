using FinderWebAPI.Models;

namespace DataAccess.Data
{
    public interface IInterestData
    {
        Task DeleteUserInterest(int userID);
        Task<IEnumerable<InterestModel>> GetInterests();
        Task<IEnumerable<InterestModel>> GetUserInterests(int id);
        Task InsertUserInterest(int userID, int interestID);
    }
}