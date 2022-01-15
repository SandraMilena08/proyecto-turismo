// Librerías
using Datos.Generica.Interfaz;
using Entidades.Recomendacion;
using System;

namespace Datos.Recomendacion.Interfaz
{

    // Interfaz de la capa de datos de puntuación
    public interface IDPuntuacion<T> : IDGenerica<T> where T : Puntuacion
    {

        // Métodos

        /*
         * Leer registro de puntuación filtrado por correo electrónico de turista y ID del plan o servicio turístico
         * ofertaTuristicaId - ID del plan o servicio turístico
         * email - Correo electrónico del turista asociado al registro de puntuación
         */
        public T Leer(int ofertaTuristicaId, string email);

        /// <summary>
        /// Actualizar registro de puntuación de plan o servicio turístico
        /// </summary>
        /// <param name="puntuacion">Datos de la puntuación</param>
        public void Actualizar(T puntuacion);

        /*
         * Cantidad de registros de puntuación filtrados por correo electrónico de tursita y ID del plan o servicio turístico
         * ofertaTuristicaId - ID del plan o servicio turístico
         * email - Correo electrónico del turista asociado al registro de puntuación
         */
        public int Cantidad(int ofertaTuristicaId, string email);

        /// <summary>
        /// Obtener la cantidad de veces que se puntuó un plan o servicio turístico en un rango de fechas
        /// </summary>
        /// <param name="fecha">Mes de calificación</param>
        /// <param name="servicioId">ID del plan o servicio turístico</param>
        /// <returns>Cantidad</returns>
        public int Cantidad(DateTime fecha, int ofertaTuristicaId);

        /// <summary>
        /// 
        /// </summary>        
        /// <param name="categoria">Categoría de los planes o servicios turísticos</param>
        /// <param name="poblacion">Nombre de la población a evaluar</param>
        /// <param name="fecha">Rango de fecha a buscar</param>
        /// <returns>Datos</returns>
        public int Cantidad(string categoria, string poblacion, DateTime fecha);

    }
}
