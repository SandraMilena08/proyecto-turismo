// Librerías
using Datos.Oferta.Interfaz;
using Entidades.Oferta;

namespace Datos.Oferta
{

    // Capa de datos de planes
    public class DPlan : DOfertaTuristica<Plan>, IDPlan
    {

        // Constructor
        public DPlan(PostgreSQLContext _context) : base(_context) { }

        // Métodos

    }
}
