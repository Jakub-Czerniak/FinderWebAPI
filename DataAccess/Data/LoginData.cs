using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data
{
    public class LoginData : ILoginData
    {
        private readonly ISqlDataAccess _db;

        public LoginData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<UserModel?> LoginUser(LoginModel login)
        {
            var result = await _db.LoadData<UserModel, dynamic>("LoginUser", new { Email = login.Email, Password = login.Password });

            return result.FirstOrDefault();
        }
    }
}
