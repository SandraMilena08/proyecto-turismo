// Librerías
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Oferta
{

    // Entidad plan
    [Serializable]
    [Table("planes", Schema = "oferta_turistica")]
    public class Plan : OfertaTuristica
    {

        // Variables

        [Column("actividades", TypeName = "json")]
        public string Actividades { get; set; }

        [NotMapped]
        public List<string> ListaActividades { get; set; }

    }
}
