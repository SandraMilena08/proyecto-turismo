// Librerías
using Entidades.Oferta;
using Entidades.Recomendacion;
using System;
using System.Collections.Generic;

namespace Datos.Recomendacion.Interfaz
{

    // Interfaz de la capa de datos de puntuación de plan
    public interface IDPuntuacionPlan : IDPuntuacion<PuntuacionPlan>
    {

        // Métodos

        /// <summary>
        /// Obtener la lista de planes turísticos filtrados por municipio y por un rango de fecha de puntuación
        /// </summary>
        /// <param name="municipio">Nombre del municipio</param>
        /// <param name="fecha">Fecha</param>
        /// <returns>Lista planes turísticos</returns>
        public List<Plan> Leer(string municipio, DateTime fecha);

        /// <summary>
        /// Obtener la lista de puntuaciones de un plan turístico
        /// </summary>
        /// <param name="planId">ID del plan turístico</param>
        /// <returns>Lista de puntuaciones</returns>
        public List<double> Leer(int planId);

        /// <summary>
        /// Cantidad de veces que se calificaron planes turísticos en un municipio
        /// </summary>
        /// <param name="fecha">Mes y año establecido</param>
        /// <param name="municipio">Nombre del municipio</param>
        /// <returns>Cantidad de veces</returns>
        public int Cantidad(DateTime fecha, string municipio);

    }
}
