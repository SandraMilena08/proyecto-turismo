// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { RecuperarCuentaService } from 'src/app/services/recuperar-cuenta.service';

@Component({
  selector: 'app-crear-registro',
  templateUrl: './crear-registro.component.html',
  styleUrls: ['./crear-registro.component.css']
})
export class CrearRegistroComponent implements OnInit {

  // Variables
  private rol?: string;
  public formGroup: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute,
    private recuperarCuentaService: RecuperarCuentaService
  ) { 
    this.formGroup = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]]
    });    
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    await this.obtenerRol()
      .then(res => {
        this.rol = res;
        switch (this.rol) {
          case "turista":
          case "proveedor":
          case "administrador":
            break;
          default:
            this.alertaService.error("Ha ocurrido un error, inténtalo nuevamente");
            this.router.navigateByUrl('/iniciar-sesion');
        }
      });

    this.spinner.hide();
  }

  // Métodos

  // Crear solicitud de recuperar cuenta
  public async recuperarCuenta() : Promise<void> {

    this.spinner.show();

    if (this.formGroup.get('email')?.valid) {

      var email: string = this.formGroup.get('email')?.value;    

      await this.recuperarCuentaService.crear(email, this.rol!)
        .then((res: string) => {
          if (res == '0') {
            sessionStorage.removeItem('rc-email');
            sessionStorage.setItem('rc-email', email);
            this.router.navigateByUrl('/recuperar-clave/ok/confirmacion');
          } else
            this.alertaService.error(res);
        });

    } else
      this.alertaService.error('Completa el formulario correctamente');

    this.spinner.hide();

  }

  // Obtener el rol de la url
  private async obtenerRol() : Promise<string> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve(params.get('rol')!);
        });
    });
  }

  // Obtener los valores del formulario de recuperar clave
  get f() { return this.formGroup.controls }

}
