using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IMatchEngineData
    {
        Task<MatchEngineModel?> GetBestMatch(MatchEngineModel matchEngine);
    }
}