// Módulos
import { Router } from '@angular/router';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { ProveedorService } from 'src/app/services/proveedor.service';

// Interfaces
import { Proveedor } from 'src/app/interfaces/proveedor.interface';

// Environments
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;

@Component({
  selector: 'app-cuenta',
  templateUrl: './cuenta.component.html',
  styleUrls: ['./cuenta.component.css']
})
export class CuentaComponent implements OnInit {

  // Variables
  public municipios: any[];
  public prevIcono: string | null;
  private hash?: string | null;
  public formGroup?: FormGroup;
  public proveedor?: Proveedor;
  public iconoFormGroup: FormGroup;
  @ViewChild('iconUploader') iconUploader?: ElementRef;
  @ViewChild('iconSubmitBtn') iconSubmitBtn?: ElementRef;

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private proveedorService: ProveedorService
  ) { 
    this.prevIcono = null;
    this.municipios = environment.municipios;
    this.iconoFormGroup = this.formBuilder.group({
      icono: [null, [Validators.required]]
    });
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    this.hash = this.authService.retornarHash();

    if (this.hash != null) {

      await this.proveedorService.leer(this.hash)
        .then(res => {
          
          if (res != null) {

            this.proveedor = res;

            this.prevIcono = `${ WebImages }/${ this.proveedor.icono }`;
            
            this.formGroup = this.formBuilder.group({
              nombre: [this.proveedor.nombre, [Validators.required, Validators.minLength(4), Validators.maxLength(50), Validators.pattern('[a-zA-ZáéíóúÁÉÍÓÚñÑ ]*')]],
              nit: [this.proveedor.nit, [Validators.required, Validators.pattern('([0-9]{8,10})+-[0-9]{1}')]],
              municipio: [this.proveedor.municipio, [Validators.required]],
              direccion: [this.proveedor.direccion, [Validators.minLength(5), Validators.maxLength(120)]],
              telefono: [this.proveedor.telefono, [Validators.required, Validators.minLength(7), Validators.maxLength(10), Validators.pattern('[0-9]*')]],
              email: [this.proveedor.correoElectronico, [Validators.required, Validators.email]]              
            });

            this.formGroup.get('email')!.disable();
            this.formGroup.get('nit')!.disable();

          }

        });
      
    }    

    this.spinner.hide();

  }

  // Métodos

  // Actualizar datos de proveedor
  public async actualizarProveedor() : Promise<void> {
    
    this.spinner.show();

    if (this.formGroup!.valid) {

      this.proveedor!.nombre = this.formGroup!.get('nombre')!.value;
      this.proveedor!.municipio = this.formGroup!.get('municipio')!.value;
      this.proveedor!.direccion = this.formGroup!.get('direccion')!.value;
      this.proveedor!.telefono = this.formGroup!.get('telefono')!.value;

      await this.proveedorService.actualizar(this.proveedor!)
        .then(res => {
          if (res == "0") {
            this.alertaService.confirmacion('Datos actualizados correctamente');
            this.router.navigateByUrl('/proveedor/cuenta')
              .then(_ => {
                this.proveedorService.leer(this.hash!)
                  .then(info => {

                    this.proveedor = info!;
                    this.formGroup!.reset();

                    this.formGroup!.get('nombre')!.setValue(this.proveedor.nombre);
                    this.formGroup!.get('nit')!.setValue(this.proveedor.nit);
                    this.formGroup!.get('municipio')!.setValue(this.proveedor.municipio);
                    this.formGroup!.get('direccion')!.setValue(this.proveedor.direccion);
                    this.formGroup!.get('telefono')!.setValue(this.proveedor.telefono);
                    this.formGroup!.get('email')!.setValue(this.proveedor.correoElectronico);

                  });
              });
          } else 
          this.alertaService.error(res);  
        });

    } else
      this.alertaService.error('Completa el formulario correctamente');
    
    this.spinner.hide();

  }

  // Mostrar ventana de elegir imagen
  public mostrarVentana() : void {
    this.iconUploader!.nativeElement.click();
  }

  // Subiendo imagen
  public uploadFile(event: any) : void {

    const images: any = (event.target as HTMLInputElement).files!;

    // Verificar que existan imágenes para subir
    if (images.length == 0) {
      this.alertaService.error('No hay imagen para subir');
      return;
    }    

    // Se valida el tamaño de las imágenes
    for (let i = 0; i < images.length; i++) {
      if (images[i].size > 1048576) { // 1048576 Bytes = 1 Megabyte
        this.alertaService.error('La imagen puede pesar máximo 1 Megabyte (MB)');
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
          this.alertaService.error('Las imagen no tiene el formato correcto');
          return;
      }
    }

    this.iconoFormGroup.patchValue({
      icono: images[0]
    });

    this.iconoFormGroup.get('icono')!.updateValueAndValidity();

    // Vista previa de icono
    const reader = new FileReader();
    reader.onload = _ => this.prevIcono = reader.result as string;
    reader.readAsDataURL(images[0]);

    this.iconSubmitBtn!.nativeElement.click();

  }

  // Actualizar icono
  public async actualizarIcono() : Promise<void> {

    this.spinner.show();

    if (this.iconoFormGroup.valid) {

      const file = this.iconoFormGroup.get('icono')!.value;

      await this.proveedorService.actualizarIcono(file, this.hash!, this.proveedor!.correoElectronico!)
        .then(res => {
          if (res == '0') {
            this.alertaService.confirmacion('Icono actualizado correctamente');
            this.iconoFormGroup.reset();
          } else
            this.alertaService.error(res);
        });

    } else
      this.alertaService.error('Ingresa una imagen correcta');    

    this.spinner.hide();

  }

  // Obtener los valores del formulario de actualizar proveedor
  get f() { return this.formGroup!.controls }

  // Obtener la cantidad de letras del campo dirección
  get qd() { 
    var direccion: string = this.formGroup!.get('direccion')?.value;
    return direccion.length;
  }

  // Obtener la imagen que el proveedor desea subir
  get fl() { return this.iconoFormGroup.controls; }

}
