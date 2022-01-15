// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { PuntuacionServicioService } from 'src/app/services/puntuacion-servicio.service';

// Interfaces
import { PuntuacionServicio } from 'src/app/interfaces/puntuacion-servicio.interface';

@Component({
  selector: 'app-codigo-puntuacion',
  templateUrl: './codigo-puntuacion.component.html',
  styleUrls: ['./codigo-puntuacion.component.css']
})
export class CodigoPuntuacionComponent implements OnInit {

  // Variables
  private id?: number;
  public formGroup: FormGroup;
  private hash?: string | null;
  private email?: string | null;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute,
    private puntuacionServicioService: PuntuacionServicioService
  ) { 
    this.formGroup = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]]
    });
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    this.hash = this.authService.retornarHash();
    this.email = this.authService.retornarEmail();

    await this.obtenerId()
      .then(res => this.id = Number(res).valueOf());

    this.spinner.hide();

  }

  // Métodos

  // Crear registro de puntuación de servicio turístico
  public async generarCodigoPuntuacion() : Promise<void> {

    this.spinner.show();

    if (this.formGroup.valid) {

      var puntuacion: PuntuacionServicio = {
        email: this.formGroup.get('email')!.value,
        servicioId: this.id,        
      };

      puntuacion.email = puntuacion.email!.trim();

      await this.puntuacionServicioService.crear(puntuacion, this.hash!, this.email!)
        .then(res => {
          if (res == "0") {
            this.alertaService.confirmacion('Código de puntuación de servicio turístico generado correctamente');
            this.router.navigateByUrl('proveedor/servicios');
          } else
            this.alertaService.error(res);
        });

    } else
      this.alertaService.error('Completa el formulario correctamente');

    this.spinner.hide();

  }

  // Obtener el id del servicio turístico de la url
  private async obtenerId() : Promise<string> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve(params.get('id')!);
        });
    });
  }

  // Obtener los valores del formulario de crear registro de puntuación de servicio turístico
  get f() { return this.formGroup!.controls } 

}
