// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { TuristaService } from 'src/app/services/turista.service'; 

// Directivas
import { EmailDirective } from 'src/app/directives/email.directive';

// Interfaces
import { Turista } from 'src/app/interfaces/turista.interface';

// Validadores
import * as Validadores from 'src/app/validators/validators';

@Component({
  selector: 'app-turista',
  templateUrl: './turista.component.html',
  styleUrls: ['./turista.component.css']
})
export class TuristaComponent implements OnInit {

  // Variables  
  public icono: string;
  public formGroup: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,  
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private emailDirective: EmailDirective,
    private turistaService: TuristaService
  ) { 
    this.icono = 'Avatar/avatar-1.png';
    this.formGroup = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(24), Validators.pattern("[A-Za-zÁÉÍÓÚáéíóúÑñ]*")]],
      apellido: ['', [Validators.minLength(2), Validators.maxLength(24), Validators.pattern("[A-Za-zÁÉÍÓÚáéíóúÑñ]*")]],
      fechaNacimiento: [null, [Validators.required, Validadores.Edad]],
      email: ['', [Validators.required, Validators.email], this.emailDirective.validate.bind(this.emailDirective)],
      clave: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20), Validators.pattern("[A-Za-z0-9!?-]*")]],
      confirmarClave: ['', [Validators.required]]
    }, {
      validators: [
        Validadores.clavesIguales('clave', 'confirmarClave')
      ]
    });
  }

  ngOnInit(): void {
  }

  // Métodos  

  // Crear turista
  public async crearTurista() : Promise<void> {

    this.spinner.show();

    if (this.formGroup.valid) {
      
      var turista: Turista = {
        nombre: this.formGroup.get('nombre')!.value,
        apellido: this.formGroup.get('apellido')!.value,
        icono: this.icono,
        fechaNacimiento: this.formGroup.get('fechaNacimiento')!.value,
        correoElectronico: this.formGroup.get('email')!.value,
        clave: this.formGroup.get('clave')!.value,
        poblacion: this.turistaService.calcularEdad(this.formGroup.get('fechaNacimiento')!.value)
      };

      turista.correoElectronico = turista.correoElectronico!.trim();
      if (turista.apellido != null) turista.apellido = turista.apellido.trim();

      await this.turistaService.crear(turista)
        .then(res => {
          if (res == "0") 
            this.router.navigateByUrl('/registro/pre-registro');
          else
            this.alertaService.error(res);
        });

    } else this.alertaService.error('Completa el formulario correctamente');    

    this.spinner.hide();

  }

  // Obtener los valores del formulario de registro de turista
  get f() { return this.formGroup.controls }

  // Obtener la cantidad de letras del campo apellido
  get qa() { 
    var apellido: string = this.formGroup.get('apellido')?.value;
    return apellido.length;
  }

}
