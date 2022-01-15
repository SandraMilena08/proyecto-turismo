// Librerias
using Datos;
using Entidades.Oferta;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Servicios.Oferta;
using System.Threading.Tasks;
using Utilitarios;
using WebAPI.Filters;

namespace WebAPI.Controllers
{

    // Controlador de planes turisticos
    [Route("api/[controller]")]
    [ApiController]
    public class PlanController : ControllerBase
    {

        // Variables      

        // Métodos de la capa de servicios de plan turístico
        private SPlan ServiciosPlan { get; }

        // Constructor
        public PlanController(PostgreSQLContext _context, IWebHostEnvironment _hostEnvironment)
        {
            ServiciosPlan = new SPlan(_context, _hostEnvironment);
        }

        // Metodos

        /// <summary>
        /// Almacenar plan turístico
        /// </summary>
        /// <param name="servicio">Datos del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>201 - Plan turístico creado correctamente</returns>
        /// <exception cref="IntegridadException">409 - El proveedor excedió el número de planes turísticos que puede registrar</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/plan/{hash}/{email}</route>
        [HttpPost("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Crear([FromBody] Plan plan, string hash, string email)
        {
            ServiciosPlan.Crear(plan, hash, email);
            return StatusCode(201);
        }

        /// <summary>
        /// Leer información de un plan turístico para turista
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="infoProveedor">Bandera que indica si se retorna o no la información del proveedor</param>
        /// <returns>200 - Información del plan turístico</returns>
        [HttpGet("t/{id}")]
        public async Task<IActionResult> LeerTurista(int id)
        {
            return StatusCode(200, new { datos = await ServiciosPlan.Leer(id, true, true) });
        }

        /// <summary>
        /// Leer información de un plan turístico para administrador
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="infoProveedor">Bandera que indica si se retorna o no la información del proveedor</param>
        /// <param name="estado">Estado del plan turístico</param>
        /// <returns>200 - Información del plan turístico</returns>
        [HttpGet("a/{id}/{estado}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public async Task<IActionResult> LeerAdministrador(int id, bool estado)
        {
            return StatusCode(200, new { datos = await ServiciosPlan.Leer(id, true, estado) });
        }

        /// <summary>
        /// Leer planes turísticos pertenecientes a un proveedor
        /// </summary>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>        
        /// <returns>200 - Lista de planes turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay planes turísticos asociados al proveedor</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/{hash}/{email}</route>
        [HttpGet("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Leer(string hash, string email)
        {
            return StatusCode(200, new { listaPlanes = ServiciosPlan.Leer(hash, email) });
        }

        /// <summary>
        /// Leer plan turístico filtrado por ID y proveedor
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>200 - Información del plan turístico</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/plan/{id}/{hash}/{email}</route>
        [HttpGet("{id}/{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Leer(int id, string hash, string email)
        {
            return StatusCode(200, new { plan = ServiciosPlan.Leer(id, hash, email) });
        }

        /// <summary>
        /// Leer planes turísticos paginados filtrados por el estado de habilitado
        /// </summary>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes que se desean ver por página</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>200 - Información paginada de planes turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay planes turísticos</exception>
        /// <route>/api/plan/pag/{pagina}/{cantidad}/{estado}</route>
        [HttpGet("pag/{pagina}/{cantidad}/{estado}")]
        [Authorize]
        [CustomAuthorizationFilter("all")]
        public IActionResult Leer(short pagina, short cantidad, bool estado)
        {
            return StatusCode(200, new { informacion = ServiciosPlan.Leer(pagina, cantidad, estado) });
        }

        /// <summary>
        /// Leer planes turísticos paginados filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes turísticos a mostrar</param>
        /// <returns>200 - Información paginada de planes turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay planes turísticos</exception>
        [HttpPost("pag/{pagina}/{cantidad}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Leer([FromBody] Busqueda parametros, short pagina, short cantidad)
        {
            return StatusCode(200, new { informacion = ServiciosPlan.Leer(parametros, pagina, cantidad) });
        }

        /// <summary>
        /// Leer planes turísticos paginados filtrados para turistas
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes turísticos a mostrar</param>
        /// <returns>200 - Información paginada de planes turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay planes turísticos</exception>
        [HttpPost("pag/t/{pagina}/{cantidad}")]
        public IActionResult LeerPaginado([FromBody] Busqueda parametros, short pagina, short cantidad)
        {
            parametros.Estado = true;
            return StatusCode(200, new { informacion = ServiciosPlan.Leer(parametros, pagina, cantidad) });
        }

        /// <summary>
        /// Leer servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <returns>Datos del servicio turístico</returns>
        [HttpGet("{id}")]
        public IActionResult Leer(int id)
        {
            return StatusCode(200, new { plan = ServiciosPlan.Leer(id) });
        }

        /// <summary>
        /// Actualizar la información de plan turístico
        /// </summary>
        /// <param name="servicio">Datos del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>200 - Información del plan turístico actualizada correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/plan/{hash}/{email}</route>
        [HttpPut("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Actualizar([FromBody] Plan plan, string hash, string email)
        {
            ServiciosPlan.Actualizar(plan, hash, email);
            return StatusCode(200);
        }

        /// <summary>
        /// Actualizar imágenes de plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="imagenes">Colección de imágenes</param>
        /// <returns>200 - Información de imágenes de plan turístico actualizada correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/plan/imagenes/{id}/{hash}/{email}</route>
        [HttpPut("imagenes/{id}/{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Actualizar(int id, string hash, string email)
        {
            IFormFileCollection listaImagenes = Request.Form.Files;
            ServiciosPlan.Actualizar(id, hash, email, listaImagenes);
            return StatusCode(200);
        }

        /// <summary>
        /// Actualizar estado de habilitado de plan turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <returns>200 - Plan turístico actualizado correctamente</returns>
        [HttpGet("habilitado/{id}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Actualizar(int id)
        {
            ServiciosPlan.Actualizar(id);
            return StatusCode(200);
        }

        /// <summary>
        /// Eliminar plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail</param>
        /// <returns>204 - Plan turístico eliminado correctamente</returns>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        /// <route>/api/plan/{id}/{hash}/{email}</route>
        [HttpDelete("{id}/{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Eliminar(int id, string hash, string email)
        {
            ServiciosPlan.Eliminar(id, hash, email);
            return StatusCode(204);
        }

        /// <summary>
        /// Eliminar imagen de un plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="direccionImagen">URL de la imagen</param>
        /// <returns>204 - Imagen de plan turístico eliminada correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        [HttpDelete("imagenes/{id}/{hash}/{email}/{direccionImagen}")]
        public IActionResult Eliminar(int id, string hash, string email, string direccionImagen)
        {
            ServiciosPlan.Eliminar(id, hash, email, direccionImagen);
            return StatusCode(204);
        }

    }
}
