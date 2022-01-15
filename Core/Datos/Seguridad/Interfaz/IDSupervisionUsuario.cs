// Librerías
using Datos.Generica.Interfaz;
using Entidades.Seguridad;

namespace Datos.Seguridad.Interfaz
{

    // Interfáz de la capa de datos de supervisión de usuario
    public interface IDSupervisionUsuario : IDGenerica<SupervisionUsuario>
    {

        // Métodos

        // Leer un registro filtrado por correo electrónico
        public SupervisionUsuario Leer(string email);

        // Borrar registro de supervisión de usuario
        public void Eliminar(SupervisionUsuario supervisionUsuario);

        // Cantidad de registros filtrado por el correo electrónico del usuario
        public int CantidadEmail(string email);

    }
}
