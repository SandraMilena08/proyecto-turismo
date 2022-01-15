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

    // Capa de servicios de puntuación de plan turístico
    public class SPuntuacionPlan : SPuntuacion<PuntuacionPlan>, ISPuntuacionPlan
    {

        // Variables

        // Métodos de la capa de datos de puntuación de plan turístico
        private DPuntuacionPlan DatosPuntuacionPlan { get; }

        // Métodos de la capa de datos de plan turístico
        private DPlan DatosPlan { get; }

        // Constructor
        public SPuntuacionPlan(PostgreSQLContext _context, IConfiguration _configuration) : base(_context, _configuration)
        {
            DatosPuntuacionPlan = new(_context);
            DatosPlan = new(_context);
        }

        // Métodos

        /// <summary>
        /// Crear registro de puntuación de plan turístico
        /// </summary>
        /// <param name="puntuacion">Datos del registro de puntuación</param>
        /// <param name="hash">Hash del proveedor</param>
        /// <param name="email">E-mail del proveedor</param>
        /// <exception cref="NotFoundException">No se encontró el plan turístico</exception>
        /// <exception cref="IntegridadException">Ya se había generado un registro de puntuación por parte del turista al plan turístico solicitado</exception>
        /// <exception cref="UnauthorizedException">La información del proveedor es corrupta</exception>
        public override void Crear(PuntuacionPlan puntuacion, string hash, string email)
        {

            DProveedor datosProveedor = new(DbContext); // Métodos de la capa de datos de proveedor

            Proveedor proveedor = datosProveedor.LeerAuth(hash, email); // Obteniendo la información del proveedor

            // Validando la información del proveedor
            if (proveedor == null)
                throw new UnauthorizedException("No se envió la información correctamente");

            // Verificando la existencia del plan turístico
            if (DatosPlan.CantidadEstadoHabilitado(puntuacion.PlanId, proveedor.Id, true) != 1)
                throw new NotFoundException("No se encontró el plan turístico");

            // Verificando que el e-mail no exista en proveedores ni administradores
            if (datosProveedor.CantidadEmailSync(puntuacion.Email) > 0 || new DAdministrador(DbContext).CantidadEmailSync(puntuacion.Email) > 0)
                throw new IntegridadException("El correo electrónico no es válido");

            // Verificando que no se hubiera generado un registro de puntuación por parte del turista al plan turístico solicitado
            if (DatosPuntuacionPlan.Cantidad(puntuacion.PlanId, puntuacion.Email) > 0)
                throw new IntegridadException("Ya se generó un registro de puntuación por parte del turista para el plan turístico solicitado");

            // Estableciendo valores iniciales del registro de puntuación
            puntuacion.Calificado = false;
            puntuacion.Calificacion = null;
            puntuacion.TuristaId = null;
            puntuacion.FechaCalificacion = null;

            DatosPuntuacionPlan.Crear(puntuacion); // Guardar registro de puntuación de puntuación de servicio turístico

            new SSMTP(Configuration).EnviarHashPuntuacion("plan", puntuacion.PlanId, puntuacion.Email);

        }

        /// <summary>
        /// Puntuar plan turístico
        /// </summary>
        /// <param name="planId">ID del plan turístico</param>
        /// <param name="email">E-mail del usuario que puntua el plan turístico</param>
        /// <param name="puntuacion">Puntuación dada por el usuario</param>  
        public override void PuntuarOfertaTuristica(int planId, string email, double puntuacion)
        {

            PuntuacionPlan datos = DatosPuntuacionPlan.Leer(planId, email); // Obteniendo los datos del registro de puntuación

            // Verificar si existe el registro de puntuación
            if (datos == null)
                throw new NotFoundException("No se encontró el registro de puntuación");

            Turista turista = new DTurista(DbContext).LeerVerificado(email); // Obteniendo la información del turista y validando que este verificado

            // Verificar si el turista existe
            if (turista == null)
                throw new NotFoundException("No se encontró el turista asociado al correo electrónico: " + email);

            DPlan datosPlan = new(DbContext);
            Plan plan = datosPlan.Leer(planId); // Obteniendo los datos del registro de puntuación

            // Verificar si el plan turístico existe
            if (plan == null)
                throw new NotFoundException("El servicio turístico no existe");

            datos.Calificado = true;
            datos.TuristaId = turista.Id;
            datos.Calificacion = puntuacion;
            datos.FechaCalificacion = DateTime.Now;
            DatosPuntuacionPlan.Actualizar(datos); // Se actualiza la información del registro de puntuación

            List<double> listaPuntuaciones = DatosPuntuacionPlan.Leer(planId);

            plan.Puntuacion = listaPuntuaciones.Sum() / listaPuntuaciones.Count; // Se calcula el promedio de las puntuaciones para obtener la puntuación del del plan
            datosPlan.Actualizar(plan);

        }
    }
}
