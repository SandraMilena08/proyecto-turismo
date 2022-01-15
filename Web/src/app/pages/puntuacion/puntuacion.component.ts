// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { PlanService } from 'src/app/services/plan.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { TuristaService } from 'src/app/services/turista.service';
import { ServicioService } from 'src/app/services/servicio.service';
import { PuntuacionPlanService } from 'src/app/services/puntuacion-plan.service';
import { PuntuacionServicioService } from 'src/app/services/puntuacion-servicio.service';


// Interfaces
import { Plan } from 'src/app/interfaces/plan.interface';
import { Servicio } from 'src/app/interfaces/servicio.interface';

// Encuesta
import { ENCUESTA } from 'src/app/extras/mock-encuesta';

@Component({
  selector: 'app-puntuacion',
  templateUrl: './puntuacion.component.html',
  styleUrls: ['./puntuacion.component.css']
})
export class PuntuacionComponent implements OnInit {

  // Variables
  private otId?: number;
  private email?: string;
  public modulo?: string;
  public nombreOT?: string;
  public listaPreguntas: string[];
  private puntuacionSel: boolean[];
  public listaPuntuaciones: number[];

  // Constructor
  constructor(
    private router: Router,
    private planService: PlanService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private turistaService: TuristaService,
    private activatedRoute: ActivatedRoute,
    private servicioService: ServicioService,
    private puntuacionPlanService: PuntuacionPlanService,
    private puntuacionServicioService: PuntuacionServicioService
  ) { 
    this.listaPuntuaciones = [0, 0, 0, 0, 0];
    this.puntuacionSel = [false, false, false, false, false];
    this.listaPreguntas = ENCUESTA;
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    await this.obtenerDatos()
      .then(params => {

        this.otId = Number(params.otId).valueOf();
        this.modulo = params.modulo;
        this.email = params.email;

        this.turistaService.verificarEmail(this.email!)
          .then(res => {             
            if (res != 'si') {
              this.alertaService.error(res);
              this.router.navigateByUrl('registro/turista');
            }
            this.spinner.hide();
          });
        
        if (this.modulo == 'servicio') {
          this.servicioService.leerId(this.otId!)
            .then(res => {
              this.nombreOT = res?.nombre!;
            });
        } else {
          this.planService.leerId(this.otId!)
            .then(res => {
              this.nombreOT = res?.nombre!;
            });
        }

      });    

  }

  // Métodos

  // Puntuar oferta turística
  public async puntuarOfertaTuristica() : Promise<void> {

    this.spinner.show();

    if (this.listaPuntuaciones.filter(x => x == 0).length > 0)
      this.alertaService.error('Responde todas las preguntas de la encuesta');
    else {

      let puntuacion: number = 0;
      this.listaPuntuaciones.forEach(x => puntuacion += x);
      
      if (this.modulo! == 'servicio') {
        await this.puntuacionServicioService.puntuarServicio(this.otId!, this.email!, Math.round(puntuacion / this.listaPuntuaciones.length))
          .then(res => {
            if (res == '0') {
              this.alertaService.confirmacion(`El ${ this.modulo! } turístico: ${ this.nombreOT! } ha sido calificado correctamente`);
            } else {
              this.alertaService.error(res);
            }
          });
      } else {
        await this.puntuacionPlanService.puntuarPlan(this.otId!, this.email!, Math.round(puntuacion / this.listaPuntuaciones.length))
          .then(res => {
            if (res == "0") {
              this.alertaService.confirmacion(`El ${ this.modulo! } turístico: ${ this.nombreOT! } ha sido calificado correctamente`);
            } else {
              this.alertaService.error(res);
            }
          });
      }
    }

    this.spinner.hide();

  }

  // Seleccionar puntuacion
  public seleccionarPuntuacion(indicePregunta: number, indiceEstrella: number) : void {
    this.listaPuntuaciones[indicePregunta] = indiceEstrella;
    this.puntuacionSel[indicePregunta] = true;
    for (let i = 1; i <= 5; i++) {      
      document.getElementsByClassName(`poll__star-${ indicePregunta }${ i }`)[0].classList.remove('poll__stars-btn-active');      
    }
    this.mouseHoverEvent(indicePregunta, indiceEstrella);
  }

  // Evento hover
  public mouseHoverEvent(indicePregunta: number, indiceEstrella: number) : void {        
    for (let i = 1; i <= indiceEstrella; i++) {      
      document.getElementsByClassName(`poll__star-${ indicePregunta }${ i }`)[0].classList.add('poll__stars-btn-active');      
    }
  }

  public mouseLeaveEvent(indicePregunta: number) : void {
    if (this.puntuacionSel[indicePregunta] == false) {
      for (let i = 1; i <= 5; i++) {      
        document.getElementsByClassName(`poll__star-${ indicePregunta }${ i }`)[0].classList.remove('poll__stars-btn-active');      
      }
    } else {
      for (let i = this.listaPuntuaciones[indicePregunta] + 1; i <= 5; i++) {
        document.getElementsByClassName(`poll__star-${ indicePregunta }${ i }`)[0].classList.remove('poll__stars-btn-active');      
      }
    }
  }

  // Obtener la página y cantidad de la url
  private async obtenerDatos() : Promise<{ [key: string]: string }> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve({ 'modulo': params.get('modulo')!, 'otId': params.get('otId')!, 'email': params.get('email')!});
        });
    });
  }

}
