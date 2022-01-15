// Librerías
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Seguridad
{

    // Clase recuperar cuenta
    [Serializable]
    [Table("recuperar_cuentas", Schema = "seguridad")]
    public class RecuperarCuenta
    {

        // Variables

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("rol")]
        public string Rol { get; set; }

        [Column("hash")]
        public string Hash { get; set; }

        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; }

        [Column("correo_electronico")]
        public string CorreoElectronico { get; set; }

    }
}
