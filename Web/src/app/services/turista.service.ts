// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Interfaces
import { Turista } from '../interfaces/turista.interface';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from './alerta.service';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class TuristaService {

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

  // Crear turista
  public async crear(turista: Turista) : Promise<string> {
    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/turista`, turista, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          sessionStorage.removeItem('email-verificar');
          sessionStorage.setItem('email-verificar', turista.correoElectronico!);
          resolve("0"); // Turista creado correctamente
        }, (err: HttpErrorResponse) => {
          if (err.status != 500)
            resolve(err.error.error.message);
          else
            resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        });
    });
  }

  // Leer turista filtrado por hash
  public async leer(hash: string) : Promise<Turista | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/turista/${ hash }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {          
          resolve(res.body.turista);
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

  // Verificar si un correo electrónico existe
  public async verificarEmail(email: string) : Promise<string> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/turista/verificar/${ email }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          resolve(res.body.existe == true ? 'si' : 'Para puntuar planes y servicios turísticos debes estar registrado en la plataforma');
        }, (err: HttpErrorResponse) => {          
          if (err.status != 500)
            resolve(err.error.error.message);
          else
            resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        });
    });
  }

  // Actualizar turista
  public async actualizar(turista: Turista) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/turista`, turista, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
          localStorage.setItem('bD5QwHWPV4XeSS3cPVPw', res.body.informacion.token);          
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

  // Calcular la edad de un turista
  public calcularEdad(fecha: string) : string {

    const fechaActual: Date = new Date();
    const fechaNacimiento: Date = new Date(fecha);

    var edad: number = fechaActual.getFullYear() - fechaNacimiento.getFullYear();        

    if (fechaNacimiento.getMonth() > fechaActual.getMonth()) edad--;

    // Verificar si todos los navegadores restan un día a la fecha que se ingrese **
    if (fechaNacimiento.getMonth() == fechaActual.getMonth())
        if ((fechaNacimiento.getDate() + 1) > fechaActual.getDate()) edad--; // ** fechaNacimiento.getDate() + 1

    if (edad >= 18 && edad <= 24) return "Jóvenes";
    else if (edad >= 25 && edad <= 39) return "Adultos jóvenes";
    else if (edad >= 40 && edad <= 54) return "Adultos";
    else if (edad >= 55 && edad <= 64) return "Adultos mayores";
    else if (edad >= 65 && edad <= 74) return "Ancianos";
    else return "Longevos"; // >= 75 años

  }

}
