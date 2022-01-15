// Librerías
using Datos;
using Datos.Seguridad;
using Datos.Usuarios;
using Entidades.Seguridad;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Servicios.Extras;
using Servicios.Generica;
using Servicios.Seguridad.Interfaz;
using Servicios.Usuarios;
using System;
using System.Threading.Tasks;

namespace Servicios.Seguridad
{

    // Capa de servicios de recuperar cuenta
    public class SRecuperarCuenta : SGenerica, ISRecuperarCuenta
    {

        // Variables
        private DRecuperarCuenta datosRecuperarCuenta { get; }

        // Constructor
        public SRecuperarCuenta(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            datosRecuperarCuenta = new DRecuperarCuenta(_context);
        }

        // Métodos

        // Crear solicitud de recuperar cuenta
        public async Task Crear(string email, string rol)
        {

            if (datosRecuperarCuenta.CantidadEmail(email) == 0)
            {

                Usuario usuario;

                switch (rol)
                {

                    case "turista":
                        usuario = new DTurista(DbContext).Leer(email);
                        break;

                    case "proveedor":
                        usuario = new DProveedor(DbContext).Leer(email);
                        break;

                    case "administrador":
                        usuario = new DAdministrador(DbContext).Leer(email);
                        break;

                    default:
                        throw new BadRequestException("La información no ha sido enviada correctamente");

                }

                if (usuario != null)
                {

                    RecuperarCuenta datos = new RecuperarCuenta()
                    {
                        CorreoElectronico = email,
                        FechaCreacion = DateTime.Now,
                        Rol = rol,
                        Hash = usuario.Hash
                    };

                    datosRecuperarCuenta.Crear(datos);

                    await new SSMTP(Configuration).EnviarHashRecuperacion(usuario);

                }
                else
                    throw new NotFoundException("No se encontró una cuenta asociada al correo electrónico suministrado");

            }
            else
                throw new IntegridadException("El usuario ya ha solicitado cambiar la clave, verifique su correo electrónico");

        }

        // Cambiar la clave del usuario
        public void CambiarClave(string hash, string clave)
        {

            RecuperarCuenta datos = datosRecuperarCuenta.Leer(hash);

            if (datos != null)
            {

                SProveedor serviciosProveedor = new SProveedor(DbContext);

                switch (datos.Rol)
                {

                    case "turista":
                        DTurista datosTurista = new DTurista(DbContext);
                        Turista turista = datosTurista.LeerHash(hash);
                        turista.Clave = serviciosProveedor.EncriptarClave(clave);
                        datosTurista.Actualizar(turista);
                        break;

                    case "proveedor":
                        DProveedor datosProveedor = new DProveedor(DbContext);
                        Proveedor proveedor = datosProveedor.LeerHash(hash);
                        proveedor.Clave = serviciosProveedor.EncriptarClave(clave);
                        datosProveedor.Actualizar(proveedor);
                        break;

                    case "administrador":
                        DAdministrador datosAdministrador = new DAdministrador(DbContext);
                        Administrador administrador = datosAdministrador.LeerHash(hash);
                        administrador.Clave = serviciosProveedor.EncriptarClave(clave);
                        datosAdministrador.Actualizar(administrador);
                        break;

                    default:
                        throw new BadRequestException("La información no ha sido enviada correctamente");

                }

                datosRecuperarCuenta.Eliminar(datos);

            }
            else
                throw new NotFoundException("No se encontró un registro asociado, prueba iniciar sesión");

        }

        // Reenviar código de recuperar cuenta
        public async Task ReenviarCodigo(string email)
        {

            RecuperarCuenta datos = datosRecuperarCuenta.LeerEmail(email);

            if (datos != null)
            {

                Usuario usuario;

                switch (datos.Rol)
                {

                    case "turista":
                        usuario = new DTurista(DbContext).Leer(email);
                        break;

                    case "proveedor":
                        usuario = new DProveedor(DbContext).Leer(email);
                        break;

                    case "administrador":
                        usuario = new DAdministrador(DbContext).Leer(email);
                        break;

                    default:
                        throw new InternalServerErrorException("Ha ocurrido un error inesperado, inténtalo nuevamente");

                }

                if (usuario != null)
                    await new SSMTP(Configuration).EnviarHashRecuperacion(usuario);
                else
                    throw new BadRequestException("No se encontró un usuario asociado al correo electrónico suministrado");

            }
            else
                throw new NotFoundException("No se encontró un registro asociado al correo electrónico suministrado");

        }
    }

}
