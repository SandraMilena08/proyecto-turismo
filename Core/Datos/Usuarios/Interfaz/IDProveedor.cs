// Librerías
using Entidades.Usuarios;
using System.Collections.Generic;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos.Usuarios.Interfaz
{

    // Interfaz de la capa de datos de proveedor
    public interface IDProveedor : IDUsuario<Proveedor>
    {

        // Métodos

        /// <summary>
        /// Leer proveedor filtrado por ID asíncrono
        /// </summary>
        /// <param name="id">ID del proveedor</param>
        /// <returns>Información del proveedor</returns>
        public Task<Proveedor> LeerAsync(short id);

        // Leer proveedor filtrado por nit y clave
        public Proveedor LeerLogin(string nit, string clave);

        // Leer el estado de habilitado de un proveedor
        public bool LeerHabilitado(string hash, string email);

        // Leer lista de proveedores paginada filtrada por estado de habilitado
        public List<Proveedor> LeerEstadoHabilitado(short pagina, short cantidad, bool estado);

        /// <summary>
        /// Leer proveedores paginados filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de proveedores a mostrar</param>
        /// <returns>Lista de proveedores</returns>
        public List<Proveedor> Leer(BusquedaProveedor parametros, short pagina, short cantidad);

        // Cantidad de proveedores con un nit
        public Task<int> CantidadNit(string nit);

        // Cantidad de proveedores con un estado de habilitado
        public int CantidadEstadoHabilitado(bool estado);

        /// <summary>
        /// Cantidad de proveedores filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <returns>Cantidad de proveedores</returns>
        public int Cantidad(BusquedaProveedor parametros);


    }
}
