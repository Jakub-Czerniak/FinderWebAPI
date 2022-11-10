using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IEmailData
    {
        Task<UserModel?> EmailIsUnique(EmailModel email);
    }
}