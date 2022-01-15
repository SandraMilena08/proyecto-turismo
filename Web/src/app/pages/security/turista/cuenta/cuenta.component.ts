// Módulos
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { TuristaService } from 'src/app/services/turista.service';

// Interfaces
import { Turista } from 'src/app/interfaces/turista.interface';

// Validadores
import * as Validadores from 'src/app/validators/validators';

@Component({
  selector: 'app-cuenta',
  templateUrl: './cuenta.component.html',
  styleUrls: ['./cuenta.component.css']
})
export class CuentaComponent implements OnInit {

  // Variables
  public icono?: string;
  private turista?: Turista;
  private hash?: string | null;
  public indiceIcono: number;
  public formGroup?: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private turistaService: TuristaService
  ) { 
    this.indiceIcono = 0;
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    this.hash = this.authService.retornarHash();

    if (this.hash != null) {

      await this.turistaService.leer(this.hash)
        .then(res => {

          if (res != null) {

            this.turista = res;  
            this.icono = this.turista.icono;               
            
            switch (this.turista.icono) {
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
            
            const datePipe: DatePipe = new DatePipe('en-US');            
            var fechaNacimiento: Date = new Date(this.turista.fechaNacimiento!);            
            let formattedDate = datePipe.transform(fechaNacimiento, 'YYYY-MM-dd');            

            this.formGroup = this.formBuilder.group({
              nombre: [this.turista.nombre, [Validators.required, Validators.minLength(2), Validators.maxLength(24), Validators.pattern("[A-Za-zÁÉÍÓÚáéíóúÑñ]*")]],
              apellido: [this.turista.apellido, [Validators.minLength(2), Validators.maxLength(24), Validators.pattern("[A-Za-zÁÉÍÓÚáéíóúÑñ]*")]],
              fechaNacimiento: [formattedDate, [Validators.required, Validadores.Edad]],
              email: [this.turista.correoElectronico]             
            });

            this.formGroup.get('email')!.disable();

          }
        });
    }    

    this.spinner.hide();

  }

  // Métodos

  // Actualizar turista
  public async actualizarTurista() : Promise<void> {
    
    this.spinner.show();

    if (this.formGroup!.valid) {

      console.log(this.icono!);

      this.turista!.nombre = this.formGroup!.get('nombre')!.value;
      this.turista!.apellido = this.formGroup!.get('apellido')!.value;
      this.turista!.fechaNacimiento = this.formGroup!.get('fechaNacimiento')!.value;
      this.turista!.icono = this.icono;     
      this.turista!.poblacion = this.turistaService.calcularEdad(this.formGroup!.get('fechaNacimiento')!.value); 

      await this.turistaService.actualizar(this.turista!)
        .then(res => {
          if (res == '0') {
            this.alertaService.confirmacion('Datos actualizados correctamente');
            this.router.navigateByUrl('/turista/cuenta')
              .then(_ => {
                this.turistaService.leer(this.hash!)
                  .then(info => {
                    this.turista = info!;                    
                    this.formGroup?.reset();
                    this.formGroup!.get('nombre')!.setValue(this.turista.nombre);
                    this.formGroup!.get('apellido')!.setValue(this.turista.apellido);
                    this.formGroup!.get('email')!.setValue(this.turista.correoElectronico);

                    const datePipe: DatePipe = new DatePipe('en-US');            
                    var fechaNacimiento: Date = new Date(this.turista.fechaNacimiento!);            
                    let formattedDate = datePipe.transform(fechaNacimiento, 'YYYY-MM-dd'); 
                    this.formGroup!.get('fechaNacimiento')!.setValue(formattedDate);
                  });
              });
          } else
            this.alertaService.error(res);          
        });

    } else
      this.alertaService.error('Completa el formulario correctamente');

    this.spinner.hide();

  }

  // Obtener los valores del formulario de actualizar turista
  get f() { return this.formGroup!.controls }

  // Obtener la cantidad de letras del campo apellido
  get qa() { 
    var apellido: string = this.formGroup!.get('apellido')?.value;
    return apellido.length;
  }

}
