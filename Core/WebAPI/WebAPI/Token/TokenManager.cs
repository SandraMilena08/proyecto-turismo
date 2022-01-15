// Librerías
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

namespace WebAPI.Token
{

    // Clase de manejar token
    public class TokenManager : ITokenManager
    {

        // Variables
        private JwtSecurityTokenHandler tokenHandler;

        // Constructor
        public TokenManager()
        {
            tokenHandler = new JwtSecurityTokenHandler();
        }

        // Métodos

        // Obtener el rol del token
        public string GetRol(string token)
        {

            var jwt = tokenHandler.ReadJwtToken(token);

            return jwt.Claims.First(x => x.Type == "rol").Value;

        }

    }
}
