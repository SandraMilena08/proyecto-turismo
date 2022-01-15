// Módulos
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { ServicioService } from 'src/app/services/servicio.service';

// Interfaces
import { Servicio } from 'src/app/interfaces/servicio.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;

@Component({
  selector: 'app-actualizar',
  templateUrl: './actualizar.component.html',
  styleUrls: ['./actualizar.component.css']
})
export class ActualizarComponent implements OnInit {

  // Variables
  public municipios: any[];
  public categorias: any[];  
  public servicio?: Servicio;
  public formGroup?: FormGroup;
  private hash?: string | null;
  private email?: string | null;
  public volumenesIngreso: any[];  

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute,
    private servicioService: ServicioService
  ) { 
    this.municipios = environment.municipios;
    this.categorias = environment.categorias;
    this.volumenesIngreso = environment.volumenesIngreso;    
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    this.hash = this.authService.retornarHash();
    this.email = this.authService.retornarEmail();

    await this.obtenerId()
      .then(res => {
        this.servicioService.leer(Number(res).valueOf(), this.hash!, this.email!)
          .then(info => {
            if (info != null) {

              this.servicio = info;

              this.servicio.imagenes = JSON.parse(this.servicio.imagen!);   
              for (let i = 0; i < this.servicio.imagenes!.length; i++)
                this.servicio.imagenes![i] = `${ WebImages }/${ this.servicio.imagenes![i] }`;

              this.formGroup = this.formBuilder.group({
                nombre: [this.servicio.nombre, [Validators.required, Validators.minLength(5), Validators.maxLength(50), Validators.pattern("[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*")]],
                informacion: [this.servicio.informacion, [Validators.required, Validators.minLength(5), Validators.maxLength(420)]],
                precio: [this.servicio.precio, [Validators.required, Validators.min(1000), Validators.max(9999999), Validators.pattern("[0-9]*")]],
                municipio: [this.servicio.municipio, [Validators.required]],
                volumenIngreso: [this.servicio.volumenIngreso, [Validators.required]],
                categoria: [this.servicio.categoria, [Validators.required]]
              });                            
              
            } else {
              this.alertaService.error("No se encontró el servicio turístico");
              this.router.navigateByUrl('proveedor/servicios');
            }
          });
      });

    this.spinner.hide();

  }

  // Métodos

  // Actualizar servicio turístico
  public async editarServicio() : Promise<void> {

    this.spinner.show();

    if (this.formGroup!.valid) {

      this.servicio!.nombre = this.formGroup!.get('nombre')!.value;
      this.servicio!.informacion = this.formGroup!.get('informacion')!.value;
      this.servicio!.precio = this.formGroup!.get('precio')!.value;
      this.servicio!.municipio = this.formGroup!.get('municipio')!.value;
      this.servicio!.categoria = this.formGroup!.get('categoria')!.value;
      this.servicio!.volumenIngreso = this.formGroup!.get('volumenIngreso')!.value;

      this.servicio!.informacion = this.servicio!.informacion!.trim();

      await this.servicioService.actualizar(this.servicio!, this.hash!, this.email!)
        .then(res => {
          if (res == "0") {
            this.alertaService.confirmacion("Información actualizada correctamente");
            this.reloadPage();
          } else
            this.alertaService.error(res);
        });

    } else
      this.alertaService.error("Completa el formulario correctamente");

    this.spinner.hide();

  }  

  // Evento que se dispará al modificar las imágenes del servicio
  public async reloadPage() : Promise<void> {
    
    this.spinner.show();
    
    await this.obtenerId()
      .then(res => {
        this.servicioService.leer(Number(res).valueOf(), this.hash!, this.email!)
          .then(info => {
            if (info != null) {

              this.servicio = info;

              this.servicio.imagenes = JSON.parse(this.servicio.imagen!);   
              for (let i = 0; i < this.servicio.imagenes!.length; i++)
                this.servicio.imagenes![i] = `${ WebImages }/${ this.servicio.imagenes![i] }`;

              this.formGroup = this.formBuilder.group({
                nombre: [this.servicio.nombre, [Validators.required, Validators.minLength(5), Validators.maxLength(50), Validators.pattern("[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*")]],
                informacion: [this.servicio.informacion, [Validators.required, Validators.minLength(5), Validators.maxLength(420)]],
                precio: [this.servicio.precio, [Validators.required, Validators.min(1000), Validators.max(9999999), Validators.pattern("[0-9]*")]],
                municipio: [this.servicio.municipio, [Validators.required]],
                volumenIngreso: [this.servicio.volumenIngreso, [Validators.required]],
                categoria: [this.servicio.categoria, [Validators.required]]
              });                            
              
            } else {
              this.alertaService.error("No se encontró el servicio turístico");
              this.router.navigateByUrl('proveedor/servicios');
            }
          });
      });

    this.spinner.hide();
  }

  // Obtener el id del servicio turístico de la url
  private async obtenerId() : Promise<string> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve(params.get('id')!);
        });
    });
  }

  // Obtener los valores del formulario de actualizar servicio turístico
  get f() { return this.formGroup!.controls }  

}
