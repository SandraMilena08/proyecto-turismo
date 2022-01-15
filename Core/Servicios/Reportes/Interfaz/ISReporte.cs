// Librerías
using System.Collections.Generic;
using Utilitarios;

namespace Servicios.Reportes.Interfaz
{

    // Interfaz de servicios de reportes
    public interface ISReporte
    {

        // Métodos

        /// <summary>
        /// Obtener datos para el reporte de mejores municipios del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <returns>Lista con datos</returns>
        public List<int> MejoresMunicipios(short month, short year);

        /// <summary>
        /// Obtener los servicios turísticos destacados del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <param name="municipio">Municipio al que pertenecen los servicios turísticos</param>
        /// <returns>Datos de servicios turísticos</returns>
        public List<BarChart> MejoresServicios(short month, short year, string municipio);

        /// <summary>
        /// Obtener los planes turísticos destacados del mes
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <param name="municipio">Municipio al que pertenecen los planes turísticos</param>
        /// <returns>Datos de servicios turísticos</returns>
        public List<BarChart> MejoresPlanes(short month, short year, string municipio);


        /// <summary>
        /// Obtener los datos para generar el reporte de categorías por edad
        /// </summary>
        /// <param name="month">Mes del año</param>
        /// <param name="year">Año</param>
        /// <returns>Datos para generar el reporte</returns>
        public List<RadarChart> CategoriasEdad(short month, short year);

    }
}
