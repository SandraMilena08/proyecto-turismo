// Librerías
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Usuarios
{

    // Entidad administrador
    [Serializable]
    [Table("administradores", Schema = "usuario")]
    public class Administrador : Usuario
    {

        // Variables

        [Column("apellido")]
        public string Apellido { get; set; }

    }
}
