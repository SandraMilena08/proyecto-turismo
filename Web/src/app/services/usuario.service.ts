// Módulos
import { map } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  // Constructor
  constructor(
    private http: HttpClient
  ) { }

  // Métodos

  // Validar la integridad de un correo electrónico
  public validarEmail(email: string) : any {
    return this.http.get(`${ WebAPI }/usuario/email/${ email }`)
      .pipe(map((res: any) => res['existe']));
  }

}
