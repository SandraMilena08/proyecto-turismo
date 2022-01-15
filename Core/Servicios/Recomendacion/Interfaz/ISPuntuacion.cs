// Librerías
using Entidades.Recomendacion;

namespace Servicios.Recomendacion.Interfaz
{

    // Interfaz de la capa de servicios de puntuación
    public interface ISPuntuacion<T> where T : Puntuacion
    {

        // Métodos

        // Crear registro de puntuación de plan o servicio turístico
        public void Crear(T puntuacion, string hash, string email);

        /// <summary>
        /// Puntuar plan o servicio turístico
        /// </summary>
        /// <param name="ofertaTuristicaId">ID del plan o servicio turístico</param>
        /// <param name="email">E-mail del usuario que puntua el plan o servicio turístico</param>
        /// <param name="puntuacion">Puntuación dada por el usuario</param>
        public void PuntuarOfertaTuristica(int ofertaTuristicaId, string email, double puntuacion);

    }
}
