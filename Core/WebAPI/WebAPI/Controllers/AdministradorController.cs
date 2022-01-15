// Librerías
using Datos;
using Entidades.Usuarios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Usuarios;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de administrador
    [Route("api/[controller]")]
    [ApiController]
    public class AdministradorController : ControllerBase
    {

        // Variables
        private PostgreSQLContext DbContext { get; }
        private IConfiguration Configuration { get; }
        private SAdministrador serviciosAdministrador { get; }

        // Constructor
        public AdministradorController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            DbContext = _context;
            Configuration = _configuration;
            serviciosAdministrador = new SAdministrador(_context, _configuration);
        }

        // Métodos

        [HttpGet("{hash}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Leer(string hash)
        {
            return StatusCode(200, new { administrador = serviciosAdministrador.Leer(hash) });
        }

        // Actualizar administrador
        [HttpPut]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Actualizar(Administrador administrador)
        {
            return StatusCode(200, new { informacion = serviciosAdministrador.ActualizarDatosPersonales(administrador) });
        }

    }
}
