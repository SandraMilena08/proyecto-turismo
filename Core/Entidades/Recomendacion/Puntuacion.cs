// Librerías
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Recomendacion
{

    // Entidad puntuación
    [Serializable]
    public class Puntuacion
    {

        // Variables

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("calificacion")]
        public double? Calificacion { get; set; }

        [Column("correo_electronico")]
        public string Email { get; set; }

        [Column("calificado")]
        public bool Calificado { get; set; }

        [Column("fecha_calificacion")]
        public DateTime? FechaCalificacion { get; set; }

        [Column("turista_id")]
        public short? TuristaId { get; set; }

    }
}
