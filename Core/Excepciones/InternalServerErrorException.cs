// Librerías
using System;

namespace Excepciones
{

    // Internal server exception
    public class InternalServerErrorException : Exception
    {

        // Constructor
        public InternalServerErrorException(string mensaje) : base(mensaje) { }

    }
}
