// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { SeguridadService } from 'src/app/services/seguridad.service';

// Interfaces
import { Login } from 'src/app/interfaces/login.interface';

@Component({
  selector: 'app-proveedor',
  templateUrl: './proveedor.component.html',
  styleUrls: ['./proveedor.component.css']
})
export class ProveedorComponent implements OnInit {

  // Variales
  public formGroup: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private seguridadService: SeguridadService
  ) { 
    this.formGroup = this.formBuilder.group({
      nit: ['', [Validators.required, Validators.pattern('([0-9]{8,10})+-[0-9]{1}')]],
      clave: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20)]],
    });
  }

  ngOnInit(): void {
  }

  // Métodos

  // Iniciar sesión
  public async iniciarSesion() : Promise<void> {
    
    this.spinner.show();

    var datos: Login = {
      rol: 'proveedor',
      nit: this.formGroup.get('nit')!.value,
      clave: this.formGroup.get('clave')!.value
    };

    await this.seguridadService.iniciarSesion(datos)
      .then((res: string) => {
        if (res == "0") {
          this.router.navigateByUrl('/proveedor/cuenta');
        }
      });

    this.spinner.hide();

  }

  // Navegar a módulo de recuperar cuenta
  public recuperarCuenta() : void {
    this.router.navigateByUrl('/recuperar-clave/proveedor');
  }

  // Obtener los valores del formulario de registro de turista
  get f() { return this.formGroup.controls }

}
