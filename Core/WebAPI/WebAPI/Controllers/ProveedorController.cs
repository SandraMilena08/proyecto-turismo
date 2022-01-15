// Librerías
using Datos;
using Entidades.Usuarios;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Servicios.Usuarios;
using System.Threading.Tasks;
using Utilitarios;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de proveedor
    [Route("api/[controller]")]
    [ApiController]
    public class ProveedorController : ControllerBase
    {

        // Variables        
        private SProveedor ServiciosProveedor { get; }

        // Constructor
        public ProveedorController(PostgreSQLContext _context, IConfiguration _configuration, IWebHostEnvironment _hostEnvironment)
        {
            ServiciosProveedor = new SProveedor(_context, _configuration, _hostEnvironment);
        }

        // Métodos

        // Crear proveedor
        [HttpPost]
        public async Task<IActionResult> Crear([FromBody] Proveedor proveedor)
        {
            await ServiciosProveedor.Crear(proveedor);
            return StatusCode(201);
        }

        // Leer proveedor filtrado por hash
        [HttpGet("{hash}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Leer(string hash)
        {
            return StatusCode(200, new { proveedor = ServiciosProveedor.Leer(hash) });
        }

        // Leer lista paginada de proveedores filtrados por el estado
        [HttpGet("all/{pagina}/{cantidad}/{estado}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Leer(short pagina, short cantidad, bool estado)
        {
            return StatusCode(200, new { informacion = ServiciosProveedor.LeerEstadoHabilitado(pagina, cantidad, estado) });
        }

        /// <summary>
        /// Leer proveedores paginados filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de proveedores a mostrar</param>
        /// <returns>200 - Información de proveedores paginada</returns>
        [HttpPost("pag/{pagina}/{cantidad}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Leer([FromBody] BusquedaProveedor parametros, short pagina, short cantidad)
        {
            return StatusCode(200, new { informacion = ServiciosProveedor.Leer(parametros, pagina, cantidad) });
        }

        // Actualizar proveedor
        [HttpPut]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Actualizar([FromBody] Proveedor proveedor)
        {
            return StatusCode(200, new { informacion = ServiciosProveedor.ActualizarDatosPersonales(proveedor) });
        }

        // Actualizar icono del proveedor
        [HttpPut("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Actualizar([FromForm] IFormFile imagen, string hash, string email)
        {
            return StatusCode(200, new { informacion = ServiciosProveedor.ActualizarIcono(imagen, hash, email) });
        }

        /// <summary>
        /// Actualizar el estado de habilitado de proveedor
        /// </summary>
        /// <param name="hash">Hash del proveedor</param>
        /// <returns>200 - Proveedor actualizado</returns>
        [HttpGet("habilitado/{hash}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Actualizar(string hash)
        {
            ServiciosProveedor.ActualizarEstado(hash);
            return StatusCode(200);
        }

        // Validar la integridad de un nit
        [HttpGet("nit/{nit}")]
        public async Task<IActionResult> ValidarNit(string nit)
        {
            return StatusCode(200, new { existe = await ServiciosProveedor.ValidarNit(nit) });
        }

    }

}
