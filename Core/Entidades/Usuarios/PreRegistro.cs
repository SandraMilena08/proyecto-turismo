// Librerías
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Usuarios
{

    // Entidad pre registro
    [Serializable]
    [Table("pre_registros", Schema = "usuario")]
    public class PreRegistro
    {

        // Variables

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; }

        [Column("correo_electronico")]
        public string CorreoElectronico { get; set; }

        [Column("hash")]
        public string Hash { get; set; }

        [Column("rol")]
        public string Rol { get; set; }

        // Constructor
        public PreRegistro() { }

        // Constructor con parámetros
        public PreRegistro(string email, string hash, string rol)
        {
            CorreoElectronico = email;
            Hash = hash;
            Rol = rol;
            FechaCreacion = DateTime.Now;
        }

    }
}
