using System;
using System.Collections.Generic;

namespace Utilitarios
{

    // Entidad radar chart
    [Serializable]
    public class RadarChart
    {

        // Variables
        public string Nombre { get; set; }
        public List<int> Cantidades { get; set; }

        // Constructor
        public RadarChart()
        {
            Cantidades = new();
        }

    }
}
