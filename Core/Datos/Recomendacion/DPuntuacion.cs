// Librerías
using Datos.Generica;
using Datos.Recomendacion.Interfaz;
using Entidades.Recomendacion;
using Microsoft.EntityFrameworkCore;
using System;

namespace Datos.Recomendacion
{

    // Capa de datos de puntuación
    public abstract class DPuntuacion<T> : DGenerica<T>, IDPuntuacion<T> where T : Puntuacion
    {

        // Constructor
        public DPuntuacion(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        /*
         * Leer registro de puntuación filtrado por correo electrónico de turista y ID del plan o servicio turístico
         * ofertaTuristicaId - ID del plan o servicio turístico
         * email - Correo electrónico del turista asociado al registro de puntuación
         */
        public abstract T Leer(int ofertaTuristicaId, string email);

        /// <summary>
        /// Actualizar registro de puntuación de plan o servicio turístico
        /// </summary>
        /// <param name="puntuacion">Datos de la puntuación</param>
        public void Actualizar(T puntuacion)
        {
            DbContext.Entry(puntuacion).State = EntityState.Modified;
            DbContext.SaveChanges();
        }

        /*
         * Cantidad de registros de puntuación filtrados por correo electrónico de tursita y ID del plan o servicio turístico
         * ofertaTuristicaId - ID del plan o servicio turístico
         * email - Correo electrónico del turista asociado al registro de puntuación
         */
        public abstract int Cantidad(int ofertaTuristicaId, string email);

        /// <summary>
        /// Obtener la cantidad de veces que se puntuó un plan o servicio turístico en un rango de fechas
        /// </summary>
        /// <param name="fecha">Mes de calificación</param>
        /// <param name="servicioId">ID del plan o servicio turístico</param>
        /// <returns>Cantidad</returns>
        public abstract int Cantidad(DateTime fecha, int ofertaTuristicaId);

        /// <summary>
        /// 
        /// </summary>        
        /// <param name="categoria">Categoría de los planes o servicios turísticos</param>
        /// <param name="poblacion">Nombre de la población a evaluar</param>
        /// <param name="fecha">Rango de fecha a buscar</param>
        /// <returns>Datos</returns>
        public abstract int Cantidad(string categoria, string poblacion, DateTime fecha);

    }
}
