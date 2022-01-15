// Librerías
using Datos.Generica.Interfaz;
using Entidades.Usuarios;

namespace Datos.Usuarios.Interfaz
{

    // Interfaz de la capa de datos de pre registro
    public interface IDPreRegistro : IDGenerica<PreRegistro>
    {

        // Métodos

        // Leer un pre registro filtrado por correo electrónico
        public PreRegistro Leer(string email);

        // Leer un pre registro filtrado por hash
        public PreRegistro LeerHash(string hash);

        // Eliminar un pre registro
        public void Eliminar(PreRegistro preRegistro);

    }
}
