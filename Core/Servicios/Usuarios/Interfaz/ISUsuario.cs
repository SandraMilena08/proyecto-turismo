// Librerías
using Entidades.Usuarios;
using System.Threading.Tasks;

namespace Servicios.Usuarios.Interfaz
{

    // Interfaz de la capa de servicios de usuario
    public interface ISUsuario<T> where T : Usuario
    {

        // Métodos

        // Crear usuario
        public Task Crear(T usuario);

        // Leer usuario filtrado por hash
        public T Leer(string hash);

        // Actualizar usuario
        public object ActualizarDatosPersonales(T usuario);

        // Validar la integridad de un correo electrónico
        public Task<bool> ValidarEmail(string email);

    }
}
