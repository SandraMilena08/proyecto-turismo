// Librerías
using Datos.Generica;
using Datos.Seguridad.Interfaz;
using Entidades.Seguridad;
using System.Linq;

namespace Datos.Seguridad
{

    // Capa de datos de recuperar cuenta
    public class DRecuperarCuenta : DGenerica<RecuperarCuenta>, IDRecuperarCuenta
    {

        // Constructor
        public DRecuperarCuenta(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        // Leer registro de recuperar cuenta filtrado por hash
        public RecuperarCuenta Leer(string hash)
        {
            return DbContext.RecuperarCuenta.SingleOrDefault(x => x.Hash.Equals(hash));
        }

        // Leer registro de recuperar cuenta filtrado por correo electrónico
        public RecuperarCuenta LeerEmail(string email)
        {
            return DbContext.RecuperarCuenta.SingleOrDefault(x => x.CorreoElectronico.Equals(email));
        }

        // Eliminar registro de recuperar cuenta
        public void Eliminar(RecuperarCuenta datos)
        {
            DbContext.RecuperarCuenta.Remove(datos);
            DbContext.SaveChanges();
        }

        // Cantidad de registros filtrados por email
        public int CantidadEmail(string email)
        {
            return DbContext.RecuperarCuenta.Count(x => x.CorreoElectronico.Equals(email));
        }

    }
}
