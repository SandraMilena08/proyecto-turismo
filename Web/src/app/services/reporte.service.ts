// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from './alerta.service'; 

// Interfaces
import { RadarChart } from '../interfaces/radar-chart.interface';
import { BarChart } from 'src/app/interfaces/bar-chart.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class ReporteService {
  
  // Variables
  private httpHeaders?: HttpHeaders;

  // Constructor
  constructor(
    private router: Router,
    private http: HttpClient,
    private authService: AuthService,
    private alertaService: AlertaService
  ) { }

  // Métodos

  public async mejoresMunicipios(month: number, year: number) : Promise<number[] | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/reporte/${ month }/${ year }`, { observe: 'response', headers: this.httpHeaders })
      .subscribe((res: HttpResponse<any>) => {
        if (res.status == 204) resolve(null);
        else resolve(res.body.datos);
      }, (err: HttpErrorResponse) => {
        if (err.status == 401) {
          localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
          this.router.navigateByUrl('/iniciar-sesion');
          this.alertaService.error("Tu sesión ha caducado, inicia sesión nuevamente");
        } else if (err.status == 500)
          this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        else
          this.alertaService.error(err.error.error.message);

        resolve(null);        
      });
    });

  }

  public async mejoresServiciosTuristicos(month: number, year: number, municipio: string) : Promise<BarChart[] | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/reporte/servicios/${ month }/${ year }/${ municipio }`, { observe: 'response', headers: this.httpHeaders })
      .subscribe((res: HttpResponse<any>) => {
        if (res.status == 204) resolve(null);
        else resolve(res.body.datos);
      }, (err: HttpErrorResponse) => {
        if (err.status == 401) {
          localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
          this.router.navigateByUrl('/iniciar-sesion');
          this.alertaService.error("Tu sesión ha caducado, inicia sesión nuevamente");
        } else if (err.status == 500)
          this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        else
          this.alertaService.error(err.error.error.message);

        resolve(null);
      });
    });

  }

  public async mejoresPlanesTuristicos(month: number, year: number, municipio: string) : Promise<BarChart[] | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/reporte/planes/${ month }/${ year }/${ municipio }`, { observe: 'response', headers: this.httpHeaders })
      .subscribe((res: HttpResponse<any>) => {
        if (res.status == 204) resolve(null);
        else resolve(res.body.datos);
      }, (err: HttpErrorResponse) => {
        if (err.status == 401) {
          localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
          this.router.navigateByUrl('/iniciar-sesion');
          this.alertaService.error("Tu sesión ha caducado, inicia sesión nuevamente");
        } else if (err.status == 500)
          this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        else
          this.alertaService.error(err.error.error.message);

        resolve(null);
      });
    });

  }

  public async categoriasEdad(month: number, year: number) : Promise<RadarChart[] | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/reporte/categorias/${ month }/${ year }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);
          else resolve(res.body.datos);
        }, (err: HttpErrorResponse) => {
          if (err.status == 401) {
            localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
            this.router.navigateByUrl('/iniciar-sesion');
            this.alertaService.error("Tu sesión ha caducado, inicia sesión nuevamente");
          } else if (err.status == 500)
            this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
          else
            this.alertaService.error(err.error.error.message);
  
          resolve(null);
        });
    });

  }

}
