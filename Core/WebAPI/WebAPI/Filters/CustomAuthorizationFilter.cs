//  Librerías
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Linq;
using System.Net;
using WebAPI.Token;

namespace WebAPI.Filters
{

    // Filtro de autorización
    public class CustomAuthorizationFilter : Attribute, IAuthorizationFilter
    {

        // Variables
        private string Permiso { get; }

        // Constructor
        public CustomAuthorizationFilter(string permisos)
        {
            Permiso = permisos;
        }

        // Filtro
        public void OnAuthorization(AuthorizationFilterContext context)
        {

            var tokenManager = (ITokenManager)context.HttpContext.RequestServices.GetService(typeof(ITokenManager));

            bool tokenExiste = true;

            if (!context.HttpContext.Request.Headers.ContainsKey("Authorization"))
                tokenExiste = false;

            string token = string.Empty;

            if (tokenExiste)
            {

                if (!Permiso.Equals("all"))
                {

                    token = context.HttpContext.Request.Headers.First(x => x.Key == "Authorization").Value;
                    string rol = tokenManager.GetRol(token.Replace("Bearer ", ""));

                    if (!rol.Equals(Permiso))
                    {
                        context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                        context.HttpContext.Response.ContentType = "application/json";
                        context.Result = new JsonResult(new
                        {
                            error = new { message = "No estas autorizado para realizar esta acción" }
                        });
                    }

                }

            }
            else
            {

                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                context.HttpContext.Response.ContentType = "application/json";
                context.Result = new JsonResult(new
                {
                    error = new { message = "No estas autorizado para realizar esta acción" }
                });

            }

        }
    }
}
