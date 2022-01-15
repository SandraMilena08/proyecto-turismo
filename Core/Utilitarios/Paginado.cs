// Librerías
using System;
using System.Collections.Generic;

namespace Utilitarios
{

    // Clase paginado
    [Serializable]
    public class Paginado<T> where T : class
    {
        // Variables

        public List<T> Contenido { get; set; }

        public short PaginaActual { get; set; }

        public decimal TotalPaginas { get; set; }

        public int TotalItems { get; set; }
    }
}
