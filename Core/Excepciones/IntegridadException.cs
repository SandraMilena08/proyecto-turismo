// Excepciones
using System;

namespace Excepciones
{

    // Integridad exception
    public class IntegridadException : Exception
    {

        // Constructor
        public IntegridadException(string mensaje) : base(mensaje) { }

    }
}
