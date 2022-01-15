// Librerías
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Usuarios
{

    // Entidad proveedor
    [Serializable]
    [Table("proveedores", Schema = "usuario")]
    public class Proveedor : Usuario
    {

        // Variables

        [Column("nit")]
        public string Nit { get; set; }

        [Column("municipio")]
        public string Municipio { get; set; }

        [Column("direccion")]
        public string Direccion { get; set; }

        [Column("telefono")]
        public string Telefono { get; set; }

        [Column("habilitado")]
        public bool Habilitado { get; set; }

    }
}
