// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { RecuperarCuentaService } from 'src/app/services/recuperar-cuenta.service';

// Validadores
import * as Validadores from 'src/app/validators/validators';

@Component({
  selector: 'app-validar',
  templateUrl: './validar.component.html',
  styleUrls: ['./validar.component.css']
})
export class ValidarComponent implements OnInit {

  // Variables
  private hash?: string;
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
      clave: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20), Validators.pattern("[A-Za-z0-9!?-]*")]],
      confirmarClave: ['', [Validators.required]]
    }, {
      validators: [
        Validadores.clavesIguales('clave', 'confirmarClave')
      ]
    });
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    await this.obtenerHash()
      .then(res => {
        this.hash = res;
        if (this.hash == null || this.hash == undefined) {
          this.router.navigateByUrl('/iniciar-sesion');
          this.alertaService.error('Ha ocurrido un error inesperado, inténtalo nuevamente');
        }
      });

    this.spinner.hide();

  }

  // Métodos

  // Cambiar clave de usuario
  public async cambiarClave() : Promise<void> {

    this.spinner.show();    

    if (this.formGroup.valid) {

      var clave = this.formGroup.get('clave')!.value;

      await this.recuperarCuentaService.cambiarClave(this.hash!, clave)
        .then(res => {
          if (res == '0') {
            this.alertaService.confirmacion('Clave actualizada correctamente, ya puedes iniciar sesión');
            this.router.navigateByUrl('/iniciar-sesion');
            sessionStorage.removeItem('rc-email');
          } else
            this.alertaService.error(res);
        });

    } else
      this.alertaService.error('Completa el formulario correctamente');

    this.spinner.hide();

  }

  // Obtener el hash de la url
  private async obtenerHash() : Promise<string> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve(params.get('hash')!);
        });
    });
  }

  // Obtener los valores del formulario de cambiar clave
  get f() { return this.formGroup.controls }

}
