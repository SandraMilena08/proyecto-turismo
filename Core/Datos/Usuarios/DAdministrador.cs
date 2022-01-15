// Librerías
using Datos.Usuarios.Interfaz;
using Entidades.Usuarios;

namespace Datos.Usuarios
{

    // Capa de datos de administrador
    public class DAdministrador : DUsuario<Administrador>, IDAdministrador
    {

        // Constructor
        public DAdministrador(PostgreSQLContext _context) : base(_context) { }

        // Métodos

    }
}
