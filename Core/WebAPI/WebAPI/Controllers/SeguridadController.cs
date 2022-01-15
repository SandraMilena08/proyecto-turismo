// Librerías
using Datos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Seguridad;
using Utilitarios;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de seguridad
    [Route("api/[controller]")]
    [ApiController]
    public class SeguridadController : ControllerBase
    {

        // Variables
        private SSeguridad serviciosSeguridad { get; }
        private PostgreSQLContext DbContext { get; }
        private IConfiguration Configuration { get; }

        // Constructor
        public SeguridadController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            serviciosSeguridad = new SSeguridad(_context, _configuration);
            DbContext = _context;
            Configuration = _configuration;
        }

        // Métodos

        // Iniciar sesión
        [HttpPost("iniciar-sesion")]
        public IActionResult IniciarSesion(Login login)
        {
            return StatusCode(202, serviciosSeguridad.IniciarSesion(login, true));
        }

        // Cerrar sesión
        [Authorize]
        [CustomAuthorizationFilter("all")]
        [HttpGet("cerrar-sesion/{email}")]
        public IActionResult CerrarSesion(string email)
        {
            serviciosSeguridad.CerrarSesion(email);
            return StatusCode(200);
        }

    }
}
