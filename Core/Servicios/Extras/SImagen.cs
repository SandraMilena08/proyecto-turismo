// Librerías
using Entidades.Oferta;
using Entidades.Usuarios;
using Excepciones;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text.Json;
using Utilitarios;

namespace Servicios.Extras
{

    // Capa de servicios de imagen
    public class SImagen
    {

        // Variables
        private const short CANT_MAX_IMG = 5;
        private const string NO_PHOTO = "no-photo.svg";
        private IWebHostEnvironment HostEnvironment { get; }

        // Constructor
        public SImagen(IWebHostEnvironment _hostEnvironent)
        {
            HostEnvironment = _hostEnvironent;
        }

        // Métodos

        // Cargar imagen de proveedor
        public string Cargar(Proveedor proveedor, Imagen datosImagen, IFormFile imagen)
        {

            if (!ValidarTipoImagen(datosImagen.Tipo)) throw new BadRequestException("La información no ha sido enviada correctamente");

            if (datosImagen.Tipo.Equals("Proveedor"))
                datosImagen.Nombre = proveedor.Nit + Path.GetExtension(imagen.FileName);

            string direccionImagen = Path.Combine(HostEnvironment.ContentRootPath, "Imagenes", datosImagen.Tipo, datosImagen.Nombre);

            using (FileStream fileStream = new FileStream(direccionImagen, FileMode.Create))
                imagen.CopyTo(fileStream);

            return Path.Combine(datosImagen.Tipo, datosImagen.Nombre);

        }

        /// <summary>
        /// Cargar imágenes de planes o servicios turísticos
        /// </summary>
        /// <param name="proveedor">Datos del proveedor</param>
        /// <param name="tipo">Tipo de imagen - Plan | Servicio | Proveedor</param>
        /// <param name="imagenes">Colección de imágenes</param>
        /// <param name="oferta">Información del plan o servicio turístico</param>
        /// <returns>Json de lista de imágenes</returns>
        public string CargarImagenes(Proveedor proveedor, string tipo, IFormFileCollection imagenes, OfertaTuristica oferta)
        {

            if (!ValidarTipoImagen(tipo)) throw new BadHttpRequestException("La información no ha sido enviada correctamente");

            string path = Path.Combine(HostEnvironment.ContentRootPath, "Imagenes", "OfertaTuristica", tipo, proveedor.Nit);

            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);

            List<string> listaImagenes = JsonSerializer.Deserialize<List<string>>(oferta.Imagen);

            // Cantidad de imágenes que puede subir el proveedor
            short cantidadImagenes = 0;
            bool noImagenes = false;

            if (listaImagenes.Count == 1)
            {

                noImagenes = ValidarNoPhoto(listaImagenes[0]);
                cantidadImagenes = noImagenes ? (short)5 : (short)4;

            }
            else
                cantidadImagenes = Convert.ToInt16(CANT_MAX_IMG - listaImagenes.Count);

            // Validar si la cantidad de imágenes que se desean subir sea correcta
            if (cantidadImagenes > 0 && cantidadImagenes >= imagenes.Count)
            {

                string nombreImagen;
                string direccionGuardar;
                List<string> listaAuxImagenes = new List<string>();

                // Poblar la lista de imágenes en caso de que ya existan imágenes
                if (!noImagenes)
                    foreach (string imagen in listaImagenes) listaAuxImagenes.Add(imagen);

                foreach (IFormFile imagen in imagenes)
                {

                    nombreImagen = oferta.Id.ToString() + cantidadImagenes++.ToString() + Path.GetExtension(imagen.FileName);
                    direccionGuardar = Path.Combine(path, nombreImagen);

                    using (FileStream fileStream = new FileStream(direccionGuardar, FileMode.Create))
                    {
                        imagen.CopyTo(fileStream);
                    }

                    listaAuxImagenes.Add(Path.Combine("OfertaTuristica", tipo, proveedor.Nit, nombreImagen));

                }

                return JsonSerializer.Serialize(listaAuxImagenes);

            }
            else
                throw new BadRequestException("No se pueden subir más imágenes");

        }

        /// <summary>
        /// Eliminar imagen del servidor
        /// </summary>
        /// <param name="datosImagen">Datos de la imagen</param>
        /// <exception cref="BadRequestException">El tipo de imagen no es correcto</exception>
        public void Eliminar(Imagen datosImagen)
        {

            if (!ValidarTipoImagen(datosImagen.Tipo)) throw new BadRequestException("La información no ha sido enviada correctamente");

            FileInfo fileInfo = new FileInfo(Path.Combine(HostEnvironment.ContentRootPath, "Imagenes", datosImagen.Direccion));

            if (fileInfo.Exists)
            {
                File.Delete(Path.Combine("Imagenes", datosImagen.Direccion));
                fileInfo.Delete();
            }

        }

        // Verificar si la imagen almacenada es NO_PHOTO
        private bool ValidarNoPhoto(string imagen)
        {
            return imagen.Equals(NO_PHOTO) ? true : false;
        }

        // Validar tipo de imagen
        private bool ValidarTipoImagen(string tipo)
        {
            return tipo.Equals("Plan") || tipo.Equals("Servicio") || tipo.Equals("Proveedor") ? true : false;
        }

    }
}
