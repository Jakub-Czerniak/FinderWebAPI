using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IInterestData
    {
        Task DeleteUserInterests(int userID);
        Task<IEnumerable<InterestModel>> GetInterests();
        Task<IEnumerable<InterestModel>> GetUserInterests(int id);
        Task InsertUserInterest(int userID, int interestID);
    }
}