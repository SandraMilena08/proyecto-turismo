// Librerías
using Datos;
using Datos.Recomendacion;
using Entidades.Oferta;
using Excepciones;
using Microsoft.Extensions.Configuration;
using Servicios.Reportes.Interfaz;
using System;
using System.Collections.Generic;
using System.Linq;
using Utilitarios;

namespace Servicios.Reportes
{
    public class SReporte : ISReporte
    {

        // Variables

        // Métodos de la capa de datos de puntuación de serivcio turístico
        private DPuntuacionPlan DatosPuntuacionPlan { get; }
        private DPuntuacionServicio DatosPuntuacionServicio { get; }
        private IConfiguration Configuration { get; }

        // Constructor
        public SReporte(PostgreSQLContext _context, IConfiguration _configuration)
        {
            DatosPuntuacionPlan = new(_context);
            DatosPuntuacionServicio = new(_context);
            Configuration = _configuration;
        }

        // Métodos

        /// <summary>
        /// Obtener datos para el reporte de mejores municipios del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <returns>Lista con datos</returns>
        public List<int> MejoresMunicipios(short month, short year)
        {

            DateTime fecha = new(year, month, 1); // Definiendo la fecha a buscar

            List<string> municipios = new() { "Albán", "La Peña", "La Vega", "Nimaima", "Nocaima", "Quebradanegra", "San Francisco", "Sasaima", "Supatá", "Útica", "Vergara", "Villeta" };
            List<int> datos = new();

            foreach (string municipio in municipios)
                datos.Add(DatosPuntuacionServicio.Cantidad(fecha, municipio) + DatosPuntuacionPlan.Cantidad(fecha, municipio));

            if (datos.Sum() == 0)
                throw new NoContentException("No hay datos para mostrar");

            return datos;

        }

        /// <summary>
        /// Obtener los servicios turísticos destacados del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <param name="municipio">Municipio al que pertenecen los servicios turísticos</param>
        /// <returns>Datos de servicios turísticos</returns>
        public List<BarChart> MejoresServicios(short month, short year, string municipio)
        {

            DateTime fecha = new(year, month, 1); // Fecha de guía

            List<Servicio> listaServicios = DatosPuntuacionServicio.Leer(municipio, fecha); // Se obtienen los servicios turísticos

            // Verificar si la lista de servicios turísticos viene vacia
            if (listaServicios.Count == 0)
                throw new NoContentException("No se encontrarón servicios turísticos");

            listaServicios = listaServicios.Distinct().ToList(); // Se agrupan los servicios turísticos            

            List<BarChart> datos = new();

            foreach (Servicio servicio in listaServicios)
                datos.Add(new BarChart()
                {
                    Nombre = servicio.Nombre,
                    Cantidad = DatosPuntuacionServicio.Cantidad(fecha, servicio.Id)
                });

            return datos.OrderByDescending(x => x.Cantidad).Take(5).ToList();

        }

        /// <summary>
        /// Obtener los planes turísticos destacados del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <param name="municipio">Municipio al que pertenecen los planes turísticos</param>
        /// <returns>Datos de servicios turísticos</returns>
        public List<BarChart> MejoresPlanes(short month, short year, string municipio)
        {

            DateTime fecha = new(year, month, 1); // Fecha de guía

            List<Plan> listaPlanes = DatosPuntuacionPlan.Leer(municipio, fecha); // Se obtienen los planes turísticos

            // Verificar si la lista de planes turísticos viene vacia
            if (listaPlanes.Count == 0)
                throw new NoContentException("No se encontrarón planes turísticos");

            listaPlanes = listaPlanes.Distinct().ToList(); // Se agrupan los planes turísticos            

            List<BarChart> datos = new();

            foreach (Plan plan in listaPlanes)
                datos.Add(new BarChart()
                {
                    Nombre = plan.Nombre,
                    Cantidad = DatosPuntuacionPlan.Cantidad(fecha, plan.Id)
                });

            return datos.OrderByDescending(x => x.Cantidad).Take(5).ToList();

        }

        /// <summary>
        /// Obtener los datos para generar el reporte de categorías por edad
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <returns>Datos para generar el reporte</returns>
        public List<RadarChart> CategoriasEdad(short month, short year)
        {

            DateTime fecha = new(year, month, 1);

            List<string> listaPoblaciones = new()
            {
                Configuration["Poblaciones:Primera"],
                Configuration["Poblaciones:Segunda"],
                Configuration["Poblaciones:Tercera"],
                Configuration["Poblaciones:Cuarta"],
                Configuration["Poblaciones:Quinta"],
                Configuration["Poblaciones:Sexta"]
            };

            List<string> listaCategorias = new()
            {
                Configuration["Categorias:Primera"],
                Configuration["Categorias:Segunda"],
                Configuration["Categorias:Tercera"],
                Configuration["Categorias:Cuarta"],
                Configuration["Categorias:Quinta"]
            };

            List<RadarChart> datos = new();

            for (short i = 0; i < listaPoblaciones.Count; i++)
            {
                datos.Add(new());
                datos[i].Nombre = listaPoblaciones[i];
                foreach (string categoria in listaCategorias)
                    datos[i].Cantidades.Add(DatosPuntuacionServicio.Cantidad(categoria, listaPoblaciones[i], fecha) + DatosPuntuacionPlan.Cantidad(categoria, listaPoblaciones[i], fecha));
            }

            int cantidad = 0;

            for (short i = 0; i < datos.Count; i++)
                cantidad += datos[i].Cantidades.Sum();

            if (cantidad == 0)
                throw new NoContentException("No hay datos para mostrar");

            return datos;

        }

    }
}
