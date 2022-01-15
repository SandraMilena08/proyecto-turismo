// Librerías
using Datos;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Seguridad;
using System.Threading.Tasks;

namespace WebAPI.Controllers
{

    // Controlador de recuperar cuenta
    [Route("api/[controller]")]
    [ApiController]
    public class RecuperarCuentaController : ControllerBase
    {

        // Variables
        private PostgreSQLContext DbContext { get; }
        private IConfiguration Configuration { get; }
        private SRecuperarCuenta serviciosRecuperarCuenta { get; }

        // Constructor
        public RecuperarCuentaController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            DbContext = _context;
            Configuration = _configuration;
            serviciosRecuperarCuenta = new SRecuperarCuenta(_context, _configuration);
        }

        // Métodos

        // Crear solicitud de recuperar cuenta
        [HttpGet("{email}/{rol}")]
        public async Task<IActionResult> Crear(string email, string rol)
        {
            await serviciosRecuperarCuenta.Crear(email, rol);
            return StatusCode(201);
        }

        // Cambiar clave de usuario
        [HttpGet("cambiar-clave/{hash}/{clave}")]
        public IActionResult CambiarClave(string hash, string clave)
        {
            serviciosRecuperarCuenta.CambiarClave(hash, clave);
            return StatusCode(200);
        }

        // Reenviar código de recuperar cuenta
        [HttpGet("codigo/reenviar/email/{email}")]
        public async Task<IActionResult> ReenviarCodigo(string email)
        {
            await serviciosRecuperarCuenta.ReenviarCodigo(email);
            return StatusCode(200);
        }

    }
}
