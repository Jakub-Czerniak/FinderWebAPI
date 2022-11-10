using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data
{
    public class PairData : IPairData
    {
        private readonly ISqlDataAccess _db;

        public PairData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<IEnumerable<UserModel>> GetPairs(int id)
        {
            var result = await _db.LoadData<UserModel, dynamic>("FindMatchedUsers", new { ID = id });

            return result.ToList();
        }

        public Task InsertDecision(PairModel pair) =>
            _db.SaveData("SendDecision", pair);
    }
}
