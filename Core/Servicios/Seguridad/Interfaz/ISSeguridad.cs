// Librerías
using Utilitarios;

namespace Servicios.Seguridad.Interfaz
{

    // Interfáz de la capa de servicios de seguridad
    public interface ISSeguridad
    {

        // Iniciar sesión
        public object IniciarSesion(Login datos, bool encriptarClave);

    }
}
