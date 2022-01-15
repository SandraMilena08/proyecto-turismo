// Librerias
using Datos;
using Datos.Oferta;
using Datos.Usuarios;
using Entidades.Oferta;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Servicios.Extras;
using Servicios.Oferta.Interfaz;
using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;
using Utilitarios;

namespace Servicios.Oferta
{

    // Capa de servicios de plan
    public class SPlan : SOfertaTuristica<Plan>, ISPlan
    {

        // Variables        

        // Métodos de la capa de datos de plan turístico
        private DPlan DatosPlan { get; }

        // Constructor
        public SPlan(PostgreSQLContext _context, IWebHostEnvironment _hostEnvironment) : base(_context, _hostEnvironment)
        {
            DatosPlan = new DPlan(_context);
        }

        // Metodos

        /// <summary>
        /// Almacenar plan turístico
        /// </summary>
        /// <param name="plan">Datos del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>        
        /// <exception cref="IntegridadException">El proveedor excedió el número de planes turísticos que puede registrar</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Crear(Plan plan, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            // Verificando la cantidad de planes turísticos asociados al proveedor
            if (DatosPlan.Cantidad(proveedor.Id) >= MAX_OFERTAS_TURISTICAS)
                throw new IntegridadException("Puedes crear un máximo de " + MAX_OFERTAS_TURISTICAS + " planes turísticos");

            // Estableciendo información inicial del plan turístico
            plan.Imagen = JsonSerializer.Serialize(new List<string> { "no-photo.svg" });
            plan.Actividades = JsonSerializer.Serialize(plan.ListaActividades);
            plan.Puntuacion = 0;
            plan.FechaCreacion = DateTime.Now;
            plan.ProveedorId = proveedor.Id;
            plan.Habilitado = true;
            plan.Eliminado = false;
            plan.AdminDeshabilito = false;

            DatosPlan.Crear(plan); // Guardando el servicio turístico en la BD            

        }

        /// <summary>
        /// Obtener datos de un plan turístico y la información de proveedor
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="infoProveedor">Bandera para saber si se trae la información del proveedor</param>        
        /// <param name="estado">Estado del plan turístico</param>
        /// <returns>Datos del plan turístico</returns>
        public override async Task<object> Leer(int id, bool infoProveedor, bool estado)
        {

            Plan plan = DatosPlan.Leer(id, estado); // Obtener los datos del plan turístico

            // Verificar si el servicio turístico existe
            if (plan == null)
                throw new NotFoundException("No se encontró el plan turístico");

            if (infoProveedor == true) // Verificar si se desea retornar información del proveedor
            {

                Proveedor proveedor = await new DProveedor(DbContext).LeerAsync(plan.ProveedorId); // Se obtiene la información del proveedor
                proveedor.Hash = null;
                proveedor.Clave = null;
                List<Servicio> listaServicios = await new DServicio(DbContext).LeerAsync(plan.ProveedorId); // Se obtiene la lista de servicios turísticos del proveedor
                List<Plan> listaPlanes = await DatosPlan.LeerAsync(plan.Id, plan.ProveedorId); // Se obtiene la lista de planes turísticos del proveedor

                return new { plan, proveedor, listaPlanes, listaServicios };

            }

            return new { plan };

        }

        /// <summary>
        /// Leer planes turísticos pertenecientes a un proveedor
        /// </summary>
        /// <param name="hash">Hash del proveedo</param>
        /// <param name="email">E-mail del proveedor</param>        
        /// <returns>Lista de servicios turísticos</returns>
        /// <exception cref="NoContentException">No hay planes turísticos asociados al proveedor</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override List<Plan> Leer(string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            List<Plan> listaPlanes = DatosPlan.Leer(proveedor.Id); // Obtener los planes turísticos del proveedor

            // Verificando si hay servicios turísticos
            if (listaPlanes.Count == 0)
                throw new NoContentException("No hay planes turísticos registrados");

