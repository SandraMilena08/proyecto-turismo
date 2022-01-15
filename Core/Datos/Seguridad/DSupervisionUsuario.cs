// Librerías
using Datos.Generica;
using Datos.Seguridad.Interfaz;
using Entidades.Seguridad;
using System.Linq;

namespace Datos.Seguridad
{

    // Capa de datos de supervisión de usuario
    public class DSupervisionUsuario : DGenerica<SupervisionUsuario>, IDSupervisionUsuario
    {

        // Constructor
        public DSupervisionUsuario(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        // Leer un registro filtrado por correo electrónico
        public SupervisionUsuario Leer(string email)
        {
            return DbContext.SupervisionUsuario.SingleOrDefault(x => x.CorreoElectronico.Equals(email));
        }

        // Borrar registro de supervisión de usuario
        public void Eliminar(SupervisionUsuario supervisionUsuario)
        {
            DbContext.SupervisionUsuario.Remove(supervisionUsuario);
            DbContext.SaveChanges();
        }

        // Cantidad de registros filtrado por el correo electrónico del usuario
        public int CantidadEmail(string email)
        {
            return DbContext.SupervisionUsuario.Count(x => x.CorreoElectronico.Equals(email));
        }

    }
}
