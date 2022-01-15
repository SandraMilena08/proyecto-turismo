// Librerías
using Datos;
using Entidades.Usuarios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Usuarios;
using System.Threading.Tasks;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de turista
    [Route("api/[controller]")]
    [ApiController]
    public class TuristaController : ControllerBase
    {

        // Variables
        private STurista ServiciosTurista { get; }

        // Constructor
        public TuristaController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            ServiciosTurista = new STurista(_context, _configuration);
        }

        // Métodos

        // Crear turista
        [HttpPost]
        public async Task<IActionResult> Crear([FromBody] Turista turista)
        {
            await ServiciosTurista.Crear(turista);
            return StatusCode(201);
        }

        // Leer turista filtrado por hash
        [HttpGet("{hash}")]
        [Authorize]
        [CustomAuthorizationFilter("turista")]
        public IActionResult Leer(string hash)
        {
            return StatusCode(200, new { turista = ServiciosTurista.Leer(hash) });
        }

        // Actualizar turista
        [HttpPut]
        [Authorize]
        [CustomAuthorizationFilter("turista")]
        public IActionResult Actualizar([FromBody] Turista turista)
        {
            return StatusCode(200, new { informacion = ServiciosTurista.ActualizarDatosPersonales(turista) });
        }

        /// <summary>
        /// Verificar la existencia de turista a partir de un E-mail
        /// </summary>
        /// <param name="email">E-mail a verificar</param>
        /// <returns>True - Si el e-mail existe | False - Si el e-mail NO existe</returns>
        [HttpGet("verificar/{email}")]
        public IActionResult VerificarExistencia(string email)
        {
            return StatusCode(200, new { existe = ServiciosTurista.VerificarExistencia(email) });
        }

    }
}
