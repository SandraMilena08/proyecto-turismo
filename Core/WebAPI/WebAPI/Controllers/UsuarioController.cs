// Librerías
using Datos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Usuarios;
using System.Threading.Tasks;

namespace WebAPI.Controllers
{

    // Controlador de usuario
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {

        // Variables
        private PostgreSQLContext DbContext { get; }
        private IConfiguration Configuration { get; }
        private SProveedor serviciosProveedor { get; }

        // Constructor
        public UsuarioController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            DbContext = _context;
            Configuration = _configuration;
            serviciosProveedor = new SProveedor(_context, _configuration);
        }

        // Métodos

        // Validar la integridad de un correo electrónico
        [HttpGet("email/{email}")]
        public async Task<IActionResult> ValidarEmail(string email)
        {
            return StatusCode(200, new { existe = await serviciosProveedor.ValidarEmail(email) });
        }

        // Reenviar código de verificación
        [HttpGet("codigo/reenviar/{email}")]
        public async Task<IActionResult> ReenviarCodigo(string email)
        {
            await new SPreRegistro(DbContext, Configuration).ReenviarCodigo(email);
            return StatusCode(200);
        }

        // Validar código de verificación
        [HttpGet("codigo/validar/{hash}")]
        public IActionResult ValidarCodigo(string hash)
        {
            new SPreRegistro(DbContext).ValidarCodigo(hash);
            return StatusCode(200);
        }

    }
}
