using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data
{
    public class MatchEngineData : IMatchEngineData
    {
        private readonly ISqlDataAccess _db;

        public MatchEngineData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<UserModel?> GetBestMatch(MatchEngineModel matchEngine)
        {
            var result = await _db.LoadData<UserModel, dynamic>("FindBestMatchByInterests", new { ID = matchEngine.UserID });

            return result.FirstOrDefault();
        }
    }
}
