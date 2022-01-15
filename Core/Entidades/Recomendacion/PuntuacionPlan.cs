// Librerías
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Recomendacion
{

    // Entidad puntuación plan
    [Serializable]
    [Table("puntuaciones_planes", Schema = "recomendacion")]
    public class PuntuacionPlan : Puntuacion
    {

        // Variables

        [Column("plan_id")]
        public int PlanId { get; set; }

    }
}
