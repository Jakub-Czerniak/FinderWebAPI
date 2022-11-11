namespace FinderWebAPI.Apis
{
    public static class UserApi
    {
        public static void ConfigureUserApi(this WebApplication app)
        {
            app.MapGet("/Users/{id}", GetUser);
            app.MapPut("/Users", InsertUser);
            app.MapPost("/Users", UpdateUser);
            app.MapDelete("/Users/{id}", DeleteUser);

            app.MapGet("Users/{userID}/Interests", GetUserInterests);
            app.MapPut("Users/{userID}/Interests", InsertUserInterest);
            app.MapDelete("Users/{userID}/Interests", DeleteUserInterests);
        }

        private static async Task<IResult> GetUser(int id, IUserData data)
        {
            try 
            {
                var results = await data.GetUser(id);
                if (results == null)
                    return Results.NotFound();
                return Results.Ok(results);
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
        
        private static async Task<IResult> InsertUser(UserModel user, IUserData data)
        {
            try
            {
                await data.InsertUser(user);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> UpdateUser(UserModel user, IUserData data)
        {
            try
            {
                await data.UpdateUser(user);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> DeleteUser(int id, IUserData data)
        {
            try
            {
                await data.DeleteUser(id);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> GetUserInterests(int userID, IInterestData data)
        {
            try
            {
                return Results.Ok(await data.GetUserInterests(userID));
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> InsertUserInterest(int userID, InterestModel interest, IInterestData data)
        {
            try
            { 
                await data.InsertUserInterest(userID, interest.Id);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> DeleteUserInterests(int userID, IInterestData data)
        {
            try
            {
                await data.DeleteUserInterests(userID);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }


    }
}
