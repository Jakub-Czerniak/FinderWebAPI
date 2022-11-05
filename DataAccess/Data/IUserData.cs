using FinderWebAPI.Models;

namespace DataAccess.Data
{
    public interface IUserData
    {
        Task DeleteUser(UserModel user);
        Task<UserModel?> GetBestMatch(int id);
        Task<UserModel?> GetEmail(string email);
        Task<IEnumerable<UserModel>> GetMatchedUsers(int userID);
        Task<UserModel?> GetUser(int id);
        Task InsertUser(UserModel user);
        Task<UserModel?> LoginUser(string email, string password);
        Task UpdateUser(UserModel user);
    }
}