// Librerías
using Datos;
using Datos.Usuarios;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Servicios.Seguridad;
using Servicios.Usuarios.Interfaz;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Usuarios
{

    // Capa de servicios de administrador
    public class SAdministrador : SUsuario<Administrador>, ISAdministrador
    {

        // Variables
        private DAdministrador datosAdministrador { get; }

        // Constructor
        public SAdministrador(PostgreSQLContext _context) : base(_context)
        {
            datosAdministrador = new DAdministrador(_context);
        }

        public SAdministrador(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            datosAdministrador = new DAdministrador(_context);
        }

        // Métodos

        // Crear administrador
        public override async Task Crear(Administrador administrador)
        {
            datosAdministrador.Crear(administrador);
        }

        // Leer administrador filtrado por hash
        public override Administrador Leer(string hash)
        {

            Administrador administrador = datosAdministrador.LeerHash(hash);

            if (administrador != null)
            {

                administrador.Clave = null;

                return administrador;

            }

            throw new NotFoundException("No se encontró el administrador");

        }

        // Actualizar datos personales del administrador
        public override object ActualizarDatosPersonales(Administrador administrador)
        {

            Administrador usuario = datosAdministrador.LeerAuth(administrador.Hash, administrador.CorreoElectronico);

            if (usuario != null)
            {

                administrador.Id = usuario.Id;
                administrador.Clave = usuario.Clave;
                administrador.Verificado = usuario.Verificado;

                datosAdministrador.Actualizar(administrador, usuario);

                Login datos = new Login()
                {
                    Clave = usuario.Clave,
                    Email = usuario.CorreoElectronico,
                    Rol = "administrador"
                };

                return new SSeguridad(DbContext, Configuration).IniciarSesion(datos, false);

            }

            throw new BadRequestException("La información no ha sido enviada correctamente, inténtalo nuevamente");

        }

    }
}
