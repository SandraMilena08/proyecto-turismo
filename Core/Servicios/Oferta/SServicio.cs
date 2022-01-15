// Librerías
using Datos;
using Datos.Oferta;
using Datos.Usuarios;
using Entidades.Oferta;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Servicios.Extras;
using Servicios.Oferta.Interfaz;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Oferta
{

    // Capa de servicios de servicios
    public class SServicio : SOfertaTuristica<Servicio>, ISServicio
    {

        // Variables        

        // Métodos de la capa de datos de servicio turístico
        private DServicio DatosServicio { get; }

        // Constructor        

        public SServicio(PostgreSQLContext _context, IWebHostEnvironment _hostEnvironment) : base(_context, _hostEnvironment)
        {
            DatosServicio = new DServicio(_context);
        }

        // Métodos

        /// <summary>
        /// Almacenar servicio turístico
        /// </summary>
        /// <param name="servicio">Datos del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>        
        /// <exception cref="IntegridadException">El proveedor excedió el número de servicios turísticos que puede registrar</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Crear(Servicio servicio, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor            

            // Verificando la cantidad de servicios turísticos asociados al proveedor
            if (DatosServicio.Cantidad(proveedor.Id) >= MAX_OFERTAS_TURISTICAS)
                throw new IntegridadException("Puedes crear un máximo de " + MAX_OFERTAS_TURISTICAS + " servicios turísticos");

            // Estableciendo información inicial del servicio turístico
            servicio.Imagen = JsonSerializer.Serialize(new List<string> { "no-photo.svg" });
            servicio.Puntuacion = 0;
            servicio.FechaCreacion = DateTime.Now;
            servicio.ProveedorId = proveedor.Id;
            servicio.Habilitado = true;
            servicio.Eliminado = false;
            servicio.AdminDeshabilito = false;

            DatosServicio.Crear(servicio); // Guardando el servicio turístico en la BD            

        }

        /// <summary>
        /// Obtener datos de un servicio turístico y la información de proveedor
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="infoProveedor">Bandera para saber si se trae la información del proveedor</param>        
        /// <param name="estado">Estado del servicio turístico</param>
        /// <returns>Datos del servicio turístico</returns>
        public override async Task<object> Leer(int id, bool infoProveedor, bool estado)
        {

            Servicio servicio = DatosServicio.Leer(id, estado); // Obtener los datos del servicio turístico

            // Verificar si el servicio turístico existe
            if (servicio == null)
                throw new NotFoundException("No se encontró el servicio turístico");

            if (infoProveedor == true) // Verificar si se desea retornar información del proveedor
            {

                Proveedor proveedor = await new DProveedor(DbContext).LeerAsync(servicio.ProveedorId); // Se obtiene la información del proveedor
                proveedor.Hash = null;
                proveedor.Clave = null;                
                List<Plan> listaPlanes = await new DPlan(DbContext).LeerAsync(servicio.ProveedorId); // Se obtiene la lista de planes turísticos del proveedor
                List<Servicio> listaServicios = await DatosServicio.LeerAsync(servicio.Id, servicio.ProveedorId); // Se obtiene la lista de servicios turísticos del proveedor

                return new { servicio, proveedor, listaPlanes, listaServicios };

            }

            return new { servicio };

        }

        /// <summary>
        /// Leer servicios turísticos pertenecientes a un proveedor
        /// </summary>
        /// <param name="hash">Hash del proveedo</param>
        /// <param name="email">E-mail del proveedor</param>        
        /// <returns>Lista de servicios turísticos</returns>
        /// <exception cref="NoContentException">No hay servicios turísticos asociados al proveedor</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override List<Servicio> Leer(string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            List<Servicio> listaServicios = DatosServicio.Leer(proveedor.Id); // Obtener los servicios turísticos del proveedor

            // Verificando si hay servicios turísticos
            if (listaServicios.Count == 0)
                throw new NoContentException("No hay servicios turísticos registrados");

            return listaServicios; // Retornando la lista de servicios turísticos            

        }

        /// <summary>
        /// Leer servicio turístico filtrado por ID y proveedor
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>Información del servicio turístico</returns>
        /// <exception cref="NotFoundException">No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override Servicio Leer(int id, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Servicio servicio = DatosServicio.Leer(id, proveedor.Id); // Obteniendo la información del servicio turístico

            // Verificando si hay un servicio turístico
            if (servicio == null)
                throw new NotFoundException("No se encontró el servicio turístico");

            return servicio; // Retornando la información del servicio turístico            

        }

        /// <summary>
        /// Leer servicios turísticos paginados filtrados por el estado de habilitado
        /// </summary>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de servicios que se desean ver por página</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Información paginada de servicios turísticos</returns>
        /// <exception cref="NoContentException">No hay servicios turísticos</exception>
        public override Paginado<Servicio> Leer(short pagina, short cantidad, bool estado)
        {

            List<Servicio> listaServicios = DatosServicio.Leer(pagina, cantidad, estado); // Obteniendo lista de servicios turísticos paginados

            // Validando si hay servicios turísticos para mostrar
            if (listaServicios.Count == 0)
                throw new NoContentException("No hay servicios turísticos");

            // Inicializando la información del objeto paginado
            Paginado<Servicio> paginado = new()
            {
                Contenido = listaServicios,
                PaginaActual = pagina,
                TotalItems = DatosServicio.CantidadEstadoHabilitado(estado)
            };

            paginado.TotalPaginas = Math.Ceiling((decimal)((double)paginado.TotalItems / (double)cantidad)); // Calculando la cantidad de páginas totales

            return paginado; // Retornando la información de paginación

        }

        /// <summary>
        /// Leer planes o servicios turísticos paginados filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes o servicios turísticos a mostrar</param>
        /// <returns>Información paginada de servicios turísticos</returns>
        /// <exception cref="NoContentException">No hay servicios turísticos</exception>
        public override Paginado<Servicio> Leer(Busqueda parametros, short pagina, short cantidad)
        {

            List<Servicio> listaServicios = DatosServicio.Leer(parametros, pagina, cantidad); // Obteniendo los servicios turísticos filtrados

            // Verificando si hay servicios turístico para mostrar
            if (listaServicios.Count == 0)
                throw new NoContentException("No se encontrarón servicios turísticos");

            // Declarando objeto de pagináción con sus correspondientes datos
            Paginado<Servicio> paginado = new()
            {
                Contenido = listaServicios,
                PaginaActual = (short)(pagina + 1),
                TotalItems = DatosServicio.Cantidad(parametros)
            };

            paginado.TotalPaginas = Math.Ceiling((decimal)((double)paginado.TotalItems / (double)cantidad)); // Calculando la cantidad de páginas totales

            return paginado; // Rertornando información paginada

        }

        /// <summary>
        /// Leer servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <returns>Datos del servicio turístico</returns>
        public override Servicio Leer(int id)
        {
            Servicio servicio = DatosServicio.Leer(id);

            if (servicio == null)
                throw new NotFoundException("No se encontró el servicio turístico");

            return servicio;
        }

        /// <summary>
        /// Actualizar la información de servicio turístico
        /// </summary>
        /// <param name="servicio">Datos del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <exception cref="NotFoundException">No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Actualizar(Servicio servicio, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            // Validando la existencia del servicio turístico
            if (DatosServicio.Cantidad(servicio.Id, proveedor.Id) != 1)
                throw new NotFoundException("No se encontró el servicio turístico");

            DatosServicio.Actualizar(servicio); // Actualizando la información del servicio turístico            

        }

        /// <summary>
        /// Actualizar imágenes de servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="imagenes">Colección de imágenes</param>
        /// <exception cref="NotFoundException">No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Actualizar(int id, string hash, string email, IFormFileCollection imagenes)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Servicio servicio = DatosServicio.Leer(id, proveedor.Id); // Obteniendo la información del servicio turístico

            // Verificando la existencia del servicio turístico
            if (servicio == null)
                throw new NotFoundException("No se encontró el servicio turístico");

            servicio.Imagen = new SImagen(HostEnvironment).CargarImagenes(proveedor, "Servicio", imagenes, servicio); // Actualizando la información de imagen del servicio turístico

            DatosServicio.Actualizar(servicio); // Actualizando la información del servicio turístico            

        }

        /// <summary>
        /// Actualizar estado de habilitado de servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        public override void Actualizar(int id)
        {

            Servicio servicio = DatosServicio.Leer(id); // Obtener la información del servicio turístico solicitado

            // Verificar la existencia del servicio turístico
            if (servicio == null)
                throw new NotFoundException("No se encontró el servicio turístico");

            // Verificar el estado de habilitado del proveedor asociado al servicio turístico
            if (DatosServicio.LeerEstadoHabilitadoProveedor(servicio.ProveedorId) == false)
                throw new BadRequestException("No se puede habilitar el servicio turístico de un proveedor deshabilitado");

            servicio.Habilitado = !servicio.Habilitado;
            servicio.AdminDeshabilito = !servicio.AdminDeshabilito;

            DatosServicio.Actualizar(servicio);

        }

        /// <summary>
        /// Eliminar servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail</param>
        /// <exception cref="NotFoundException">No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Eliminar(int id, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Servicio servicio = DatosServicio.Leer(id, proveedor.Id); // Obteniendo la información del servicio turístico

            // Verificando la existencia del servicio turístico
            if (servicio == null)
                throw new NotFoundException("No se encontró el servicio turístico");

            // Estableciendo el valor de los campos habilitado y eliminado del servicio turístico
            servicio.Habilitado = false;
            servicio.Eliminado = true;

            DatosServicio.Actualizar(servicio); // Actualizando la información del servicio turístico            

        }

        /// <summary>
        /// Eliminar imagen de un servicio turístico
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="direccionImagen">URL de la imagen</param>
        /// <exception cref="NotFoundException">No se encontró el servicio turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Eliminar(int id, string hash, string email, string direccionImagen)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Servicio servicio = DatosServicio.Leer(id, proveedor.Id); // Obteniendo la información del servicio turístico

            // Inicializando la información de imagen
            Imagen datosImagen = new()
            {
                Direccion = direccionImagen.Replace("_", "\\"),
                Tipo = "Servicio"
            };

            List<string> listaImagenes = JsonSerializer.Deserialize<List<string>>(servicio.Imagen); // Obteniendo lista de imágenes del servicio turístico

            // Recorriendo la lista de imágenes y eliminando la imagen correspondiente
            for (short i = 0; i < listaImagenes.Count; i++)
                if (listaImagenes[i].Equals(datosImagen.Direccion))
                {
                    listaImagenes.RemoveAt(i);
                    break;
                }

            // Validando si la lista de imágenes quedó vacia e inicializando la imagen por defecto
            if (listaImagenes.Count == 0)
                listaImagenes.Add("no-photo.svg");

            servicio.Imagen = JsonSerializer.Serialize(listaImagenes); // Convirtiendo a JSON la lista de imágenes del servicio turístico

            DatosServicio.Actualizar(servicio); // Actualizando la información del servicio turístico

            new SImagen(HostEnvironment).Eliminar(datosImagen); // Eliminando la imagen del servidor            

        }

    }
}
