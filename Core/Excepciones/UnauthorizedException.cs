// Librerías
using System;

namespace Excepciones
{

    // Unauthorized exception
    public class UnauthorizedException : Exception
    {

        // Constructor
        public UnauthorizedException(string mensaje) : base(mensaje) { }

    }
}
