// Librerías
using Datos;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Reportes;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de reportes
    [Route("api/[controller]")]
    [ApiController]
    public class ReporteController : ControllerBase
    {

        // Variables

        // Métodos de la capa de servicios de reporte
        private SReporte ServiciosReporte { get; }

        // Constructor
        public ReporteController(PostgreSQLContext _context, IConfiguration _configuration)
        {
            ServiciosReporte = new(_context, _configuration);
        }

        // Métodos

        /// <summary>
        /// 
        /// </summary>
        /// <param name="month"></param>
        /// <param name="year"></param>
        /// <returns></returns>
        [HttpGet("{month}/{year}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult MejoresMunicipios(short month, short year)
        {
            return StatusCode(200, new { datos = ServiciosReporte.MejoresMunicipios(month, year) });
        }

        /// <summary>
        /// Obtener los servicios turísticos destacados del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <param name="municipio">Municipio al que pertenecen los servicios turísticos</param>
        /// <returns>Datos de servicios turísticos</returns>
        [HttpGet("servicios/{month}/{year}/{municipio}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult MejoresServicios(short month, short year, string municipio)
        {
            return StatusCode(200, new { datos = ServiciosReporte.MejoresServicios(month, year, municipio) });
        }

        /// <summary>
        /// Obtener los planes turísticos destacados del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <param name="municipio">Municipio al que pertenecen los planes turísticos</param>
        /// <returns>Datos de planes turísticos</returns>
        [HttpGet("planes/{month}/{year}/{municipio}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult MejoresPlanes(short month, short year, string municipio)
        {
            return StatusCode(200, new { datos = ServiciosReporte.MejoresPlanes(month, year, municipio) });
        }

        [HttpGet("categorias/{month}/{year}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult CategoriaEdad(short month, short year)
        {
            return StatusCode(200, new { datos = ServiciosReporte.CategoriasEdad(month, year) });
        }

    }
}
