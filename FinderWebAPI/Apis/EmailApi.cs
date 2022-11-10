namespace FinderWebAPI.Apis
{
    public static class EmailApi
    {
        public static void ConfigureEmailApi(this WebApplication app)
        {
            app.MapPost("/Emails", EmailIsUnique);
        }

        private static async Task<IResult> EmailIsUnique(EmailModel email, IEmailData data)
        {
            try
            {
                return Results.Ok(await data.EmailIsUnique(email));
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
    }
}
