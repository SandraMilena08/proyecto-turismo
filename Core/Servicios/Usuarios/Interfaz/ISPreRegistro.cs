// Librerías
using System.Threading.Tasks;

namespace Servicios.Usuarios.Interfaz
{

    // Interfaz de la capa de servicios de pre registro
    public interface ISPreRegistro
    {

        // Métodos

        // Reenviar código de verificación
        public Task ReenviarCodigo(string email);

        // Validar código de verificación
        public void ValidarCodigo(string hash);

    }
}
