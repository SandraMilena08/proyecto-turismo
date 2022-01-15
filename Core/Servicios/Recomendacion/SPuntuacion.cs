// Libreríass
using Datos;
using Entidades.Recomendacion;
using Microsoft.Extensions.Configuration;
using Servicios.Generica;
using Servicios.Recomendacion.Interfaz;

namespace Servicios.Recomendacion
{

    // Capa de servicios de puntuación
    public abstract class SPuntuacion<T> : SGenerica, ISPuntuacion<T> where T : Puntuacion
    {

        // Constructor
        public SPuntuacion(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration) { }

        // Métodos

        // Crear registro de puntuación de plan o servicio turístico
        public abstract void Crear(T puntuacion, string hash, string email);

        /// <summary>
        /// Puntuar plan o servicio turístico
        /// </summary>
        /// <param name="ofertaTuristicaId">ID del plan o servicio turístico</param>
        /// <param name="email">E-mail del usuario que puntua el plan o servicio turístico</param>
        /// <param name="puntuacion">Puntuación dada por el usuario</param>
        public abstract void PuntuarOfertaTuristica(int ofertaTuristicaId, string email, double puntuacion);

    }
}
