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
  selector: 'app-turista',
  templateUrl: './turista.component.html',
  styleUrls: ['./turista.component.css']
})
export class TuristaComponent implements OnInit {

  // Variables
  public formGroup: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,    
    private seguridadService: SeguridadService
  ) { 
    this.formGroup = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      clave: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20)]]
    });
  }

  ngOnInit(): void {
  }

  // Métodos

  // Iniciar sesión
  public async iniciarSesion() : Promise<void> {
    
    this.spinner.show();

    var datos: Login = {
      rol: 'turista',
      email: this.formGroup.get('email')!.value,
      clave: this.formGroup.get('clave')!.value
    };

    datos.email = datos.email?.trim();

    await this.seguridadService.iniciarSesion(datos)
      .then((res: string) => {
        if (res == "0") {
          this.router.navigateByUrl('/turista/cuenta');
        }
      });

    this.spinner.hide();

  }

  // Navegar a módulo de recuperar cuenta
  public recuperarCuenta() : void {
    this.router.navigateByUrl('/recuperar-clave/turista');
  }

  // Obtener los valores del formulario de registro de turista
  get f() { return this.formGroup.controls }

}
