// Librerías
using Datos.Recomendacion.Interfaz;
using Entidades.Oferta;
using Entidades.Recomendacion;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Datos.Recomendacion
{

    // Capa de datos de puntuación de servicio
    public class DPuntuacionServicio : DPuntuacion<PuntuacionServicio>, IDPuntuacionServicio
    {

        // Constructor
        public DPuntuacionServicio(PostgreSQLContext _context) : base(_context) { }

        // Métodos        

        /// <summary>
        /// Leer registro de puntuación de servicio turístico filtrado por ID de servicio turístico y E-mail del turista
        /// </summary>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <param name="email">E-mail del turista</param>
        /// <returns>Información del registro de puntuación</returns>
        public override PuntuacionServicio Leer(int servicioId, string email)
        {
            return DbContext.PuntuacionServicio.SingleOrDefault(x => x.ServicioId == servicioId && x.Email.Equals(email) && x.Calificado == false);
        }

        /// <summary>
        /// Obtener la lista de serivicios turísticos filtrados por municipio y por un rango de fecha de puntuación
        /// </summary>
        /// <param name="municipio">Nombre del municipio</param>
        /// <param name="fecha">Fecha</param>
        /// <returns>Lista servicios turísticos</returns>
        public List<Servicio> Leer(string municipio, DateTime fecha)
        {
            return (from s in DbContext.Servicio
                    from ps in DbContext.PuntuacionServicio
                    where ps.Calificado == true &&
                    s.Id == ps.ServicioId &&
                    s.Municipio.Equals(municipio) &&
                    ps.FechaCalificacion >= fecha && ps.FechaCalificacion < fecha.AddMonths(1)
                    select s).ToList();
        }

        /// <summary>
        /// Obtener la lista de puntuaciones de un servicio turístico
        /// </summary>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <returns>Lista de registros de puntuación</returns>
        public List<double> Leer(int servicioId)
        {
            return DbContext.PuntuacionServicio.Where(x => x.ServicioId == servicioId && x.Calificado == true).Select(x => x.Calificacion.Value).ToList();
        }

        /// <summary>
        /// Cantidad de veces que se calificaron servicios turísticos en un municipio
        /// </summary>
        /// <param name="fecha">Mes y año establecido</param>
        /// <param name="municipio">Nombre del municipio</param>
        /// <returns>Cantidad de veces</returns>
        public int Cantidad(DateTime fecha, string municipio)
        {
            return (from s in DbContext.Servicio
                    from ps in DbContext.PuntuacionServicio
                    where ps.Calificado == true &&
                    s.Id == ps.ServicioId &&
                    s.Municipio.Equals(municipio) &&
                    ps.FechaCalificacion >= fecha && ps.FechaCalificacion < fecha.AddMonths(1)
                    select ps).Count();
        }

        /// <summary>
        /// Obtener la cantidad de veces que se puntuó un servicio turístico en un rango de fechas
        /// </summary>
        /// <param name="fecha">Mes de calificación</param>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <returns>Cantidad</returns>
        public override int Cantidad(DateTime fecha, int servicioId)
        {
            return DbContext.PuntuacionServicio.Count(x => x.Calificado == true && x.ServicioId == servicioId && x.FechaCalificacion >= fecha && x.FechaCalificacion < fecha.AddMonths(1));
        }

        /// <summary>
        /// Cantidad de registros de puntuación filtrado por ID de servicio turístico y E-mail del turista
        /// </summary>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <param name="email">E-mail del turista</param>
        /// <returns>Cantidad de registros</returns>
        public override int Cantidad(int servicioId, string email)
        {
            return DbContext.PuntuacionServicio.Count(x => x.ServicioId == servicioId && x.Email.Equals(email));
        }

        /// <summary>
        /// 
        /// </summary>        
        /// <param name="categoria">Categoría de los planes o servicios turísticos</param>
        /// <param name="poblacion">Nombre de la población a evaluar</param>
        /// <param name="fecha">Rango de fecha a buscar</param>
        /// <returns>Datos</returns>
        public override int Cantidad(string categoria, string poblacion, DateTime fecha)
        {
            return (from t in DbContext.Turista
                    from s in DbContext.Servicio
                    from ps in DbContext.PuntuacionServicio
                    where
                    ps.Calificado == true &&
                    ps.FechaCalificacion >= fecha && ps.FechaCalificacion < fecha.AddMonths(1) &&
                    t.Id == ps.TuristaId &&
                    t.Poblacion.Equals(poblacion) &&
                    s.Id == ps.ServicioId &&
                    s.Categoria.Equals(categoria)
                    select ps).Count();
        }

    }
}
