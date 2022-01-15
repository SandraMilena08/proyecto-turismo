// Librerías
using Datos;
using Datos.Usuarios;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Servicios.Extras;
using Servicios.Seguridad;
using Servicios.Usuarios.Interfaz;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Usuarios
{

    // Capa de servicios de turista
    public class STurista : SUsuario<Turista>, ISTurista
    {

        // Variables
        private DTurista DatosTurista { get; }

        // Constructor
        public STurista(PostgreSQLContext _context) : base(_context)
        {
            DatosTurista = new DTurista(_context);
        }

        public STurista(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            DatosTurista = new DTurista(_context);
        }

        // Métodos

        // Crear turista
        public override async Task Crear(Turista turista)
        {

            await ValidarDatosUnicos(turista);

            turista.Verificado = false;
            turista.Hash = GenerarHash(turista);
            turista.Clave = EncriptarClave(turista.Clave);
            turista = DatosTurista.Crear(turista);

            new DPreRegistro(DbContext).Crear(new PreRegistro(turista.CorreoElectronico, turista.Hash, "TURISTA"));

            await new SSMTP(Configuration).EnviarHashVerificacion(turista);

        }

        // Leer turista filtrado por hash
        public override Turista Leer(string hash)
        {

            Turista turista = DatosTurista.LeerHash(hash);

            if (turista != null)
            {

                turista.Clave = null;
                //turista.FechaNacimiento = turista.FechaNacimiento.Date;

                return turista;

            }

            throw new NotFoundException("No se encontró el turista");

        }

        // Actualizar turista
        public override object ActualizarDatosPersonales(Turista turista)
        {

            Turista usuario = DatosTurista.LeerAuth(turista.Hash, turista.CorreoElectronico);

            if (usuario != null)
            {

                turista.Id = usuario.Id;
                turista.Clave = usuario.Clave;
                turista.Verificado = usuario.Verificado;

                DatosTurista.Actualizar(turista, usuario);

                Login datos = new Login()
                {
                    Clave = usuario.Clave,
                    Email = usuario.CorreoElectronico,
                    Rol = "turista"
                };

                return new SSeguridad(DbContext, Configuration).IniciarSesion(datos, false);

            }

            throw new BadRequestException("La información no ha sido enviada correctamente, inténtalo nuevamente");

        }

        /// <summary>
        /// Verificar la existencia de turista a partir de un E-mail
        /// </summary>
        /// <param name="email">E-mail a verificar</param>
        /// <returns>True - Si el e-mail existe | False - Si el e-mail NO existe</returns>
        public bool VerificarExistencia(string email)
        {

            // Verificar si existe un turista con el e-mail proporcionado
            if (DatosTurista.CantidadEmailSync(email) == 1)
                return true;

            // Verificando que el e-mail no exista en proveedores ni administradores
            if (new DProveedor(DbContext).CantidadEmailSync(email) > 0 || new DAdministrador(DbContext).CantidadEmailSync(email) > 0)
                throw new IntegridadException("El correo electrónico no es correcto");

            return false;

        }

        // Validar integridad de los datos únicos de turista
        private async Task ValidarDatosUnicos(Turista turista)
        {
            if (await ValidarEmail(turista.CorreoElectronico) == true) throw new IntegridadException("El correo electrónico ya está en uso");
        }

    }
}
