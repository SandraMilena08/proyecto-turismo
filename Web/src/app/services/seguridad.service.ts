// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from 'src/app/services/alerta.service';

// Interfaces
import { Login } from '../interfaces/login.interface';

// Environments
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class SeguridadService {

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

  // Iniciar sesión
  public async iniciarSesion(datos: Login) : Promise<string> {
    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/seguridad/iniciar-sesion`, datos, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {          
          localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
          localStorage.setItem('bD5QwHWPV4XeSS3cPVPw', res.body.token);
          this.alertaService.confirmacion('Sesión iniciada correctamente');                    
          resolve("0");
        }, (err: HttpErrorResponse) => {          
          if (err.status == 400) {
            resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
            this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");            
          } else if (err.status == 409) { // Cuenta no verificada            
            sessionStorage.removeItem('email-verificar');
            sessionStorage.setItem('email-verificar', datos.email!);
            this.alertaService.error('Tu cuenta no ha sido verificada, completa el registro correctamente');
            this.router.navigateByUrl('/registro/pre-registro');
          } else {            
            resolve(err.error.error.message);
            this.alertaService.error(err.error.error.message);
          }
        });
    });
  }

  // Cerrar sesión
  public async cerrarSesion(email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/seguridad/cerrar-sesion/${ email }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
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

}
