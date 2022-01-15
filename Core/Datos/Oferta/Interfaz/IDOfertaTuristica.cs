// Librerías
using Datos.Generica.Interfaz;
using Entidades.Oferta;
using System.Collections.Generic;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos.Oferta.Interfaz
{

    // Interfaz de la capa de datos de oferta turística
    public interface IDOfertaTuristica<T> : IDGenerica<T> where T : OfertaTuristica
    {

        // Métodos        

        /// <summary>
        /// Leer plan o servicio turístico filtrado por ID
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public T Leer(int id);

        /// <summary>
        /// Leer plan o servicio turístico filtrado por ID y estado de habilitado
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public T Leer(int id, bool estado);

        // Leer servicios o planes de un proveedor
        public List<T> Leer(short proveedorId);

        // Leer servicio ó plan
        public T Leer(int id, short proveedorId);

        // Leer planes y servicios paginados filtrados por estado
        public List<T> Leer(short pagina, short cantidad, bool estado);

        /// <summary>
        /// Leer máximo 5 planes o servicios turísticos de un proveedor de manera asíncrona
        /// </summary>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Lista de planes o servicios turísticos</returns>
        public Task<List<T>> LeerAsync(short proveedorId);

        /// <summary>
        /// Leer máximo 5 planes o servicios turísticos de un proveedor de manera asíncrona 
        /// </summary>
        /// <param name="id">ID del servicio turístico que se debe obviar</param>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Lista de planes o servicios turísticos</returns>
        public Task<List<T>> LeerAsync(int id, short proveedorId);

        /// <summary>
        /// Obtener el estado de habilitado de un proveedor
        /// </summary>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Estado de habilitado</returns>
        public bool LeerEstadoHabilitadoProveedor(short proveedorId);

        /// <summary>
        /// Leer planes o servicios turísticos filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <returns></returns>
        public List<T> Leer(Busqueda parametros, short pagina, short cantidad);

        // Actualizar servicio ó plan
        public void Actualizar(T ofertaTuristica);

        // Eliminiar servicio ó plan
        public void Eliminar(T ofertaTuristica);

        // Cantidad de servicios ó planes de un proveedor
        public int Cantidad(short proveedorId);

        // Cantidad de servicios ó planes con un id perteneciente a un proveedor
        public int Cantidad(int id, short proveedorId);

        /// <summary>
        /// Cantidad de planes o servicios turísticos filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <returns>Cantidad de planes o servicios turísticos</returns>
        public int Cantidad(Busqueda parametros);

        // Cantidad de servicios ó planes turísticos con un estado de habilitado
        public int CantidadEstadoHabilitado(bool estado);

        /// <summary>
        /// Cantidad de planes o servicios turísticos filtrados por proveedor y estado de habilitado
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Cantidad de planes o servicios turísticos</returns>
        public int CantidadEstadoHabilitado(int id, short proveedorId, bool estado);

    }
}
