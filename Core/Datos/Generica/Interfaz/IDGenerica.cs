// Librerías

namespace Datos.Generica.Interfaz
{

    // Interfaz de la capa de datos de genérica
    public interface IDGenerica<T> where T : class
    {

        // Métodos

        // Crear registro
        public T Crear(T t);

    }
}
