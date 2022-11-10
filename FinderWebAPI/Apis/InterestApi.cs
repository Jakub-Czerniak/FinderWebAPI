using System.Runtime.CompilerServices;

namespace FinderWebAPI.Apis
{
    public static class InterestApi
    {
        public static void ConfigureInterestApi(this WebApplication app)
        {
            app.MapGet("/Interests", GetInterests);
        }

        private static async Task<IResult> GetInterests(IInterestData data)
        {
            try 
            {
                return Results.Ok(await data.GetInterests());
            } 
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

    }
}
