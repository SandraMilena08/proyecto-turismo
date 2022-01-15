// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';

// Interfaces
import { PuntuacionServicio } from '../interfaces/puntuacion-servicio.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class PuntuacionServicioService {

  // Variables
  private httpHeaders?: HttpHeaders;

  // Constructor
  constructor(
    private router: Router,
    private http: HttpClient,
    private authService: AuthService
  ) { }

  // Métodos

  // Crear registro de puntuación de servicio turístico
  public async crear(puntuacion: PuntuacionServicio, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
    .then(res => {
      this.httpHeaders = res;
    });

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/puntuacionservicio/${ hash }/${ email }`, puntuacion, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          resolve("0");          
        }, (err: HttpErrorResponse) => {          
          if (err.status == 401) {
            localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
            this.router.navigateByUrl('/iniciar-sesion');
            resolve("Tu sesión ha caducado, inicia sesión nuevamente");
          } else if (err.status == 500)
            resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
          else
            resolve(err.error.error.message);
        });
    });

  }

  // Puntuar servicio turístico
  public async puntuarServicio(servicioId: number, email: string, puntuacion: number) : Promise<string> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/puntuacionservicio/${ servicioId }/${ email }/${ puntuacion }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          resolve("0");
        }, (err: HttpErrorResponse) => {
          if (err.status != 500)
            resolve(err.error.error.message);
          else
            resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        });
    });
  }

}
