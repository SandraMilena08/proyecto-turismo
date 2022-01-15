// Librerías
using Datos;
using Datos.Oferta;
using Datos.Recomendacion;
using Datos.Usuarios;
using Entidades.Oferta;
using Entidades.Recomendacion;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Servicios.Extras;
using Servicios.Recomendacion.Interfaz;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Servicios.Recomendacion
{

    // Capa de servicios de puntuación de servicio
    public class SPuntuacionServicio : SPuntuacion<PuntuacionServicio>, ISPuntuacionServicio
    {

        // Variables

        // Métodos de la capa de datos de puntuación de servicio turístico
        private DPuntuacionServicio DatosPuntuacionServicio { get; }

        // Métodos de la capa de datos de servicio turístico
        private DServicio DatosServicio { get; }

        // Constructor
        public SPuntuacionServicio(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            DatosServicio = new(_context);
            DatosPuntuacionServicio = new(_context);
        }

        // Métodos

        /// <summary>
        /// Crear registro de puntuación de servicio turístico
        /// </summary>
        /// <param name="puntuacion">Datos del registro de puntuación</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <exception cref="NotFoundException">No se encontró el servicio turístico</exception>
        /// <exception cref="IntegridadException">Ya se había generado un registro de puntuación por parte del turista al servicio turístico solicitado</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Crear(PuntuacionServicio puntuacion, string hash, string email)
        {

            DProveedor datosProveedor = new(DbContext); // Métodos de la capa de datos de proveedor

            Proveedor proveedor = datosProveedor.LeerAuth(hash, email); // Obteniendo la información del proveedor

            // Validando la información del proveedor
            if (proveedor == null)
                throw new UnauthorizedException("No se envió la información correctamente");

            // Verificando la existencia del servicio turístico
            if (DatosServicio.CantidadEstadoHabilitado(puntuacion.ServicioId, proveedor.Id, true) != 1)
                throw new NotFoundException("No se encontró el servicio turístico");

            // Verificando que el e-mail no exista en proveedores ni administradores
            if (datosProveedor.CantidadEmailSync(puntuacion.Email) > 0 || new DAdministrador(DbContext).CantidadEmailSync(puntuacion.Email) > 0)
                throw new IntegridadException("El correo electrónico no es válido");

            // Verificando que no se hubiera generado un registro de puntuación por parte del turista al servicio turístico solicitado
            if (DatosPuntuacionServicio.Cantidad(puntuacion.ServicioId, puntuacion.Email) > 0)
                throw new IntegridadException("Ya se generó un registro de puntuación por parte del turista para el servicio turístico solicitado");

            // Estableciendo valores iniciales del registro de puntuación
            puntuacion.Calificado = false;
            puntuacion.Calificacion = null;
            puntuacion.TuristaId = null;
            puntuacion.FechaCalificacion = null;

            DatosPuntuacionServicio.Crear(puntuacion); // Guardar registro de puntuación de puntuación de servicio turístico

            new SSMTP(Configuration).EnviarHashPuntuacion("servicio", puntuacion.ServicioId, puntuacion.Email);

        }

        /// <summary>
        /// Puntuar servicio turístico
        /// </summary>
        /// <param name="servicioId">ID del servicio turístico</param>
        /// <param name="email">E-mail del usuario que puntua el servicio turístico</param>
        /// <param name="puntuacion">Puntuación dada por el usuario</param>        
        public override void PuntuarOfertaTuristica(int servicioId, string email, double puntuacion)
        {

            PuntuacionServicio datos = DatosPuntuacionServicio.Leer(servicioId, email); // Obteniendo los datos del registro de puntuación

            // Verificar si existe el registro de puntuación
            if (datos == null)
                throw new NotFoundException("No se encontró el registro de puntuación");

            Turista turista = new DTurista(DbContext).LeerVerificado(email); // Obteniendo la información del turista y validando que este verificado

            // Verificar si el turista existe
            if (turista == null)
                throw new NotFoundException("No se encontró el turista asociado al correo electrónico: " + email);

            DServicio datosServicio = new(DbContext);
            Servicio servicio = datosServicio.Leer(servicioId); // Obteniendo los datos del registro de puntuación

            // Verificar si el servicio turístico existe
            if (servicio == null)
                throw new NotFoundException("El servicio turístico no existe");

            datos.Calificado = true;
            datos.TuristaId = turista.Id;
            datos.Calificacion = puntuacion;
            datos.FechaCalificacion = DateTime.Now;
            DatosPuntuacionServicio.Actualizar(datos); // Se actualiza la información del registro de puntuación

            List<double> listaPuntuaciones = DatosPuntuacionServicio.Leer(servicioId);

            servicio.Puntuacion = listaPuntuaciones.Sum() / listaPuntuaciones.Count; // Se calcula el promedio de las puntuaciones para obtener la puntuación del del servicio
            datosServicio.Actualizar(servicio);

        }
    }
}