            return listaPlanes; // Retornando la lista de planes turísticos          

        }

        /// <summary>
        /// Leer plan turístico filtrado por ID y proveedor
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <returns>Información del plan turístico</returns>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override Plan Leer(int id, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Plan plan = DatosPlan.Leer(id, proveedor.Id); // Obteniendo la información del plan turístico

            // Verificando si hay un plan turístico
            if (plan == null)
                throw new NotFoundException("No se encontró el plan turístico");

            return plan; // Retornando la información del plan turístico            

        }

        /// <summary>
        /// Leer planes turísticos paginados filtrados por el estado de habilitado
        /// </summary>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes que se desean ver por página</param>
        /// <param name="estado">Estado de habilitado</param>
        /// <returns>Información paginada de planes turísticos</returns>
        /// <exception cref="NoContentException">No hay planes turísticos</exception>
        public override Paginado<Plan> Leer(short pagina, short cantidad, bool estado)
        {

            List<Plan> listaPlanes = DatosPlan.Leer(pagina, cantidad, estado); // Obteniendo la lista de planes turísticos paginados

            // Validando si hay planes turísticos para mostrar
            if (listaPlanes.Count == 0)
                throw new NoContentException("No hay planes turísticos");

            // Inicializando la información del objeto paginado
            Paginado<Plan> paginado = new()
            {
                Contenido = listaPlanes,
                PaginaActual = pagina,
                TotalItems = DatosPlan.CantidadEstadoHabilitado(estado)
            };

            paginado.TotalPaginas = Math.Ceiling((decimal)((double)paginado.TotalItems / (double)cantidad)); // Calculando la cantidad de páginas totales

            return paginado; // Retornando la información de paginación

        }

        /// <summary>
        /// Leer planes turísticos paginados filtrados
        /// </summary>
        /// <param name="parametros">Datos de búsqueda</param>
        /// <param name="pagina">Indice de la página</param>
        /// <param name="cantidad">Cantidad de planes o servicios turísticos a mostrar</param>
        /// <returns>Información paginada de planes turísticos</returns>
        /// <exception cref="NoContentException">No hay planes turísticos</exception>
        public override Paginado<Plan> Leer(Busqueda parametros, short pagina, short cantidad)
        {

            List<Plan> listaPlanes = DatosPlan.Leer(parametros, pagina, cantidad); // Obteniendo los planes turísticos filtrados

            // Verificando si hay planes turísticos para mostrar
            if (listaPlanes.Count == 0)
                throw new NoContentException("No se encontrarón planes turísticos");

            // Declarando objeto de pagináción con sus correspondientes datos
            Paginado<Plan> paginado = new()
            {
                Contenido = listaPlanes,
                PaginaActual = (short)(pagina + 1),
                TotalItems = DatosPlan.Cantidad(parametros),
            };

            paginado.TotalPaginas = Math.Ceiling((decimal)((double)paginado.TotalItems / (double)cantidad)); // Calculando la cantidad de páginas totales

            return paginado; // Rertornando información paginada

        }

        /// <summary>
        /// Leer plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <returns>Datos del plan turístico</returns>
        public override Plan Leer(int id)
        {
            Plan plan = DatosPlan.Leer(id);

            if (plan == null)
                throw new NotFoundException("No se encontró el plan turístico");

            return plan;
        }

        /// <summary>
        /// Actualizar la información de plan turístico
        /// </summary>
        /// <param name="servicio">Datos del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Actualizar(Plan plan, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            // Validando la existencia del plan turístico
            if (DatosPlan.Cantidad(plan.Id, proveedor.Id) != 1)
                throw new NotFoundException("No se encontró el plan turístico");

            DatosPlan.Actualizar(plan); // Actualizando la información del plan turístico

        }

        /// <summary>
        /// Actualizar imágenes de plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="imagenes">Colección de imágenes</param>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Actualizar(int id, string hash, string email, IFormFileCollection imagenes)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Plan plan = DatosPlan.Leer(id, proveedor.Id); // Obteniendo los datos del plan turístico

            // Verificando la existencia del plan turístico
            if (plan == null)
                throw new NotFoundException("No se encontró el plan turístico");

            plan.Imagen = new SImagen(HostEnvironment).CargarImagenes(proveedor, "Plan", imagenes, plan); // Actualizando la información de imagen del plan turístico

            DatosPlan.Actualizar(plan); // Actualizando la información del plan turístico            

        }

        /// <summary>
        /// Actualizar estado de habilitado de plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        public override void Actualizar(int id)
        {

            Plan plan = DatosPlan.Leer(id); // Obtener la información del plan turístico solicitado

            // Verificar la existencia del plan turístico
            if (plan == null)
                throw new NotFoundException("No se encontró el plan turístico");

            // Verificar el estado de habilitado del proveedor asociado al servicio turístico
            if (DatosPlan.LeerEstadoHabilitadoProveedor(plan.ProveedorId) == false)
                throw new BadRequestException("No se puede habilitar el plan turístico de un proveedor deshabilitado");

            plan.Habilitado = !plan.Habilitado;
            plan.AdminDeshabilito = !plan.AdminDeshabilito;

            DatosPlan.Actualizar(plan);

        }

        /// <summary>
        /// Eliminar plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail</param>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Eliminar(int id, string hash, string email)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Plan plan = DatosPlan.Leer(id, proveedor.Id); // Obteniendo la información del plan turístico

            // Verificando la existencia del plan turístico
            if (plan == null)
                throw new NotFoundException("No se encontró el plan turístico");

            // Estableciendo el valor de los campos habilitado y eliminado del plan turístico
            plan.Habilitado = false;
            plan.Eliminado = true;

            DatosPlan.Actualizar(plan); // Actualizando la información del plan turístico            

        }

        /// <summary>
        /// Eliminar imagen de un plan turístico
        /// </summary>
        /// <param name="id">ID del plan turístico</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <param name="direccionImagen">URL de la imagen</param>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Eliminar(int id, string hash, string email, string direccionImagen)
        {

            Proveedor proveedor = LeerProveedor(hash, email); // Verificar la información del proveedor

            Plan plan = DatosPlan.Leer(id, proveedor.Id); // Obteniendo la información del plan turístico

            // Inicializando la información de imagen
            Imagen datosImagen = new()
            {
                Direccion = direccionImagen.Replace("_", "\\"),
                Tipo = "Plan"
            };

            List<string> listaImagenes = JsonSerializer.Deserialize<List<string>>(plan.Imagen); // Obteniendo lista de imágenes del plan turístico

            // Recorriendo la lista de imágenes y eliminando la imagen correspondiente
            for (short i = 0; i < listaImagenes.Count; i++)
                if (listaImagenes[i].Equals(datosImagen.Direccion))
                {
                    listaImagenes.RemoveAt(i);
                    break;
                }

            // Validando si la lista de imágenes quedó vacia e inicializando la imagen por defecto
            if (listaImagenes.Count == 0)
                listaImagenes.Add("no-photo.svg");

            plan.Imagen = JsonSerializer.Serialize(listaImagenes); // Convirtiendo a JSON la lista de imágenes del plan turístico

            DatosPlan.Actualizar(plan); // Actualizando la información del plan turístico

            new SImagen(HostEnvironment).Eliminar(datosImagen); // Eliminando la imagen del servidor

        }
    }
}
