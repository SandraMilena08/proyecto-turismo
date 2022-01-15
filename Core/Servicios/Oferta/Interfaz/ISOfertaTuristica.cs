// Librerías
using Entidades.Oferta;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Oferta.Interfaz
{

    // Interfaz de la capa de servicios de oferta turística
    public interface ISOfertaTuristica<T> where T : OfertaTuristica
    {

        // Métodos

        // Crear plan ó servicio
        public void Crear(T ofertaTuristica, string hash, string email);

        /// <summary>
        /// Obtener datos de un plan o servicio turístico y la información de proveedor
        /// </summary>
        /// <param name="otId">ID del plan o servicio turístico</param>
        /// <param name="infoProveedor">Bandera para saber si se trae la información del proveedor</param>        
        /// <param name="estado">Estado de habilitado del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public Task<object> Leer(int otId, bool infoProveedor, bool estado);

        // Leer planes o servicios turísticos de un proveedor
        public List<T> Leer(string hash, string email);

        // Leer planes o servicios turísticos paginados filtrados por el estado de habilitado
        public Paginado<T> Leer(short pagina, short cantidad, bool estado);

        /// <summary>
        /// Leer planes o servicios turísticos paginados filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes o servicios turísticos a mostrar</param>
        /// <returns></returns>
        public Paginado<T> Leer(Busqueda parametros, short pagina, short cantidad);

        // Leer plan ó servicio
        public T Leer(int id, string hash, string email);

        /// <summary>
        /// Leer plan o servicio turístico
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public T Leer(int id);

        // Actualizar servicio ó plan turístico
        public void Actualizar(T ofertaTuristica, string hash, string email);

        // Actualizar imágenes de servicio ó plan turístico
        public void Actualizar(int id, string hash, string email, IFormFileCollection imagenes);

        /// <summary>
        /// Actualizar estado de habilitado de un plan o servicio turístico
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        public void Actualizar(int id);

        // Eliminar servicio turístico
        public void Eliminar(int id, string hash, string email);

        // Eliminar imagen de un servicio ó plan turístico
        public void Eliminar(int id, string hash, string email, string imagen);

    }
}
