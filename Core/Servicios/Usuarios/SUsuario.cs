// Librerías
using Datos;
using Datos.Usuarios;
using Entidades.Usuarios;
using Microsoft.Extensions.Configuration;
using Servicios.Generica;
using Servicios.Usuarios.Interfaz;
using System;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Usuarios
{

    // Capa de servicios de usuario
    public abstract class SUsuario<T> : SGenerica, ISUsuario<T> where T : Usuario
    {

        // Constructor        
        public SUsuario(PostgreSQLContext _context) : base(_context) { }
        public SUsuario(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration) { }

        // Métodos

        // Crear usuario
        public abstract Task Crear(T usuario);

        // Leer usuario filtrado por hash
        public abstract T Leer(string hash);

        // Actualizar usuario
        public abstract object ActualizarDatosPersonales(T usuario);


        // Validar la integridad de un nit
        public async Task<bool> ValidarEmail(string email)
        {

            int QTuristas = await new DTurista(DbContext).CantidadEmail(email);
            int QProveedores = await new DProveedor(DbContext).CantidadEmail(email);
            int QAdministradores = await new DAdministrador(DbContext).CantidadEmail(email);

            if (QTuristas == 0 && QProveedores == 0 && QAdministradores == 0) return false; // El e-mail NO está en uso
            else return true; // El e-mail SI está en uso

        }

        // Encriptar clave de seguridad
        public string EncriptarClave(string clave)
        {

            byte[] cadenaEncriptada = Encoding.Unicode.GetBytes(clave);
            return Convert.ToBase64String(cadenaEncriptada);

        }

        // Generar hash de seguridad de usuario
        protected string GenerarHash(T usuario)
        {

            Guid guid = Guid.NewGuid();
            string guidString = Convert.ToBase64String(guid.ToByteArray());
            guidString = guidString.Replace("=", "");
            guidString = guidString.Replace("+", "");

            byte[] cadenaEncriptada = Encoding.Unicode.GetBytes(
                guidString + usuario.CorreoElectronico + DateTime.Now.ToString());

            string hash = Convert.ToBase64String(cadenaEncriptada);
            hash = hash.Replace("=", "");
            hash = hash.Replace("+", "");

            return hash.Substring(0, 32);

        }

    }
}
