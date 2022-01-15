// Librerías
using Datos.Generica;
using Datos.Usuarios.Interfaz;
using Entidades.Usuarios;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace Datos.Usuarios
{

    // Capa de datos de usuario
    public class DUsuario<T> : DGenerica<T>, IDUsuario<T> where T : Usuario
    {

        // Constructor
        public DUsuario(PostgreSQLContext _context) : base(_context) { }

        // Métodos

        // Leer usuario filtrado por id
        public T Leer(short id)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.Id == id);
        }

        // Leer usuario filtrado por correo electrónico
        public T Leer(string email)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.CorreoElectronico.Equals(email));
        }

        // Leer usuario filtrado por correo electrónico y clave
        public T Leer(string email, string clave)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.CorreoElectronico.Equals(email) && x.Clave.Equals(clave));
        }

        // Leer usuario filtrado por hash
        public T LeerHash(string hash)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.Hash.Equals(hash));
        }

        /// <summary>
        /// Leer usuario filtrado por hash y e-mail
        /// </summary>
        /// <param name="hash">Hash del usuario</param>
        /// <param name="email">E-mail del usuario</param>
        /// <returns></returns>
        public T LeerAuth(string hash, string email)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.Hash.Equals(hash) && x.CorreoElectronico.Equals(email));
        }

        /// <summary>
        /// Leer usuario verificado filtrado por E-mail
        /// </summary>
        /// <param name="email">E-mail del usuario</param>
        /// <returns>Datos del usuario</returns>
        public T LeerVerificado(string email)
        {
            return DbContext.Set<T>().SingleOrDefault(x => x.CorreoElectronico.Equals(email) && x.Verificado == true);
        }

        // Actualizar usuario
        public void Actualizar(T usuario)
        {
            DbContext.Entry(usuario).State = EntityState.Modified;
            DbContext.SaveChanges();
        }

        // Actualizar la información personal de un usuario
        public void Actualizar(T usuario, T usuarioActualizar)
        {
            DbContext.Entry(usuarioActualizar).CurrentValues.SetValues(usuario);
            DbContext.SaveChanges();
        }

        /// <summary>
        /// Cantidad de usuarios con un correo electrónico
        /// </summary>
        /// <param name="email">E-mail del usuario</param>
        /// <returns>Cantidad de usuarios</returns>
        public Task<int> CantidadEmail(string email)
        {
            return DbContext.Set<T>().CountAsync(x => x.CorreoElectronico.Equals(email));
        }

        /// <summary>
        /// Cantidad de usuarios con un correo electrónico
        /// </summary>
        /// <param name="email">E-mail del usuario</param>
        /// <returns>Cantidad de usuarios</returns>
        public int CantidadEmailSync(string email)
        {
            return DbContext.Set<T>().Count(x => x.CorreoElectronico.Equals(email));
        }

    }
}
