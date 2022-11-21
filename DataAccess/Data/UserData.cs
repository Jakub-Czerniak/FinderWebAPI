using DataAccess.DbAccess;
using DataAccess.Models;


namespace DataAccess.Data
{
    public class UserData : IUserData
    {
        private readonly ISqlDataAccess _db;
        public UserData(ISqlDataAccess db)
        {
            _db = db;
        }

        public async Task<UserModel?> GetUser(int id)
        {
            var result = await _db.LoadData<UserModel, dynamic>("LoadUserDetails", new { ID = id });

            return result.FirstOrDefault();
        }

        public Task InsertUser(UserModel user) =>
            _db.SaveData("RegisterUser", new { user.Name, user.Email, user.Password, user.Gender, user.Photo, user.InterestedM, user.InterestedF, user.Birthday });

        public Task UpdateUser(UserModel user) =>
            _db.SaveData("UpdateUser", new {user.Id, user.Photo, user.InterestedM, user.InterestedF, user.AboutMe, user.MinAgePreference, user.MaxAgePreference  });

        public Task DeleteUser(int id) =>
            _db.SaveData("RemoveUser", new { ID = id });
    }
}
