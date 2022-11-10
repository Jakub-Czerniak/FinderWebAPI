using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data
{
    public class EmailData : IEmailData
    {
        private readonly ISqlDataAccess _db;

        public EmailData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<UserModel?> EmailIsUnique(EmailModel email)
        {
            var result = await _db.LoadData<UserModel, dynamic>("CheckEmailUnique", new { Email = email.Email });

            return result.FirstOrDefault();
        }
    }
}
