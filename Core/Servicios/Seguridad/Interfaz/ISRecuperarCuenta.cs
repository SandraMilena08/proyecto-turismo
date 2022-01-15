// Librerías
using System.Threading.Tasks;

namespace Servicios.Seguridad.Interfaz
{

    // Interfaz de la capa de servicios de recuperar cuenta
    public interface ISRecuperarCuenta
    {

        // Métodos

        // Crear solicitud de recuperar cuenta
        public Task Crear(string email, string rol);

        // Cambiar la clave del usuario
        public void CambiarClave(string hash, string clave);

        // Reenviar código de recuperar cuenta
        public Task ReenviarCodigo(string email);

    }
}
