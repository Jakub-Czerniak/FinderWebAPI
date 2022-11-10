namespace FinderWebAPI.Apis
{
    public static class PairApi
    {
        public static void ConfigurePairApi(this WebApplication app)
        {
            app.MapGet("/Pairs/{id}", GetPairs);
            app.MapPut("/Pairs", InsertDecision);
        }

        private static async Task<IResult> GetPairs(int id, IPairData data)
        {
            try
            {
                return Results.Ok(await data.GetPairs(id));
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> InsertDecision(PairModel pair, IPairData data)
        {
            try
            {
                await data.InsertDecision(pair);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message); 
            }
        }
    }
}
