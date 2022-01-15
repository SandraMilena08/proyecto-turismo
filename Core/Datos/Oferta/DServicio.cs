// Librerías
using Datos.Oferta.Interfaz;
using Entidades.Oferta;

namespace Datos.Oferta
{

    // Capa de datos de servicios
    public class DServicio : DOfertaTuristica<Servicio>, IDServicio
    {

        // Constructor
        public DServicio(PostgreSQLContext _context) : base(_context) { }

        // Métodos

    }
}
