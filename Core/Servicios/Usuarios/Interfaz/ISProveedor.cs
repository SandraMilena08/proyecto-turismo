// Librerías
using Entidades.Usuarios;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Usuarios.Interfaz
{

    // Interfaz de la capa de servicios de proveedor
    public interface ISProveedor : ISUsuario<Proveedor>
    {

        // Métodos

        // Actualizar icono
        public object ActualizarIcono(IFormFile imagen, string hash, string email);

        // Actualizar estado de habilitado de un proveedor
        public void ActualizarEstado(string hash);

        // Leer proveedores paginados filtrados por estado de habilitado
        public Paginado<Proveedor> LeerEstadoHabilitado(short pagina, short cantidad, bool estado);

        /// <summary>
        /// Leer proveedores paginados filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <param name="pagina">Indice de la pagina</param>
        /// <param name="cantidad">Cantidad de proveedores a mostrar</param>
        /// <returns>Datos de paginación de proveedores</returns>
        public Paginado<Proveedor> Leer(BusquedaProveedor parametros, short pagina, short cantidad);

        // Validar la integridad de un nit
        public Task<bool> ValidarNit(string nit);

    }
}
