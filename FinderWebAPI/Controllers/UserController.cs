using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace FinderWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IConfiguration _config;
        public UserController(IConfiguration config)
        {
            _config = config;
        }
        [HttpGet] 
    }
}
