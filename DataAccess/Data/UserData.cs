using DataAccess.DbAccess;
using FinderWebAPI.Models;


namespace DataAccess.Data
{
    public class UserData : IUserData
    {
        private readonly ISqlDataAccess _db;
        public UserData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<UserModel?> LoginUser(string email, string password)
        {
            var result = await _db.LoadData<UserModel, dynamic>("LoginUser", new { Email = email, Password = password });

            return result.FirstOrDefault();
        }

        public async Task<UserModel?> GetEmail(string email)
        {
            var result = await _db.LoadData<UserModel, dynamic>("CheckEmailUnique", new { Email = email });

            return result.FirstOrDefault();
        }

        public async Task<UserModel?> GetUser(int id)
        {
            var result = await _db.LoadData<UserModel, dynamic>("LoadUserDetails", new { ID = id });

            return result.FirstOrDefault();
        }

        public async Task<UserModel?> GetBestMatch(int id)
        {
            var result = await _db.LoadData<UserModel, dynamic>("FindBestMatchByInterests", new { ID = id });

            return result.FirstOrDefault();
        }

        public async Task<IEnumerable<UserModel>> GetMatchedUsers(int userID)
        {
            var result = await _db.LoadData<UserModel, dynamic>("FindMatchedUsers", new { ID = userID });

            return result.ToList();
        }


        public Task InsertUser(UserModel user) =>
            _db.SaveData("RegisterUser", new { user.Name, user.Email, user.Password, user.Gender, user.Photo, user.InterestedM, user.InterestedF, user.Birthday });

        public Task UpdateUser(UserModel user) =>
            _db.SaveData("UpdateUser", new { });

        public Task DeleteUser(UserModel user) =>
            _db.SaveData("DeleteUser", new { });
    }
}
