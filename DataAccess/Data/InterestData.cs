using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data
{
    public class InterestData : IInterestData
    {
        private readonly ISqlDataAccess _db;

        public InterestData(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task<IEnumerable<InterestModel>> GetInterests() =>
            _db.LoadData<InterestModel, dynamic>("FindAllInterests", new { });

        public Task<IEnumerable<InterestModel>> GetUserInterests(int id) =>
            _db.LoadData<InterestModel, dynamic>("FindUserInterests", new { UserID = id });

        public Task InsertUserInterest(int userID, int interestID) =>
            _db.SaveData("InsertUserInterest", new { UserID = userID, InterestID = interestID });

        public Task DeleteUserInterests(int userID) =>
            _db.SaveData("DeleteUserInterests", new { UserID = userID });
    }
}
