// Librerías
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Usuarios
{

    // Entidad turista
    [Serializable]
    [Table("turistas", Schema = "usuario")]
    public class Turista : Usuario
    {

        // Variables

        [Column("apellido")]
        public string Apellido { get; set; }

        [Column("fecha_nacimiento")]
        public DateTime FechaNacimiento { get; set; }

        [Column("poblacion")]
        public string Poblacion { get; set; }

    }
}
