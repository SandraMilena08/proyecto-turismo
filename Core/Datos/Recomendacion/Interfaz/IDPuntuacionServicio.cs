// Librerías
using Entidades.Oferta;
using Entidades.Recomendacion;
using System;
using System.Collections.Generic;

namespace Datos.Recomendacion.Interfaz
{

    // Interfaz de la capa de datos de puntuación de servicio
    public interface IDPuntuacionServicio : IDPuntuacion<PuntuacionServicio>
    {

        // Métodos

        /// <summary>
        /// Obtener la lista de serivicios turísticos filtrados por municipio y por un rango de fecha de puntuación
        /// </summary>
        /// <param name="municipio">Nombre del municipio</param>
        /// <param name="fecha">Fecha</param>
        /// <returns>Lista servicios turísticos</returns>
        public List<Servicio> Leer(string municipio, DateTime fecha);

        /// <summary>
        /// Obtener la lista de puntuaciones de un servicio turístico
        /// </summary>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <returns>Lista de registros de puntuación</returns>
        public List<double> Leer(int servicioId);

        /// <summary>
        /// Cantidad de veces que se calificaron servicios turísticos en un municipio
        /// </summary>
        /// <param name="fecha">Mes y año establecido</param>
        /// <param name="municipio">Nombre del municipio</param>
        /// <returns>Cantidad de veces</returns>
        public int Cantidad(DateTime fecha, string municipio);

    }
}
