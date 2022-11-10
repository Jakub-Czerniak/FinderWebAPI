using System.Runtime.CompilerServices;

namespace FinderWebAPI.Apis
{
    public static class MatchEngineApi
    {
        public static void ConfigureMatchEngineApi(this WebApplication app)
        {
            app.MapPost("/MatchEngine", GetBestMatch);
        }

        private static async Task<IResult> GetBestMatch(MatchEngineModel matchEngine, IMatchEngineData data)
        {
            try
            {
                var results = await data.GetBestMatch(matchEngine);
                if (results == null)
                    return Results.NotFound();
                return Results.Ok(results);
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
    }
}
