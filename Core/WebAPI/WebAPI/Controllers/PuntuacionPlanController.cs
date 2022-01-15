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

    // Controlador de puntuación de plan turístico
    [Route("api/[controller]")]
    [ApiController]
    public class PuntuacionPlanController : ControllerBase
    {

        // Variables

        // Métodos de la capa de servicios de puntuación del plan turístico
        private SPuntuacionPlan ServiciosPuntuacionPlan { get; }

        // Constructor
        public PuntuacionPlanController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            ServiciosPuntuacionPlan = new SPuntuacionPlan(_context, _configuration);
        }

        // Métodos

        /// <summary>
        /// Crear registro de puntuación de plan turístico
        /// </summary>
        /// <param name="puntuacion">Datos del registro de puntuación</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>201 - Registro de puntuación de plan turístico creado correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el plan turístico</exception>
        /// <exception cref="IntegridadException">409 - Ya se había generado un registro de puntuación por parte del turista al plan turístico solicitado</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/puntuacionplan/{hash}/{email}</route>
        [HttpPost("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Crear([FromBody] PuntuacionPlan puntuacion, string hash, string email)
        {
            ServiciosPuntuacionPlan.Crear(puntuacion, hash, email);
            return StatusCode(201);
        }

        /// <summary>
        /// Puntuar plan turístico
        /// </summary>
        /// <param name="planId">ID del plan turístico</param>
        /// <param name="email">E-mail del usuario</param>
        /// <param name="puntuacion">Puntuación del usuario</param>
        /// <returns>200 - Plan turístico calificado correctamente</returns>
        [HttpGet("{planId}/{email}/{puntuacion}")]
        public IActionResult PuntuarServicio(int planId, string email, double puntuacion)
        {
            ServiciosPuntuacionPlan.PuntuarOfertaTuristica(planId, email, puntuacion);
            return StatusCode(200);
        }

    }
}
