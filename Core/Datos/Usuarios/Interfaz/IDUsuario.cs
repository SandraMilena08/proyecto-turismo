// Librerías
using Datos.Generica.Interfaz;
using Entidades.Usuarios;
using System.Threading.Tasks;

namespace Datos.Usuarios.Interfaz
{

    // Interfaz de la capa de datos de usuario
    public interface IDUsuario<T> : IDGenerica<T> where T : Usuario
    {

        // Métodos

        // Leer usuario filtrado por id
        public T Leer(short id);

        // Leer usuario filtrado por correo electrónico
        public T Leer(string email);

        // Leer usuario filtrado por correo electrónico y clave
        public T Leer(string email, string clave);

        // Leer usuario filtrado por hash
        public T LeerHash(string hash);

        /// <summary>
        /// Leer usuario verificado filtrado por E-mail
        /// </summary>
        /// <param name="email">E-mail del usuario</param>
        /// <returns>Datos del usuario</returns>
        public T LeerVerificado(string email);

        // Leer usuario filtrado por hash y correo electrónico
        public T LeerAuth(string hash, string email);

        // Actualizar usuario
        public void Actualizar(T usuario);

        // Actualizar información personal del usuario
        public void Actualizar(T usuario, T usuarioActualizar);

        // Cantidad de usuarios con un correo electrónico
        public Task<int> CantidadEmail(string email);

        /// <summary>
        /// Cantidad de usuarios con un correo electrónico
        /// </summary>
        /// <param name="email">E-mail del usuario</param>
        /// <returns>Cantidad de usuarios</returns>
        public int CantidadEmailSync(string email);

    }
}
