// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms'; 

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { AdministradorService } from 'src/app/services/administrador.service';

// Interfaces
import { Administrador } from 'src/app/interfaces/administrador.interface';

@Component({
  selector: 'app-cuenta',
  templateUrl: './cuenta.component.html',
  styleUrls: ['./cuenta.component.css']
})
export class CuentaComponent implements OnInit {

  // Variables
  public icono?: string;
  private hash?: string | null;
  public formGroup?: FormGroup;
  public indiceIcono: number;
  private administrador?: Administrador;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private administradorService: AdministradorService
  ) { 
    this.indiceIcono = 0;
  }

  async ngOnInit(): Promise<void> {
    
    this.spinner.show();

    this.hash = this.authService.retornarHash();

    if (this.hash != null) {

      await this.administradorService.leer(this.hash)
        .then(res => {
          
          if (res != null) {

            this.administrador = res;  
            this.icono = this.administrador.icono;            

            switch (this.administrador.icono) {
              case "Avatar/avatar-1.png":
                this.indiceIcono = 0;
                break;
              case "Avatar/avatar-2.png":
                this.indiceIcono = 1;
              break;
              case "Avatar/avatar-3.png":
                this.indiceIcono = 2;
              break;
              case "Avatar/avatar-4.png":
                this.indiceIcono = 3;
              break;
            }

            this.formGroup = this.formBuilder.group({
              nombre: [this.administrador.nombre, [Validators.required, Validators.minLength(2), Validators.maxLength(24), Validators.pattern("[A-Za-zÁÉÍÓÚáéíóúÑñ]*")]],
              apellido: [this.administrador.apellido, [Validators.minLength(2), Validators.maxLength(24), Validators.pattern("[A-Za-zÁÉÍÓÚáéíóúÑñ]*")]],              
              email: [this.administrador.correoElectronico]             
            });

            this.formGroup.get('email')!.disable();

          }

        });

    }

    this.spinner.hide();

  }

  // Métodos

  // Actualizar administrador
  public async actualizarAdministrador() : Promise<void> {

    this.spinner.show();

    if (this.formGroup!.valid) {
      
      console.log(this.icono);
      this.administrador!.nombre = this.formGroup!.get('nombre')!.value;
      this.administrador!.apellido = this.formGroup!.get('apellido')!.value;      
      this.administrador!.icono = this.icono;

      await this.administradorService.actualizar(this.administrador!)
        .then(res => {
          if (res == '0') {            
            this.alertaService.confirmacion('Datos actualizados correctamente');
            this.router.navigateByUrl('/administrador/cuenta')
              .then(_ => {
                this.administradorService.leer(this.hash!)
                  .then(info => {
                    this.administrador = info!;                    
                    this.formGroup?.reset();
                    this.formGroup!.get('nombre')!.setValue(this.administrador.nombre);
                    this.formGroup!.get('apellido')!.setValue(this.administrador.apellido);
                    this.formGroup!.get('email')!.setValue(this.administrador.correoElectronico);
                  });
              });
          } else
            this.alertaService.error(res); 
        });

    } else
      this.alertaService.error('Completa el formulario correctamente');

    this.spinner.hide();

  }

  // Obtener los valores del formulario de actualizar administrador
  get f() { return this.formGroup!.controls }

  // Obtener la cantidad de letras del campo apellido
  get qa() { 
    var apellido: string = this.formGroup!.get('apellido')?.value;
    return apellido.length;
  }

}
