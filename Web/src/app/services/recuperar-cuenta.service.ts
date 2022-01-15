// Módulos
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpResponse } from '@angular/common/http';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class RecuperarCuentaService {

  // Constructor
  constructor(
    private http: HttpClient
  ) { }

  // Métodos

  // Crear solicitud de recuperar cuenta
  public async crear(email: string, rol: string) : Promise<string> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/recuperarcuenta/${ email }/${ rol }`, { observe: 'response' })
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

  // Cambiar la clave del usuario
  public async cambiarClave(hash: string, clave: string) : Promise<string> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/recuperarcuenta/cambiar-clave/${ hash }/${ clave }`, { observe: 'response' })
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

  // Reenviar código de recuperar clave
  public async reenviarCodigo(email: string) : Promise<string> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/recuperarcuenta/codigo/reenviar/email/${ email }`, { observe: 'response' })
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
