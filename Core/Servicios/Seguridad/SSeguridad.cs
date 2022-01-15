// Librerías
using Datos;
using Datos.Seguridad;
using Datos.Usuarios;
using Entidades.Seguridad;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Servicios.Generica;
using Servicios.Seguridad.Interfaz;
using Servicios.Usuarios;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Utilitarios;

namespace Servicios.Seguridad
{

    // Capa de servicios de seguridad
    public class SSeguridad : SGenerica, ISSeguridad
    {

        // Variables
        private DSupervisionUsuario datosSupervisionUsuario;

        // Constructor
        public SSeguridad(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            datosSupervisionUsuario = new DSupervisionUsuario(_context);
        }

        // Métodos

        // Iniciar sesión
        public object IniciarSesion(Login datos, bool encriptarClave)
        {

            Usuario usuario;

            if (encriptarClave)
                datos.Clave = new SProveedor(DbContext).EncriptarClave(datos.Clave);

            switch (datos.Rol)
            {

                case "turista":
                    usuario = new DTurista(DbContext).Leer(datos.Email, datos.Clave);
                    break;

                case "proveedor":
                    usuario = new DProveedor(DbContext).LeerLogin(datos.Nit, datos.Clave);
                    break;

                case "administrador":
                    usuario = new DAdministrador(DbContext).Leer(datos.Email, datos.Clave);
                    break;

                default:
                    throw new BadRequestException("Información enviada incorrectamente, inténtalo nuevamente");

            }

            if (usuario != null)
            {

                // Verificar si el usuario ya activo su cuenta por e-mail
                if (usuario.Verificado == false)
                    throw new IntegridadException("Tu cuenta no ha sido verificada. No puedes iniciar sesión");

                DateTime fechaActual = DateTime.Now;

                string JWToken = new JwtSecurityTokenHandler().WriteToken(GenerarJWT(datos.Rol, usuario, fechaActual));

                if (datosSupervisionUsuario.CantidadEmail(usuario.CorreoElectronico) == 0)
                {

                    datosSupervisionUsuario.Crear(new SupervisionUsuario(JWToken, datos.Rol, usuario.CorreoElectronico, fechaActual));

                    return new { nuevoLogin = true, token = JWToken };

                }

                datosSupervisionUsuario.Eliminar(datosSupervisionUsuario.Leer(usuario.CorreoElectronico));

                datosSupervisionUsuario.Crear(new SupervisionUsuario(JWToken, datos.Rol, usuario.CorreoElectronico, fechaActual));

                return new { nuevoLogin = false, token = JWToken };

            }
            else
                throw new BadRequestException("Datos incorrectos, inténtalo nuevamente");

        }

        // Cerrar sesión de usuario
        public void CerrarSesion(string email)
        {

            var datos = datosSupervisionUsuario.Leer(email);

            if (datos != null)
                datosSupervisionUsuario.Eliminar(datos);

        }

        // Generar JWT de seguridad
        private JwtSecurityToken GenerarJWT(string rol, Usuario usuario, DateTime fechaActual)
        {

            SymmetricSecurityKey IssuerSigninKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWT:SecurityKey"]));

            var claims = new List<Claim> {
                new Claim("hash", usuario.Hash),
                new Claim("rol", rol),
                new Claim("nombre", usuario.Nombre),
                new Claim("verificado", usuario.Verificado.ToString()),
                new Claim("email", usuario.CorreoElectronico),
                new Claim("icono", usuario.Icono)
            };

            if (rol.Equals("proveedor")) claims.Add(new Claim("habilitado", new DProveedor(DbContext).LeerHabilitado(usuario.Hash, usuario.CorreoElectronico).ToString()));

            return new JwtSecurityToken(
                issuer: Configuration["JWT:Issuer"],
                audience: Configuration["JWT:Audience"],
                claims: claims,
                expires: new DateTime(fechaActual.Year, fechaActual.Month, fechaActual.Day, 23, 59, 59, 999).AddDays(20),
                notBefore: fechaActual,
                signingCredentials: new SigningCredentials(IssuerSigninKey, SecurityAlgorithms.HmacSha256)
            );

        }

    }
}
