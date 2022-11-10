using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IMatchEngineData
    {
        Task<UserModel?> GetBestMatch(MatchEngineModel matchEngine);
    }
}