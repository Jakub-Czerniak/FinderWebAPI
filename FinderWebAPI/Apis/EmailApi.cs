namespace FinderWebAPI.Apis
{
    public static class EmailApi
    {
        public static void ConfigureEmailApi(this WebApplication app)
        {
            app.MapPut("/Emails", EmailIsUnique);
        }

        private static async Task<IResult> EmailIsUnique(EmailModel email, IEmailData data)
        {
            try
            {
                var response = await data.EmailIsUnique(email);
                if ( response == null)
                    return Results.NotFound();
                return Results.Ok(response);
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
    }
}
