// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { PreRegistroService } from 'src/app/services/pre-registro.service';

@Component({
  selector: 'app-pre-registro',
  templateUrl: './pre-registro.component.html',
  styleUrls: ['./pre-registro.component.css']
})
export class PreRegistroComponent implements OnInit {

  // Variables
  private email?: string | null;

  // Constructor
  constructor(
    private router: Router,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private preRegistroService: PreRegistroService
  ) { }

  ngOnInit(): void {
    this.spinner.show();

    this.email = sessionStorage.getItem('email-verificar');
    if (this.email == null)
      this.router.navigateByUrl('/iniciar-sesion');

    this.spinner.hide();
  }

  // Métodos

  // Reenviar código de verificación
  public async reenviarCodigo() : Promise<void> {

    this.spinner.show();

    await this.preRegistroService.reenviarCodigo(this.email!)
      .then((res: string) => {
        if (res == "0")
          this.alertaService.confirmacion("Código de verificación enviado correctamente");
        else {
          this.alertaService.error(res);
          this.router.navigateByUrl('/iniciar-sesion');
        }
      });

    this.spinner.hide();

  }

}
