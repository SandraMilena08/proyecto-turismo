// Módulos
import { Router } from '@angular/router';
import { FormGroup, FormBuilder } from '@angular/forms';
import { Component, Input, OnInit, EventEmitter, Output, ViewChild, ElementRef } from '@angular/core';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { PlanService } from 'src/app/services/plan.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { ServicioService } from 'src/app/services/servicio.service';

// Environment
import { environment } from 'src/environments/environment';

const webImages = environment.webImages;
const MAX_IMAGES = 5; // Cantidad máxima de imágenes para servicios turísticos

@Component({
  selector: 'app-crud-ot-images',
  templateUrl: './crud-ot-images.component.html',
  styleUrls: ['./crud-ot-images.component.css']
})
export class CrudOtImagesComponent implements OnInit {

  // Variables
  @Input() idOT?: number; // ID de la oferta turística
  @Input() modulo?: string; // Plan | Servicio
  @Input() listaImagenes?: string[]; // Lista de imágenes de la oferta turística
  private hash?: string | null; // Hash del proveedor
  private email?: string | null; // E-mail del proveedor
  public imagesFormGroup?: FormGroup; // Formulario de imágenes
  @Output() recargarModulo = new EventEmitter(); // Evento que solicita recargar página
  @ViewChild('OTImagesBtn') OTImagesBtn?: ElementRef;
  @ViewChild('OTImagesInput') OTImagesInput?: ElementRef;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private planService: PlanService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private servicioService: ServicioService
  ) { 
    this.imagesFormGroup = this.formBuilder.group({
      imagenes: [null]
    });
  }

  ngOnInit(): void {
    this.hash = this.authService.retornarHash(); // Obtener el hash del proveedor
    this.email = this.authService.retornarEmail(); // Obtener el e-mail del proveedor    
  }

  // Métodos

  // Eliminar imagen
  public async eliminarImagen(nombre: string) : Promise<void> {

    this.spinner.show();        

    nombre = nombre.replace(`${ webImages }/`, '');
    nombre = nombre.replace(/\\/gi, "_");    

    if (this.modulo! == 'servicio') {
      await this.servicioService.eliminarImagen(this.idOT!, this.hash!, this.email!, nombre)
        .then(res => {
          if (res == "0") this.recargarModulo.emit();            
          else { 
            this.alertaService.error(res);
            this.spinner.hide();
          }
        });
    } else {
      await this.planService.eliminarImagen(this.idOT!, this.hash!, this.email!, nombre)
        .then(res => {
          if (res == "0") this.recargarModulo.emit();
          else {
            this.alertaService.error(res);
            this.spinner.hide();
          }
        });
    }   

  }

  // Abrir ventana del navegador para seleccionar imágenes
  public openImageWindow() : void {
    this.OTImagesInput!.nativeElement.click();
  }

  // Subir imágenes al servidor
  public async subirImagenes() : Promise<void> {

    this.spinner.show();

    console.log(`Hash: ${ this.hash! } - Email: ${ this.email! }`);

    if (this.modulo! == 'servicio') {
      await this.servicioService.actualizarImagenes(this.idOT!, this.imagesFormGroup!.get('imagenes')!.value, this.hash!, this.email!)
        .then(res => {
          if (res == "0") this.recargarModulo.emit();
          else {
            this.alertaService.error(res);
            this.spinner.hide();
          }
        });
    } else {
      await this.planService.actualizarImagenes(this.idOT!, this.imagesFormGroup!.get('imagenes')!.value, this.hash!, this.email!)
        .then(res => {
          if (res == "0") this.recargarModulo.emit();
          else {
            this.alertaService.error(res);
            this.spinner.hide();
          }
        });
    }

    this.spinner.hide();

  }

  // Evento que se dispara al subir imágenes
  public onUploadImages(event: any) : void {

    const images: FileList = (event.target as HTMLInputElement).files!;

    // Verificar que existan imágenes para subir
    if (images.length == 0) {
      this.alertaService.error('No hay imágenes para subir');
      return;
    }    

    // Si ya hay el número máximo de imágenes se invalida la solicitud
    if (this.listaImagenes!.length == MAX_IMAGES) {
      this.alertaService.error('Ya no se pueden subir más imágenes');
      return;
    }

    // En caso de que la imagen existente sea 'no-photo.svg' se valida que se deseen subir <= 5 imágenes
    if (this.listaImagenes!.length == 1 && this.listaImagenes![0].includes('no-photo.svg')) {
      if (images.length > MAX_IMAGES) { 
        this.alertaService.error(`Se puede subir máximo ${ MAX_IMAGES } imágenes`);
        return; 
      }
    }

    // En caso de que exista una imágen pero diferente a 'no-photo.svg' se valida que se vayan a subir <= 5 imágenes
    if (!this.listaImagenes![0].includes('no-photo.svg')) {
      let cantidadTotal = this.listaImagenes!.length + images.length;
      if (cantidadTotal > 5) {
        let diferencia = MAX_IMAGES - this.listaImagenes!.length;
        this.alertaService.error(`Se puede subir máximo ${ diferencia } ${ diferencia == 1 ? 'imagen' : 'imágenes' }`);
        return;
      }
    }

    // Se validan las extensiones de las imágenes
    for (let i = 0; i < images.length; i++) {
      switch (images[i].type) {
        case "image/png":
        case "image/jpeg":
          break;
        default:
          this.alertaService.error('Las imágenes no tienen el formato correcto');
          return;
      }
    }

    // Se valida el tamaño de las imágenes
    for (let i = 0; i < images.length; i++) {
      if (images[i].size > 1048576) { // 1048576 Bytes = 1 Megabyte
        this.alertaService.error('Las imágenes pueden pesar máximo 1 Megabyte (MB)');
        return;
      }
    }

    this.imagesFormGroup!.patchValue({
      imagenes: images
    });

    this.OTImagesBtn!.nativeElement.click();

  }

}
