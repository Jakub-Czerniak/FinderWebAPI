using DataAccess.DbAccess;
using FinderWebAPI.Models;

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
            _db.LoadData<InterestModel, dynamic>("FindUserInterests", new { ID = id });

        public Task InsertUserInterest(int userID, int interestID) =>
            _db.SaveData("InsertUserInterest", new { UserID = userID, InterestID = interestID });

        public Task DeleteUserInterest(int userID) =>
            _db.SaveData("DeleteUserInterest", new { UserID = userID });
    }
}
