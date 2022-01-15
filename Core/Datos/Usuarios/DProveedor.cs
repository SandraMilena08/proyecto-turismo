// Librerías
using Datos.Usuarios.Interfaz;
using Entidades.Usuarios;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos.Usuarios
{

    // Capa de datos de proveedor
    public class DProveedor : DUsuario<Proveedor>, IDProveedor
    {

        // Constructor
        public DProveedor(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        /// <summary>
        /// Leer proveedor filtrado por ID asíncrono
        /// </summary>
        /// <param name="id">ID del proveedor</param>
        /// <returns>Información del proveedor</returns>
        public Task<Proveedor> LeerAsync(short id)
        {
            return DbContext.Proveedor.SingleOrDefaultAsync(x => x.Id == id);
        }

        // Leer proveedor filtrado por nit y clave
        public Proveedor LeerLogin(string nit, string clave)
        {
            return DbContext.Proveedor.SingleOrDefault(x => x.Nit.Equals(nit) && x.Clave.Equals(clave));
        }

        // Leer el estado de habilitado de un proveedor
        public bool LeerHabilitado(string hash, string email)
        {
            return DbContext.Proveedor.Where(x => x.Hash.Equals(hash) && x.CorreoElectronico.Equals(email)).Select(x => x.Habilitado).SingleOrDefault();
        }

        // Leer lista de proveedores paginada filtrada por estado de habilitado
        public List<Proveedor> LeerEstadoHabilitado(short pagina, short cantidad, bool estado)
        {
            return DbContext.Proveedor.Where(x => x.Habilitado == estado).OrderBy(x => x.Id).Skip(pagina).Take(cantidad).ToList();
        }

        /// <summary>
        /// Leer proveedores paginados filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de proveedores a mostrar</param>
        /// <returns>Lista de proveedores</returns>
        public List<Proveedor> Leer(BusquedaProveedor parametros, short pagina, short cantidad)
        {
            return DbContext.Proveedor.AsEnumerable().Where(x =>
                x.Nombre.ToLower().Contains(parametros.Nombre.ToLower()) && // Filtro por nombre
                x.Nit.Contains(parametros.Nit) && // Filtro por nit
                x.Habilitado == parametros.Estado && // Filtro por estado de habilitado
                parametros.Municipios.Any(m => x.Municipio.Contains(m)) // Filtro por municipio
            ).OrderBy(x => x.Id).Skip(pagina * cantidad).Take(cantidad).ToList();
        }

        // Cantidad de proveedores con un nit
        public Task<int> CantidadNit(string nit)
        {
            return DbContext.Proveedor.CountAsync(x => x.Nit.Equals(nit));
        }

        // Cantidad de proveedores con un estado de habilitado
        public int CantidadEstadoHabilitado(bool estado)
        {
            return DbContext.Proveedor.Count(x => x.Habilitado == estado);
        }

        /// <summary>
        /// Cantidad de proveedores filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <returns>Cantidad de proveedores</returns>
        public int Cantidad(BusquedaProveedor parametros)
        {
            return DbContext.Proveedor.AsEnumerable().Count(x =>
                x.Nombre.ToLower().Contains(parametros.Nombre.ToLower()) && // Filtro por nombre
                x.Nit.Contains(parametros.Nit) && // Filtro por nit
                x.Habilitado == parametros.Estado && // Filtro por estado de habilitado
                parametros.Municipios.Any(m => x.Municipio.Contains(m)) // Filtro por municipio
            );
        }

    }
}
