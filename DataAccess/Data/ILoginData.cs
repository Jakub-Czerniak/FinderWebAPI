using DataAccess.Models;

namespace DataAccess.Data
{
    public interface ILoginData
    {
        Task<UserModel?> LoginUser(LoginModel login);
    }
}