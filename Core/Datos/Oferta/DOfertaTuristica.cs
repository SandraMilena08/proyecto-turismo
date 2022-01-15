// Librerías
using Datos.Generica;
using Datos.Oferta.Interfaz;
using Entidades.Oferta;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos.Oferta
{

    // Capa de datos de oferta turística
    public class DOfertaTuristica<T> : DGenerica<T>, IDOfertaTuristica<T> where T : OfertaTuristica
    {

        // Constructor
        public DOfertaTuristica(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        /// <summary>
        /// Leer plan o servicio turístico filtrado por ID
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public T Leer(int id)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.Id == id && x.Eliminado == false);
        }

        /// <summary>
        /// Leer plan o servicio turístico filtrado por ID y estado de habilitado
        /// </summary>
        /// <param name="id">ID del servicio turístico</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public T Leer(int id, bool estado)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.Id == id && x.Habilitado == estado && x.Eliminado == false);
        }

        /// <summary>
        /// Leer planes o servicios turísticos de un proveedor
        /// </summary>
        /// <param name="proveedorId">ID del proveedor</param>        
        /// <returns>Lista de planes o servicios turístico</returns>
        public List<T> Leer(short proveedorId)
        {
            return DbContext.Set<T>().Where(x => x.ProveedorId == proveedorId && x.Eliminado == false).OrderBy(x => x.Id).ToList();
        }

        /// <summary>
        /// Leer plan o servicio turístico filtrado por id y proveedor
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <param name="proveedorId">ID del proveedor propietario del plan o servicio turístico</param>
        /// <returns>Datos del plan o servicio turístico</returns>
        public T Leer(int id, short proveedorId)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.Id == id && x.ProveedorId == proveedorId && x.Eliminado == false);
        }

        /// <summary>
        /// Leer planes o servicios turísticos paginados filtrados por el estado de habilitado
        /// </summary>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes o servicios turísticos a mostrar</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Lista de planes o servicios turísticos</returns>
        public List<T> Leer(short pagina, short cantidad, bool estado)
        {
            return DbContext.Set<T>().Where(x => x.Habilitado == estado && x.Eliminado == false).OrderBy(x => x.Id).Skip(pagina * cantidad).Take(cantidad).ToList();
        }

        /// <summary>
        /// Leer planes o servicios turísticos filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes o servicios turísticos a mostrar</param>
        /// <returns></returns>
        public List<T> Leer(Busqueda parametros, short pagina, short cantidad)
        {
            return DbContext.Set<T>().AsEnumerable().Where(x =>
                x.Nombre.ToLower().Contains(parametros.Nombre.ToLower()) && // Filtro por nombre de plan o servicio turístico
                parametros.Municipios.Any(m => x.Municipio.Contains(m)) && // Filtro por municipios
                parametros.Categorias.Any(c => x.Categoria.Contains(c)) && // Filtro por categorías
                (x.Puntuacion >= parametros.Puntuaciones[0] && x.Puntuacion <= parametros.Puntuaciones[1]) && // Filtro por puntuaciones
                x.Habilitado == parametros.Estado && // Filtro por estado de habilitado
                (x.Precio >= parametros.Precios[0] && x.Precio <= parametros.Precios[1]) // Filtro por precio
            ).OrderBy(x => x.Id).Skip(pagina * cantidad).Take(cantidad).ToList();
        }

        /// <summary>
        /// Leer máximo 6 planes o servicios turísticos de un proveedor de manera asíncrona
        /// </summary>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Lista de planes o servicios turísticos</returns>
        public Task<List<T>> LeerAsync(short proveedorId)
        {
            return DbContext.Set<T>().Where(x => x.ProveedorId == proveedorId && x.Habilitado == true && x.Eliminado == false).OrderBy(x => x.Id).Take(6).ToListAsync();
        }

        /// <summary>
        /// Leer máximo 6 planes o servicios turísticos de un proveedor de manera asíncrona 
        /// </summary>
        /// <param name="id">ID del servicio turístico que se debe obviar</param>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Lista de planes o servicios turísticos</returns>
        public Task<List<T>> LeerAsync(int id, short proveedorId)
        {
            return DbContext.Set<T>().Where(x => x.ProveedorId == proveedorId && x.Id != id && x.Habilitado == true && x.Eliminado == false).OrderBy(x => x.Id).Take(6).ToListAsync();
        }

        /// <summary>
        /// Obtener el estado de habilitado de un proveedor
        /// </summary>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Estado de habilitado</returns>
        public bool LeerEstadoHabilitadoProveedor(short proveedorId)
        {
            return DbContext.Proveedor.Where(x => x.Id == proveedorId).Select(x => x.Habilitado).SingleOrDefault();
        }

        /// <summary>
        /// Actualizar información de plan o servicio turístico
        /// </summary>
        /// <param name="ofertaTuristica">Datos del plan o servicio turístico</param>
        public void Actualizar(T ofertaTuristica)
        {
            DbContext.Entry(ofertaTuristica).State = EntityState.Modified;
            DbContext.SaveChanges();
        }

        // Eliminar servicio ó plan
        public void Eliminar(T ofertaTuristica)
        {
            DbContext.Set<T>().Remove(ofertaTuristica);
            DbContext.SaveChanges();
        }

        /// <summary>
        /// Leer cantidad de planes o servicios turísticos asociados a un proveedor
        /// </summary>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Cantidad de planes o servicios turísticos asociados al proveedor</returns>
        public int Cantidad(short proveedorId)
        {
            return DbContext.Set<T>().Count(x => x.ProveedorId == proveedorId && x.Eliminado == false);
        }

        /// <summary>
        /// Cantidad de planes o servicios turísticos filtrados por ID y proveedor
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <returns>Cantidad de planes o servicios turísticos</returns>
        public int Cantidad(int id, short proveedorId)
        {
            return DbContext.Set<T>().Count(x => x.Id == id && x.ProveedorId == proveedorId && x.Eliminado == false);
        }

        /// <summary>
        /// Cantidad de planes o servicios turísticos filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <returns>Cantidad de planes o servicios turísticos</returns>
        public int Cantidad(Busqueda parametros)
        {
            return DbContext.Set<T>().AsEnumerable().Count(x =>
                    x.Nombre.ToLower().Contains(parametros.Nombre.ToLower()) && // Filtro por nombre de plan o servicio turístico
                    parametros.Municipios.Any(m => x.Municipio.Contains(m)) && // Filtro por municipios
                    parametros.Categorias.Any(c => x.Categoria.Contains(c)) && // Filtro por categorías
                    (x.Puntuacion >= parametros.Puntuaciones[0] && x.Puntuacion <= parametros.Puntuaciones[1]) && // Filtro por puntuaciones
                    x.Habilitado == parametros.Estado && // Filtro por estado de habilitado
                    (x.Precio >= parametros.Precios[0] && x.Precio <= parametros.Precios[1]) // Filtro por precio
                );
        }

        /// <summary>
        /// Cantidad de planes o servicios turísticos filtrados por estado de habilitado
        /// </summary>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Cantidad de planes o servicios turísticos con el estado</returns>
        public int CantidadEstadoHabilitado(bool estado)
        {
            return DbContext.Set<T>().Count(x => x.Habilitado == estado && x.Eliminado == false);
        }

        /// <summary>
        /// Cantidad de planes o servicios turísticos filtrados por proveedor y estado de habilitado
        /// </summary>
        /// <param name="id">ID del plan o servicio turístico</param>
        /// <param name="proveedorId">ID del proveedor</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Cantidad de planes o servicios turísticos</returns>
        public int CantidadEstadoHabilitado(int id, short proveedorId, bool estado)
        {
            return DbContext.Set<T>().Count(x => x.Id == id && x.ProveedorId == proveedorId && x.Habilitado == estado && x.Eliminado == false);
        }

    }
}
