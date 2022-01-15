// Librerías
using Datos;
using Datos.Usuarios;
using Entidades.Oferta;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Servicios.Generica;
using Servicios.Oferta.Interfaz;
using System.Collections.Generic;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Oferta
{

    // Capa de servicios de oferta turística
    public abstract class SOfertaTuristica<T> : SGenerica, ISOfertaTuristica<T> where T : OfertaTuristica
    {

        // Variables

        // Cantidad máxima de planes o servicios turísticos que un proveedor puede agregar
        protected const short MAX_OFERTAS_TURISTICAS = 30;

        protected IWebHostEnvironment HostEnvironment;

        // Constructor
        public SOfertaTuristica(PostgreSQLContext _context) : base(_context) { }

        public SOfertaTuristica(PostgreSQLContext _context, IWebHostEnvironment _hostEnvironment) : base(_context)
        {
            HostEnvironment = _hostEnvironment;
        }

        // Métodos

        // Crear servicio ó plan
        public abstract void Crear(T ofertaTuristica, string hash, string email);

        /// <summary>
        /// Obtener datos de un plan o servicio turístico y la información de proveedor
        /// </summary>
        /// <param name="otId">ID del plan o servicio turístico</param>
        /// <param name="infoProveedor">Bandera para saber si se trae la información del proveedor</param>        
        /// <param name="estado">Estado de habilitado del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public abstract Task<object> Leer(int otId, bool infoProveedor, bool estado);

        // Leer planes o servicios turísticos de un proveedor
        public abstract List<T> Leer(string hash, string email);

        // Leer servicio ó plan
        public abstract T Leer(int id, string hash, string email);

        // Leer planes o servicios turísticos paginados filtrados por el estado de habilitado
        public abstract Paginado<T> Leer(short pagina, short cantidad, bool estado);

        /// <summary>
        /// Leer planes o servicios turísticos paginados filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes o servicios turísticos a mostrar</param>
        /// <returns></returns>
        public abstract Paginado<T> Leer(Busqueda parametros, short pagina, short cantidad);

        /// <summary>
        /// Leer plan o servicio turístico
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public abstract T Leer(int id);

        // Actualizar servicio ó plan
        public abstract void Actualizar(T ofertaTuristica, string hash, string email);

        // Actualizar imágenes de servicio ó plan
        public abstract void Actualizar(int id, string hash, string email, IFormFileCollection imagenes);

        /// <summary>
        /// Actualizar estado de habilitado de un plan o servicio turístico
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        public abstract void Actualizar(int id);

        // Eliminar servicio ó plan
        public abstract void Eliminar(int id, string hash, string email);

        /// <summary>
        /// Leer datos de un proveedor filtrado por hash y E-mail
        /// </summary>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>Datos del proveedor</returns>
        /// <exception cref="UnauthorizedException">No se encontró el proveedor</exception>
        public Proveedor LeerProveedor(string hash, string email)
        {

            Proveedor proveedor = new DProveedor(DbContext).LeerAuth(hash, email); // Obteniendo la información del proveedor

            // Validando si la información llegó la información del proveedor
            if (proveedor == null)
                throw new UnauthorizedException("No se envió la información correctamente");

            return proveedor; // Retornando la información del proveedor

        }

        // Eliminar imagen de un servicio ó plan turístico
        public abstract void Eliminar(int id, string hash, string email, string imagen);
    }
}
