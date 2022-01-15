// Librerías
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Usuarios
{

    // Entidad usuario
    [Serializable]
    public class Usuario
    {

        // Variables

        [Key]
        [Column("id")]
        public short Id { get; set; }

        [Column("nombre")]
        public string Nombre { get; set; }

        [Column("icono")]
        public string Icono { get; set; }

        [Column("correo_electronico")]
        public string CorreoElectronico { get; set; }

        [Column("clave")]
        public string Clave { get; set; }

        [Column("hash")]
        public string Hash { get; set; }

        [Column("verificado")]
        public bool Verificado { get; set; }

    }
}
