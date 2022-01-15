// Librerías
using Datos;
using Datos.Usuarios;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Servicios.Extras;
using Servicios.Generica;
using Servicios.Usuarios.Interfaz;
using System.Threading.Tasks;

namespace Servicios.Usuarios
{

    // Capa de servicios de pre registro
    public class SPreRegistro : SGenerica, ISPreRegistro
    {

        // Variables
        private DPreRegistro datosPreRegistro { get; }

        // Constructor
        public SPreRegistro(PostgreSQLContext _context) : base(_context)
        {
            datosPreRegistro = new DPreRegistro(_context);
        }

        public SPreRegistro(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            datosPreRegistro = new DPreRegistro(_context);
        }

        // Métodos

        // Reenviar código de verificación
        public async Task ReenviarCodigo(string email)
        {

            PreRegistro registro = datosPreRegistro.Leer(email);

            if (registro != null)
            {

                Usuario usuario;

                switch (registro.Rol)
                {

                    case "TURISTA":
                        usuario = new DTurista(DbContext).Leer(email);
                        break;

                    case "PROVEEDOR":
                        usuario = new DProveedor(DbContext).Leer(email);
                        break;

                    default:
                        usuario = null;
                        break;

                }

                if (usuario != null)
                    await new SSMTP(Configuration).EnviarHashVerificacion(usuario);
                else
                    throw new NotFoundException("No se encontró el registro asociado al correo electrónico. Pruebe iniciar sesión para resolver el problema.");

            }
            else throw new NotFoundException("No se encontró el registro asociado al correo electrónico. Pruebe iniciar sesión para resolver el problema.");

        }

        // Validar código de verificación
        public void ValidarCodigo(string hash)
        {

            PreRegistro preRegistro = datosPreRegistro.LeerHash(hash);

            if (preRegistro != null)
            {

                switch (preRegistro.Rol)
                {

                    case "TURISTA":
                        DTurista datosTurista = new DTurista(DbContext);
                        Turista turista = datosTurista.Leer(preRegistro.CorreoElectronico);
                        turista.Verificado = true;
                        datosTurista.Actualizar(turista);
                        break;

                    case "PROVEEDOR":
                        DProveedor datosProveedor = new DProveedor(DbContext);
                        Proveedor proveedor = datosProveedor.Leer(preRegistro.CorreoElectronico);
                        proveedor.Verificado = true;
                        datosProveedor.Actualizar(proveedor);
                        break;

                    default:
                        throw new NotFoundException("No se encontró el código de verificación asociado, pruebe iniciar sesión para verificar su cuenta.");

                }

                datosPreRegistro.Eliminar(preRegistro);

            }
            else
                throw new NotFoundException("No se encontró el código de verificación asociado, pruebe iniciar sesión para verificar su cuenta.");

        }

    }
}
