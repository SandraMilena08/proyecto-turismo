// Librerías
using Entidades.Usuarios;

namespace Servicios.Usuarios.Interfaz
{

    // Interfaz de la capa de servicios de turista
    public interface ISTurista : ISUsuario<Turista>
    {

        // Métodos

        /// <summary>
        /// Verificar la existencia de turista a partir de un E-mail
        /// </summary>
        /// <param name="email">E-mail a verificar</param>
        /// <returns>True - Si el e-mail existe | False - Si el e-mail NO existe</returns>
        public bool VerificarExistencia(string email);

    }
}
