// Librerías
using Datos.Generica.Interfaz;
using Entidades.Seguridad;

namespace Datos.Seguridad.Interfaz
{

    // Interfaz de la capa de datos de recuperar cuenta
    public interface IDRecuperarCuenta : IDGenerica<RecuperarCuenta>
    {

        // Métodos

        // Leer registro de recuperar cuenta filtrado por hash
        public RecuperarCuenta Leer(string hash);

        // Leer registro de recuperar cuenta filtrado por correo electrónico
        public RecuperarCuenta LeerEmail(string email);

        // Eliminar registro de recuperar cuenta
        public void Eliminar(RecuperarCuenta datos);

        // Cantidad de registros filtrados por email
        public int CantidadEmail(string email);

    }
}
