// Librerías
using Datos;
using Datos.Oferta;
using Datos.Usuarios;
using Entidades.Oferta;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Servicios.Extras;
using Servicios.Seguridad;
using Servicios.Usuarios.Interfaz;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Usuarios
{

    // Capa de servicios de proveedor
    public class SProveedor : SUsuario<Proveedor>, ISProveedor
    {

        // Variables
        private DProveedor DatosProveedor { get; }
        private IWebHostEnvironment HostEnvironment { get; }

        // Constructor
        public SProveedor(PostgreSQLContext _context) : base(_context)
        {
            DatosProveedor = new DProveedor(_context);
        }

        public SProveedor(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            DatosProveedor = new DProveedor(_context);
        }

        public SProveedor(PostgreSQLContext _context, IConfiguration _configuration, IWebHostEnvironment _hostEnvironment) : base(_context, _configuration)
        {
            DatosProveedor = new DProveedor(_context);
            HostEnvironment = _hostEnvironment;
        }

        // Métodos

        // Crear proveedor
        public override async Task Crear(Proveedor proveedor)
        {

            await ValidarDatosUnicos(proveedor);

            proveedor.Verificado = false;
            proveedor.Habilitado = true;
            proveedor.Icono = "no-photo.svg";
            proveedor.Hash = GenerarHash(proveedor);
            proveedor.Clave = EncriptarClave(proveedor.Clave);
            proveedor = DatosProveedor.Crear(proveedor);

            new DPreRegistro(DbContext).Crear(new PreRegistro(proveedor.CorreoElectronico, proveedor.Hash, "PROVEEDOR"));

            await new SSMTP(Configuration).EnviarHashVerificacion(proveedor);

        }

        // Leer proveedor filtrado por hash
        public override Proveedor Leer(string hash)
        {

            Proveedor proveedor = DatosProveedor.LeerHash(hash);

            if (proveedor != null)
            {

                proveedor.Clave = null;

                return proveedor;

            }

            throw new NotFoundException("No se encontró el proveedor");

        }

        // Leer proveedores paginados filtrados por estado de habilitado
        public Paginado<Proveedor> LeerEstadoHabilitado(short pagina, short cantidad, bool estado)
        {

            List<Proveedor> listaProveedores = DatosProveedor.LeerEstadoHabilitado(pagina, cantidad, estado);

            if (listaProveedores.Count > 0)
            {

                Paginado<Proveedor> paginado = new Paginado<Proveedor>()
                {
                    Contenido = listaProveedores,
                    PaginaActual = pagina,
                    TotalItems = DatosProveedor.CantidadEstadoHabilitado(estado)
                };

                paginado.TotalPaginas = Math.Ceiling((decimal)(paginado.TotalItems / cantidad));

                return paginado;

            }
            else throw new NoContentException("No hay proveedores");

        }

        /// <summary>
        /// Leer proveedores paginados filtrados
        /// </summary>
        /// <param name="parametros">Parámetros de búsqueda</param>
        /// <param name="pagina">Indice de la pagina</param>
        /// <param name="cantidad">Cantidad de proveedores a mostrar</param>
        /// <returns>Datos de paginación de proveedores</returns>
        public Paginado<Proveedor> Leer(BusquedaProveedor parametros, short pagina, short cantidad)
        {

            List<Proveedor> listaProveedores = DatosProveedor.Leer(parametros, pagina, cantidad); // Obteniendo los proveedores filtrados

            // Verificando si hay proveedores para mostrar
            if (listaProveedores.Count == 0)
                throw new NoContentException("No se encontrarón proveedores");

            // Seteando campos en null
            listaProveedores.ForEach(x =>
            {
                x.Clave = null;
            });

            // Declarando objeto de paginación con sus correspondientes datos
            Paginado<Proveedor> paginado = new()
            {
                Contenido = listaProveedores,
                PaginaActual = (short)(pagina + 1),
                TotalItems = DatosProveedor.Cantidad(parametros)
            };

            paginado.TotalPaginas = Math.Ceiling((decimal)((double)paginado.TotalItems / (double)cantidad)); // Calculando la cantidad de páginas totales

            return paginado; // Retornando la información paginada

        }

        // Actualizar proveedor
        public override object ActualizarDatosPersonales(Proveedor proveedor)
        {

            Proveedor usuario = DatosProveedor.LeerAuth(proveedor.Hash, proveedor.CorreoElectronico);

            if (usuario != null)
            {

                proveedor.Id = usuario.Id;
                proveedor.Nit = usuario.Nit;
                proveedor.Clave = usuario.Clave;
                proveedor.Icono = usuario.Icono;
                proveedor.Verificado = usuario.Verificado;
                proveedor.Habilitado = usuario.Habilitado;

                DatosProveedor.Actualizar(proveedor, usuario);

                Login datos = new Login()
                {
                    Clave = usuario.Clave,
                    Nit = usuario.Nit,
                    Rol = "proveedor"
                };

                return new SSeguridad(DbContext, Configuration).IniciarSesion(datos, false);

            }

            throw new BadRequestException("La información no ha sido enviada correctamente, inténtalo nuevamente");

        }

        // Actualizar ícono
        public object ActualizarIcono(IFormFile imagen, string hash, string email)
        {

            Proveedor proveedor = DatosProveedor.LeerAuth(hash, email);

            if (proveedor != null)
            {

                Imagen datosImagen = new Imagen()
                {
                    Direccion = proveedor.Icono,
                    Tipo = "Proveedor"
                };

                SImagen serviciosImagen = new SImagen(HostEnvironment);

                if (!datosImagen.Direccion.Equals("no-photo.svg")) serviciosImagen.Eliminar(datosImagen);

                proveedor.Icono = serviciosImagen.Cargar(proveedor, datosImagen, imagen);

                DatosProveedor.Actualizar(proveedor);

                Login datos = new Login()
                {
                    Clave = proveedor.Clave,
                    Nit = proveedor.Nit,
                    Rol = "proveedor"
                };

                return new SSeguridad(DbContext, Configuration).IniciarSesion(datos, false);

            }
            else
                throw new NotFoundException("No se encontró el proveedor");

        }

        // Actualizar estado de habilitado de un proveedor
        public void ActualizarEstado(string hash)
        {

            Proveedor proveedor = DatosProveedor.LeerHash(hash);

            if (proveedor != null)
            {

                DPlan datosPlanes = new(DbContext);
                DServicio datosServicios = new(DbContext);

                List<Plan> listaPlanes = datosPlanes.Leer(proveedor.Id);
                List<Servicio> listaServicios = datosServicios.Leer(proveedor.Id);

                foreach (Plan plan in listaPlanes)
                    if (proveedor.Habilitado == true) // Se va a deshabilitar el proveedor
                    {
                        // Se deshabilitan todos los planes del proveedor
                        plan.Habilitado = false;
                        datosPlanes.Actualizar(plan);
                    }
                    else // Se va a habilitar el proveedor
                    {
                        if (plan.AdminDeshabilito == false) // Se habilitan los planes que el administrador no deshabilito directamente
                        {
                            plan.Habilitado = true;
                            datosPlanes.Actualizar(plan);
                        }
                    }

                foreach (Servicio servicio in listaServicios)
                    if (proveedor.Habilitado == true) // Se va a deshabilitar el proveedor
                    {
                        // Se deshabilitan todos los servicios del proveedor
                        servicio.Habilitado = false;
                        datosServicios.Actualizar(servicio);
                    }
                    else
                    {
                        if (servicio.AdminDeshabilito == false) // Se habilitan los servicios que el administrador no deshabilito directamente
                        {
                            servicio.Habilitado = true;
                            datosServicios.Actualizar(servicio);
                        }
                    }

                proveedor.Habilitado = !proveedor.Habilitado;
                DatosProveedor.Actualizar(proveedor);
            }
            else throw new NotFoundException("No se encontró el proveedor");

        }

        // Validar la integridad de los datos únicos
        private async Task ValidarDatosUnicos(Proveedor proveedor)
        {

            bool nitIncorrecto = await ValidarNit(proveedor.Nit);
            bool emailIncorrecto = await ValidarEmail(proveedor.CorreoElectronico);

            if (nitIncorrecto == true && emailIncorrecto == true) throw new IntegridadException("El nit y el correo electrónico ya están en uso");

            if (nitIncorrecto == true) throw new IntegridadException("El nit ya está en uso");

            if (emailIncorrecto == true) throw new IntegridadException("El correo electrónico ya está en uso");

        }

        // Validar la integridad de un nit
        public async Task<bool> ValidarNit(string nit)
        {
            return (await DatosProveedor.CantidadNit(nit) == 0) ? false : true; // False - NO está en uso | True - SI está en uso
        }

    }
}
