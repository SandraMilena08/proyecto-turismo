// Librerías

namespace WebAPI.Token
{

    // Interfáz de la clase de manejar token
    public interface ITokenManager
    {

        // Métodos

        // Obtener el rol del token
        public string GetRol(string token);

    }
}
