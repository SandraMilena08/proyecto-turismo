// Librerías
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entidades.Oferta
{

    // Entidad servicio
    [Serializable]
    [Table("servicios", Schema = "oferta_turistica")]
    public class Servicio : OfertaTuristica
    {

    }
}
