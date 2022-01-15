// Librerías
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Seguridad
{

    // Entidad de supervisión de usuario
    [Table("supervisiones_usuarios", Schema = "seguridad")]
    public class SupervisionUsuario
    {

        // Variables
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column("token")]
        public string Token { get; set; }
        [Column("rol")]
        public string Rol { get; set; }
        [Column("correo_electronico")]
        public string CorreoElectronico { get; set; }
        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; }

        // Constructor
        public SupervisionUsuario() { }

        public SupervisionUsuario(string token, string rol, string email, DateTime fecha)
        {
            Token = token;
            Rol = rol;
            CorreoElectronico = email;
            FechaCreacion = fecha;
        }

    }
}
