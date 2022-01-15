// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

// Serivicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { PreRegistroService } from 'src/app/services/pre-registro.service';

@Component({
  selector: 'app-hash',
  templateUrl: './hash.component.html',
  styleUrls: ['./hash.component.css']
})
export class HashComponent implements OnInit {

  // Variables
  private hash?: string | null;

  // Constructor
  constructor(
    private router: Router,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute,
    private preRegistroService: PreRegistroService
  ) { }

  async ngOnInit(): Promise<void> {
    
    this.spinner.show();

    await this.obtenerHash()
      .then(res => {
        this.hash = res;
        this.preRegistroService.validarCodigo(this.hash)
          .then((resp: string) => {
            if (resp == "0")
              this.alertaService.confirmacion("Cuenta verificada correctamente");
            else {
              this.alertaService.error(resp);
              this.router.navigateByUrl('/iniciar-sesion');
            }
          });
      });
      
    this.spinner.hide();

  }

  // Métodos

  // Redireccionar a iniciar sesión
  public redireccionar() : void {
    this.router.navigateByUrl('/iniciar-sesion');
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

}
