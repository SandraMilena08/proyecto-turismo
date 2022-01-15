// Librerías
using Datos.Usuarios.Interfaz;
using Entidades.Usuarios;

namespace Datos.Usuarios
{

    // Capa de datos de turista
    public class DTurista : DUsuario<Turista>, IDTurista
    {

        // Constructor
        public DTurista(PostgreSQLContext _context) : base(_context) { }

        // Métodos

    }
}
