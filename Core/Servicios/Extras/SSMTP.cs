// Librerías
using Entidades.Usuarios;
using FluentEmail.Core;
using FluentEmail.Smtp;
using Microsoft.Extensions.Configuration;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace Servicios.Extras
{

    // Capa de servicios de servidor de correos electrónicos
    public class SSMTP
    {

        // Variables
        private SmtpSender smtpSender { get; }
        private IConfiguration Configuration { get; }

        // Constructor
        public SSMTP(IConfiguration _configuration)
        {

            Configuration = _configuration;

            smtpSender = new SmtpSender(() => new SmtpClient(Configuration["SMTP:Host"])
            {
                EnableSsl = true,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(Configuration["SMTP:EmailAddress"], Configuration["SMTP:Password"]),
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Port = int.Parse(Configuration["SMTP:Port"])
            });

            Email.DefaultSender = smtpSender;

        }

        // Métodos

        // Enviar hash de verificación al correo electrónico del usuario
        public async Task EnviarHashVerificacion(Usuario usuario)
        {

            string url = Configuration["SMTP:WebPageUrl"] + "/registro/hash/" + usuario.Hash;

            var email = await Email
                .From(Configuration["SMTP:EmailAddress"], Configuration["SMTP:Name"] + "Registro")
                .To(usuario.CorreoElectronico, usuario.Nombre)
                .Subject("Código de verificación de correo electrónico")
                .Body("<h2>Gualivá Verificación Correo Electrónico</h2><p>Su nueva cuenta ha sido registrada en nuestra plataforma.</p><p>Haga clic en <a href=\"" + url + "\">este enlace</a> para verificar su correo electrónico.</p><p><a href=\"" +
                    url + "\">" + url + "</a></p>", true)
                .HighPriority()
                .SendAsync();

        }

        // Enviar hash de recuperación de cuenta al correo electrónico del usuario
        public async Task EnviarHashRecuperacion(Usuario usuario)
        {

            string url = Configuration["SMTP:WebPageUrl"] + "/recuperar-clave/hash/" + usuario.Hash;

            var email = await Email
                .From(Configuration["SMTP:EmailAddress"], Configuration["SMTP:Name"] + "Recuperar cuenta")
                .To(usuario.CorreoElectronico, usuario.Nombre)
                .Subject("Código de recuperación de cuenta")
                .Body("<h2>Gualivá Recuperación de Cuenta</h2><p>Ha solicitado cambiar la clave de su cuenta.</p><p>Haga clic en <a href=\"" + url + "\">este enlace</a> para continuar con su proceso.</p><p><a href=\"" +
                    url + "\">" + url + "</a></p>", true)
                .HighPriority()
                .SendAsync();

        }

        /// <summary>
        /// Enviar código de puntuación al correo electrónico suministrado
        /// </summary>
        /// <param name="tipoOT">Tipo de oferta turística - plan | servicio</param>
        /// <param name="ofertaTuristicaId">ID del plan o servicio turístico</param>
        /// <param name="correoElectronico">E-mail del usuario</param>
        /// <returns></returns>
        public void EnviarHashPuntuacion(string tipoOT, int ofertaTuristicaId, string correoElectronico)
        {

            string url = Configuration["SMTP:WebPageUrl"] + "/puntuacion/" + tipoOT + "/" + ofertaTuristicaId + "/" + correoElectronico;

            var email = Email
                .From(Configuration["SMTP:EmailAddress"], Configuration["SMTP:Name"] + "código de puntuación")
                .To(correoElectronico)
                .Subject("Código de puntuación de " + tipoOT + " turístico")
                .Body("<h2>Gualivá Puntuación de Oferta Turística</h2><p>Se ha generado un código de puntuación de " + tipoOT + " turístico.</p><p>Haga clic en <a href=\"" + url + "\">este enlace</a> para realizar la calificación.</p><p><a href=\"" +
                    url + "\">" + url + "</a></p>", true)
                .HighPriority()
                .Send();

        }

    }
}
