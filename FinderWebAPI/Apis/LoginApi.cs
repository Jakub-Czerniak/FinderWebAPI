namespace FinderWebAPI.Apis
{
    public static class LoginApi
    {
        public static void ConfigureLoginApi(this WebApplication app)
        {
            app.MapPut("/Login", LoginUser);
        }

        private static async Task<IResult> LoginUser(LoginModel login ,ILoginData data)
        {
            try
            {
                var results =  await data.LoginUser(login);
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
