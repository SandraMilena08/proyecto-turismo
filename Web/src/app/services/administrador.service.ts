// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from './alerta.service';

// Interfaces
import { Administrador } from '../interfaces/administrador.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class AdministradorService {

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

  // Leer administrador filtrado por hash
  public async leer(hash: string) : Promise<Administrador | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/administrador/${ hash }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          resolve(res.body.administrador);
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

  // Actualizar administrador
  public async actualizar(administrador: Administrador) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/administrador`, administrador, { observe: 'response', headers: this.httpHeaders })
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

}
