// Librerías
using Datos;
using Entidades.Recomendacion;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Recomendacion;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de puntuación de servicios turístico
    [Route("api/[controller]")]
    [ApiController]
    public class PuntuacionServicioController : ControllerBase
    {

        // Variables

        // Métodos de la capa de servicios de puntuación de servicio turístico
        private SPuntuacionServicio ServiciosPuntuacionServicio { get; }

        // Constructor
        public PuntuacionServicioController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            ServiciosPuntuacionServicio = new SPuntuacionServicio(_context, _configuration);
        }

        // Métodos

        /// <summary>
        /// Crear registro de puntuación de servicio turístico
        /// </summary>
        /// <param name="puntuacion">Datos del registro de puntuación</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>201 - Registro de puntuación de servicio turístico creado correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el servicio turístico</exception>
        /// <exception cref="IntegridadException">409 - Ya se había generado un registro de puntuación por parte del turista al servicio turístico solicitado</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/puntuacionservicio/{hash}/{email}</route>
        [HttpPost("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Crear([FromBody] PuntuacionServicio puntuacion, string hash, string email)
        {
            ServiciosPuntuacionServicio.Crear(puntuacion, hash, email);
            return StatusCode(201);
        }

        /// <summary>
        /// Puntuar servicio turístico
        /// </summary>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <param name="email">E-mail del usuario</param>
        /// <param name="puntuacion">Puntuación del usuario</param>
        /// <returns>200 - Servicio turístico calificado correctamente</returns>
        [HttpGet("{servicioId}/{email}/{puntuacion}")]
        public IActionResult PuntuarServicio(int servicioId, string email, double puntuacion)
        {
            ServiciosPuntuacionServicio.PuntuarOfertaTuristica(servicioId, email, puntuacion);
            return StatusCode(200);
        }

    }
}
