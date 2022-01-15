// Librerías
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Oferta
{

    // Entidad oferta turística
    [Serializable]
    public class OfertaTuristica
    {

        // Variables

        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("nombre")]
        public string Nombre { get; set; }

        [Column("informacion")]
        public string Informacion { get; set; }

        [Column("precio")]
        public double Precio { get; set; }

        [Column("puntuacion")]
        public double Puntuacion { get; set; }

        [Column("imagen", TypeName = "json")]
        public string Imagen { get; set; }

        [Column("municipio")]
        public string Municipio { get; set; }

        [Column("volumen_ingreso")]
        public string VolumenIngreso { get; set; }

        [Column("categoria")]
        public string Categoria { get; set; }

        [Column("fecha_creacion")]
        public DateTime FechaCreacion { get; set; }

        [Column("proveedor_id")]
        public short ProveedorId { get; set; }

        [Column("habilitado")]
        public bool Habilitado { get; set; }

        [Column("eliminado")]
        public bool Eliminado { get; set; }

        [Column("admin_deshabilito")]
        public bool AdminDeshabilito { get; set; }

    }
}
