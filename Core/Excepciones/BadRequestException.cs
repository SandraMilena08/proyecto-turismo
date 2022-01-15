// Librerías
using System;

namespace Excepciones
{

    // Bad request exception
    public class BadRequestException : Exception
    {

        // Constructor
        public BadRequestException(string mensaje) : base(mensaje) { }

    }
}
