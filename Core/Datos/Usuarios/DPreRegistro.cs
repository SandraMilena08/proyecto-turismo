// Librerías
using Datos.Generica;
using Datos.Usuarios.Interfaz;
using Entidades.Usuarios;
using System.Linq;

namespace Datos.Usuarios
{

    // Capa de datos de pre registro
    public class DPreRegistro : DGenerica<PreRegistro>, IDPreRegistro
    {

        // Constructor
        public DPreRegistro(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        // Leer un pre registro filtrado por correo electrónico
        public PreRegistro Leer(string email)
        {
            return DbContext.PreRegistro.SingleOrDefault(x => x.CorreoElectronico.Equals(email));
        }

        // Leer un pre registro filtrado por hash
        public PreRegistro LeerHash(string hash)
        {
            return DbContext.PreRegistro.SingleOrDefault(x => x.Hash.Equals(hash));
        }

        // Eliminar un pre registro
        public void Eliminar(PreRegistro preRegistro)
        {
            DbContext.PreRegistro.Remove(preRegistro);
            DbContext.SaveChanges();
        }

    }
}
