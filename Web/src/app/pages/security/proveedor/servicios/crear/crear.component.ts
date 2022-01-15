// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { ServicioService } from 'src/app/services/servicio.service';

// Interfaces
import { Servicio } from 'src/app/interfaces/servicio.interface';

// Environments
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-crear',
  templateUrl: './crear.component.html',
  styleUrls: ['./crear.component.css']
})
export class CrearComponent implements OnInit {

  // Variables
  public municipios: any[];
  public categorias: any[];  
  public formGroup: FormGroup;
  public volumenesIngreso: any[];

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private servicioService: ServicioService
  ) { 
    this.municipios = environment.municipios;
    this.categorias = environment.categorias;
    this.volumenesIngreso = environment.volumenesIngreso;
    this.formGroup = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(50), Validators.pattern("[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*")]],
      informacion: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(420)]],
      precio: ['', [Validators.required, Validators.min(1000), Validators.max(9999999), Validators.pattern("[0-9]*")]],
      municipio: [null, [Validators.required]],
      volumenIngreso: [null, [Validators.required]],
      categoria: [null, [Validators.required]]
    });    
  }

  ngOnInit(): void {    
  }

  // Métodos

  // Crear servicio
  public async crearServicio() : Promise<void> {

    this.spinner.show();

    if (this.formGroup.valid) {

      var servicio: Servicio = {
        nombre: this.formGroup.get('nombre')!.value,
        informacion: this.formGroup.get('informacion')!.value,
        precio: this.formGroup.get('precio')!.value,
        municipio: this.formGroup.get('municipio')!.value,
        volumenIngreso: this.formGroup.get('volumenIngreso')!.value,
        categoria: this.formGroup.get('categoria')!.value
      };

      const hash: string | null = this.authService.retornarHash();
      const email: string | null = this.authService.retornarEmail();

      await this.servicioService.crear(servicio, hash!, email!)
        .then(res => {
          if (res == "0") {
            this.formGroup.reset();
            this.alertaService.confirmacion("Servicio turístico agregado correctamente");
            this.router.navigateByUrl('/proveedor/servicios');
          } else
            this.alertaService.error(res);
        });

    } else
      this.alertaService.error("Completa el formulario correctamente");

    this.spinner.hide();

  }

  // Obtener los valores del formulario de registro de servicio turístico
  get f() { return this.formGroup.controls }

}
