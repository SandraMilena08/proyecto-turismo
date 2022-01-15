// Librerías
using Datos.Recomendacion.Interfaz;
using Entidades.Oferta;
using Entidades.Recomendacion;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Datos.Recomendacion
{

    // Capa de datos de puntuación de plan
    public class DPuntuacionPlan : DPuntuacion<PuntuacionPlan>, IDPuntuacionPlan
    {

        // Constructor
        public DPuntuacionPlan(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        /*
         * Leer registro de puntuación filtrado por correo electrónico de turista y ID del plan turístico
         * planId - ID del plan turístico
         * email - Correo electrónico del turista asociado al registro de puntuación
         */
        public override PuntuacionPlan Leer(int planId, string email)
        {
            return DbContext.PuntuacionPlan.SingleOrDefault(x => x.PlanId == planId && x.Email.Equals(email) && x.Calificado == false);
        }

        /// <summary>
        /// Obtener la lista de serivicios turísticos filtrados por municipio y por un rango de fecha de puntuación
        /// </summary>
        /// <param name="municipio">Nombre del municipio</param>
        /// <param name="fecha">Fecha</param>
        /// <returns>Lista servicios turísticos</returns>
        public List<Plan> Leer(string municipio, DateTime fecha)
        {
            return (from p in DbContext.Plan
                    from pp in DbContext.PuntuacionPlan
                    where pp.Calificado == true &&
                    p.Id == pp.PlanId &&
                    p.Municipio.Equals(municipio) &&
                    pp.FechaCalificacion >= fecha && pp.FechaCalificacion < fecha.AddMonths(1)
                    select p).ToList();
        }

        /// <summary>
        /// Obtener la lista de registros de puntuación calificados de un plan turístico
        /// </summary>
        /// <param name="planId">ID del plan turístico</param>
        /// <returns>Lista de registros de puntuación</returns>
        public List<double> Leer(int planId)
        {
            return DbContext.PuntuacionPlan.Where(x => x.PlanId == planId && x.Calificado == true).Select(x => x.Calificacion.Value).ToList();
        }

        /// <summary>
        /// Cantidad de veces que se calificaron planes turísticos en un municipio
        /// </summary>
        /// <param name="fecha">Mes y año establecido</param>
        /// <param name="municipio">Nombre del municipio</param>
        /// <returns>Cantidad de veces</returns>
        public int Cantidad(DateTime fecha, string municipio)
        {
            return (from p in DbContext.Plan
                    from pp in DbContext.PuntuacionPlan
                    where pp.Calificado == true &&
                    p.Id == pp.PlanId &&
                    p.Municipio.Equals(municipio) &&
                    pp.FechaCalificacion >= fecha && pp.FechaCalificacion < fecha.AddMonths(1)
                    select pp).Count();
        }

        /// <summary>
        /// Obtener la cantidad de veces que se puntuó un plan turístico en un rango de fechas
        /// </summary>
        /// <param name="fecha">Mes de calificación</param>
        /// <param name="planId">ID del plan turístico</param>
        /// <returns>Cantidad</returns>
        public override int Cantidad(DateTime fecha, int planId)
        {
            return DbContext.PuntuacionPlan.Count(x => x.Calificado == true && x.PlanId == planId && x.FechaCalificacion >= fecha && x.FechaCalificacion < fecha.AddMonths(1));
        }

        /*
         * Cantidad de registros de puntuación filtrados por correo electrónico de tursita y ID del plan turístico
         * planId - ID del plan turístico
         * email - Correo electrónico del turista asociado al registro de puntuación
         */
        public override int Cantidad(int planId, string email)
        {
            return DbContext.PuntuacionPlan.Count(x => x.PlanId == planId && x.Email.Equals(email));
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
                    from p in DbContext.Plan
                    from pp in DbContext.PuntuacionPlan
                    where
                    pp.Calificado == true &&
                    pp.FechaCalificacion >= fecha && pp.FechaCalificacion < fecha.AddMonths(1) &&
                    t.Id == pp.TuristaId &&
                    t.Poblacion.Equals(poblacion) &&
                    p.Id == pp.PlanId &&
                    p.Categoria.Equals(categoria)
                    select pp).Count();
        }

    }
}
