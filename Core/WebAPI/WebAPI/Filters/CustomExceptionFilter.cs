// Librerías
using Excepciones;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Net;

namespace WebAPI.Filters
{

    // Filtro de excepciones
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class CustomExceptionFilter : ExceptionFilterAttribute
    {

        // Filtro
        public override void OnException(ExceptionContext context)
        {

            if (context.Exception is IntegridadException)
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Conflict;
            else if (context.Exception is NoContentException)
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.NoContent;
            else if (context.Exception is NotFoundException)
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.NotFound;
            else if (context.Exception is BadRequestException)
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.BadRequest;
            else if (context.Exception is UnauthorizedException)
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
            else
                context.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            context.HttpContext.Response.ContentType = "application/json";
            context.Result = new JsonResult(new
            {
                error = new { context.Exception.Message }
            });

        }

    }
}
