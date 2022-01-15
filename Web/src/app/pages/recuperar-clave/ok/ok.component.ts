// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { RecuperarCuentaService } from 'src/app/services/recuperar-cuenta.service';

@Component({
  selector: 'app-ok',
  templateUrl: './ok.component.html',
  styleUrls: ['./ok.component.css']
})
export class OkComponent implements OnInit {

  // Variables
  private email?: string | null;

  // Constructor
  constructor(
    private router: Router,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private recuperarCuentaService: RecuperarCuentaService
  ) { }

  ngOnInit(): void {

    this.email = sessionStorage.getItem('rc-email');
    if (this.email == null) {
      this.alertaService.error('Ha ocurrido un error inesperado');
      this.router.navigateByUrl('/iniciar-sesion');
    }

  }

  // Métodos

  // Reenviar código de recuperar clave
  public async reenviarCodigo() : Promise<void> {

    this.spinner.show();

    await this.recuperarCuentaService.reenviarCodigo(this.email!)
      .then(res => {
        if (res == '0')
          this.alertaService.confirmacion('Se ha enviado el código de verificación a tu correo electrónico');
        else
          this.alertaService.error(res);
      });

    this.spinner.hide();

  }

}
