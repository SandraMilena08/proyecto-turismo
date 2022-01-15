// Librerías

using System;
using System.Collections.Generic;

namespace Utilitarios
{

    // Clase de búsqueda de proveedor
    [Serializable]
    public class BusquedaProveedor
    {

        // Variables

        public string Nombre { get; set; }

        public string Nit { get; set; }

        public List<string> Municipios { get; set; }

        public bool Estado { get; set; }

    }
}
