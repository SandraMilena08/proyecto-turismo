// Librerías
using Datos.Generica.Interfaz;

namespace Datos.Generica
{

    // Capa de datos de genérica
    public class DGenerica<T> : IDGenerica<T> where T : class
    {

        // Variables
        public PostgreSQLContext DbContext { get; }

        // Constructor
        public DGenerica(PostgreSQLContext _dbContext)
        {
            DbContext = _dbContext;
        }

        // Métodos

        /// <summary>
        /// Guardar registro en la BD
        /// </summary>
        /// <param name="t">Datos del registro</param>
        /// <returns>La información del registro</returns>
        public T Crear(T t)
        {
            DbContext.Set<T>().Add(t);
            DbContext.SaveChanges();
            return t;
        }

    }
}
