// Librerías
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Recomendacion
{

    // Entidad puntuación servicio
    [Serializable]
    [Table("puntuaciones_servicios", Schema = "recomendacion")]
    public class PuntuacionServicio : Puntuacion
    {

        // Variables

        [Column("servicio_id")]
        public int ServicioId { get; set; }

    }
}
