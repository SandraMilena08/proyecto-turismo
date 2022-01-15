// Librerías
using Datos;
using Microsoft.Extensions.Configuration;

namespace Servicios.Generica
{

    // Capa de servicios de genérica
    public abstract class SGenerica
    {

        // Variables
        public PostgreSQLContext DbContext { get; set; }
        public IConfiguration Configuration { get; set; }

        // Constructor
        public SGenerica(PostgreSQLContext _context)
        {
            DbContext = _context;
        }

        public SGenerica(PostgreSQLContext _context, IConfiguration _configuration)
        {
            DbContext = _context;
            Configuration = _configuration;
        }

    }
}
