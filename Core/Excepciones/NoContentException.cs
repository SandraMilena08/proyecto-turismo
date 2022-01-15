// Librerias
using System;

namespace Excepciones
{

    // No content exception
    public class NoContentException : Exception
    {

        // Constructor
        public NoContentException(string mensaje) : base(mensaje) { }

    }
}
