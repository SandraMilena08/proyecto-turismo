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

    // Controlador de servicios turisticos
    [Route("api/[controller]")]
    [ApiController]
    public class ServicioController : ControllerBase
    {

        // Variables        

        // Métodos de la capa de servicio de servicio turístico
        private SServicio ServiciosServicio { get; }

        // Constructor
        public ServicioController(PostgreSQLContext _context, IWebHostEnvironment _hostEnvironment)
        {
            ServiciosServicio = new SServicio(_context, _hostEnvironment);
        }

        // Metodos

        /// <summary>
        /// Almacenar servicio turístico
        /// </summary>
        /// <param name="servicio">Datos del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>201 - Servicio turístico creado correctamente</returns>
        /// <exception cref="IntegridadException">409 - El proveedor excedió el número de servicios turísticos que puede registrar</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/{hash}/{email}</route>
        [HttpPost("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Crear([FromBody] Servicio servicio, string hash, string email)
        {
            ServiciosServicio.Crear(servicio, hash, email);
            return StatusCode(201);
        }

        /// <summary>
        /// Leer información de un servicio turístico para turista
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="infoProveedor">Bandera que indica si se retorna o no la información del proveedor</param>
        /// <returns>200 - Información del servicio turístico</returns>
        [HttpGet("t/{id}")]
        public async Task<IActionResult> LeerTurista(int id)
        {
            return StatusCode(200, new { datos = await ServiciosServicio.Leer(id, true, true) });
        }

        /// <summary>
        /// Leer información de un servicio turístico para administrador
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="infoProveedor">Bandera que indica si se retorna o no la información del proveedor</param>
        /// <param name="estado">Estado del servicio turístico</param>
        /// <returns>200 . Información del servicio turístico</returns>
        [HttpGet("a/{id}/{estado}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public async Task<IActionResult> LeerAdministrador(int id, bool estado)
        {
            return StatusCode(200, new { datos = await ServiciosServicio.Leer(id, true, estado) });
        }

        /// <summary>
        /// Leer servicios turísticos pertenecientes a un proveedor
        /// </summary>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>        
        /// <returns>200 - Lista de servicios turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay servicios turísticos asociados al proveedor</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/{hash}/{email}</route>
        [HttpGet("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Leer(string hash, string email)
        {
            return StatusCode(200, new { listaServicios = ServiciosServicio.Leer(hash, email) });
        }

        /// <summary>
        /// Leer servicio turístico filtrado por ID y proveedor
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>200 - Información del servicio turístico</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/{id}/{hash}/{email}</route>
        [HttpGet("{id}/{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Leer(int id, string hash, string email)
        {
            return StatusCode(200, new { servicio = ServiciosServicio.Leer(id, hash, email) });
        }

        /// <summary>
        /// Leer servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <returns>Datos del servicio</returns>
        [HttpGet("{id}")]
        public IActionResult Leer(int id)
        {
            return StatusCode(200, new { servicio = ServiciosServicio.Leer(id) });
        }

        /// <summary>
        /// Leer servicios turísticos paginados filtrados por el estado de habilitado
        /// </summary>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de servicios que se desean ver por página</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>200 - Información paginada de servicios turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay servicios turísticos</exception>
        /// <route>/api/servicio/pag/{pagina}/{cantidad}/{estado}</route>
        [HttpGet("pag/{pagina}/{cantidad}/{estado}")]
        [Authorize]
        [CustomAuthorizationFilter("all")]
        public IActionResult Leer(short pagina, short cantidad, bool estado)
        {
            return StatusCode(200, new { informacion = ServiciosServicio.Leer(pagina, cantidad, estado) });
        }

        /// <summary>
        /// Leer servicios turísticos paginados filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de servicios turísticos a mostrar</param>
        /// <returns>200 - Información paginada de servicios turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay servicios turísticos</exception>
        [HttpPost("pag/{pagina}/{cantidad}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Leer([FromBody] Busqueda parametros, short pagina, short cantidad)
        {
            return StatusCode(200, new { informacion = ServiciosServicio.Leer(parametros, pagina, cantidad) });
        }

        /// <summary>
        /// Leer serivicios turísticos paginados filtrados para turistas
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de servicios turísticos a mostrar</param>
        /// <returns>200 - Información paginada de servicios turísticos</returns>
        /// <exception cref="NoContentException">204 - No hay servicios turísticos</exception>
        [HttpPost("pag/t/{pagina}/{cantidad}")]
        public IActionResult LeerPaginado([FromBody] Busqueda parametros, short pagina, short cantidad)
        {
            parametros.Estado = true;
            return StatusCode(200, new { informacion = ServiciosServicio.Leer(parametros, pagina, cantidad) });
        }

        /// <summary>
        /// Actualizar la información de servicio turístico
        /// </summary>
        /// <param name="servicio">Datos del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>200 - Información del servicio turístico actualizada correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/{hash}/{email}</route>
        [HttpPut("{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Actualizar([FromBody] Servicio servicio, string hash, string email)
        {
            ServiciosServicio.Actualizar(servicio, hash, email);
            return StatusCode(200);
        }

        /// <summary>
        /// Actualizar imágenes de servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="imagenes">Colección de imágenes</param>
        /// <returns>200 - Información de imágenes de servicio turístico actualizada correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">401- La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/imagenes/{id}/{hash}/{email}</route>
        [HttpPut("imagenes/{id}/{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Actualizar(int id, string hash, string email)
        {
            IFormFileCollection listaImagenes = Request.Form.Files;
            ServiciosServicio.Actualizar(id, hash, email, listaImagenes);
            return StatusCode(200);
        }

        /// <summary>
        /// Actualizar estado de habilitado de servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <returns>200 - Servicio turístico actualizado correctamente</returns>
        [HttpGet("habilitado/{id}")]
        [Authorize]
        [CustomAuthorizationFilter("administrador")]
        public IActionResult Actualizar(int id)
        {
            ServiciosServicio.Actualizar(id);
            return StatusCode(200);
        }

        /// <summary>
        /// Eliminar servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail</param>
        /// <returns>204 - Servicio turístico eliminado correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>      
        /// <route>/api/servicio/{id}/{hash}/{email}</route>
        [HttpDelete("{id}/{hash}/{email}")]
        [Authorize]
        [CustomAuthorizationFilter("proveedor")]
        public IActionResult Eliminar(int id, string hash, string email)
        {
            ServiciosServicio.Eliminar(id, hash, email);
            return StatusCode(204);
        }

        /// <summary>
        /// Eliminar imagen de un servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="direccionImagen">URL de la imagen</param>
        /// <returns>204 - Imagen de servicio turístico eliminada correctamente</returns>
        /// <exception cref="NotFoundException">404 - No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">401 - La información del proveedor es corrupta</exception>
        /// <route>/api/servicio/imagenes/{id}/{hash}/{email}/{direccionImagen}</route>
        [HttpDelete("imagenes/{id}/{hash}/{email}/{direccionImagen}")]
        public IActionResult Eliminar(int id, string hash, string email, string direccionImagen)
        {
            ServiciosServicio.Eliminar(id, hash, email, direccionImagen);
            return StatusCode(204);
        }

    }
}
