// Módulos
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpResponse } from '@angular/common/http';

// Environments
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class PreRegistroService {

  // Constructor
  constructor(
    private http: HttpClient
  ) { }

  // Métodos

  // Reenviar código de verificación
  public async reenviarCodigo(email: string) : Promise<any> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/usuario/codigo/reenviar/${ email }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          resolve("0"); // Código reenviado correctamente
        }, (err: HttpErrorResponse) => {
          if (err.status != 500)
            resolve(err.error.error.message);
          else
            resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        });
    });
  }

  // Validar código de verificación
  public async validarCodigo(hash: string) : Promise<string> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/usuario/codigo/validar/${ hash }`, { observe: 'response' })
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
