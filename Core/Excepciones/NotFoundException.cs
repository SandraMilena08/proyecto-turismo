// Librerías
using System;

namespace Excepciones
{

    // Not found exception
    public class NotFoundException : Exception
    {

        // Constructor
        public NotFoundException(string mensaje) : base(mensaje) { }

    }
}
