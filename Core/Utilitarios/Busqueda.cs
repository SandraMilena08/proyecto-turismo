// Librerías
using System;
using System.Collections.Generic;

namespace Utilitarios
{

    // Clase búsqueda
    [Serializable]
    public class Busqueda
    {

        // Variables

        public string Nombre { get; set; }

        public List<string> Municipios { get; set; }

        public List<string> Categorias { get; set; }

        public List<int> Puntuaciones { get; set; }

        public List<double> Precios { get; set; }

        public bool Estado { get; set; }

    }
}
