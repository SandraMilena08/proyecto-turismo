// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpHeaders } from '@angular/common/http';

// Servicios
import { JwtHelperService } from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  // Constructor
  constructor(  
    private router: Router,  
    private jwtService: JwtHelperService
  ) { }

  // Métodos

  // Validar token
  public validarToken(rutaActual: string) : string {

    var token: string = this.jwtService.tokenGetter();          

    if (token != null && token != undefined)
      if (this.jwtService.isTokenExpired(token) == false)
        if (this.validarPermisos(rutaActual) == true)
          if (this.validarUsuarioVerificado() == true)
            return "0"; // Token correcto
          else {
            sessionStorage.removeItem('email-verificar');
            sessionStorage.setItem('email-verificar', this.jwtService.decodeToken().email);
            return "2"; // El usuario no ha verificado la cuenta
          }

    localStorage.removeItem('bD5QwHWPV4XeSS3cPVPw');
    return "1"; // Token corrupto

  }

  // Validar el permiso del usuario
  private validarPermisos(rutaActual: string) : boolean {

    const rol: string = this.jwtService.decodeToken().rol;

    if (rutaActual.includes(rol))
      return true;

    return false;

  }

  // Validar si el usuario esta correctamente validado
  private validarUsuarioVerificado() : boolean {

    const verificado: string = this.jwtService.decodeToken().verificado;

    return verificado.toLowerCase() == 'true' ? true : false;    

  }

  // Retornar la información del usuario
  public retornarEmail() : string | null {

    var token: string = this.jwtService.tokenGetter();   

    if (token != null && token != undefined)
      return this.jwtService.decodeToken().email;

    return null;

  }

  // Retornar hash del usuario
  public retornarHash() : string | null {

    var token: string = this.jwtService.tokenGetter();

    if (token != null && token != undefined)
      return this.jwtService.decodeToken().hash;

    return null;

  }

  // Retornar rol del usuario
  public retornarRol() : string {

    var token: string = this.jwtService.tokenGetter();          

    if (token != null && token != undefined)
      return this.jwtService.decodeToken().rol;      
    
    return "anonimo";

  }

  // Retornar icono y nombre del usuario logeado
  public retornarIconoNombre() : { [key: string]: string } | null {

    var token: string = this.jwtService.tokenGetter();

    if (token != null && token != undefined) {
      const datos = this.jwtService.decodeToken();      
      return { 'icono': datos.icono, 'nombre': datos.nombre };
    }

    return null;
    
  }

  // Retornar el estado de habilitado del proveedor logeado
  public retornarHabilitadoProveedor() : boolean {

    var token: string = this.jwtService.tokenGetter();    

    if (token != null && token != undefined) {
      const habilitado: string = this.jwtService.decodeToken().habilitado;
      return habilitado == 'False' ? false : true;
    }

    return true;

  }

  // Preparar token para peticiones http
  public async prepareHeaders() : Promise<any> {
    return new Promise(resolve => {

      var token: string = this.jwtService.tokenGetter();          

      if (token != null && token != undefined) {
        const headers = new HttpHeaders({
          Authorization: 'Bearer ' + token
        });
        resolve(headers);
      } else
        this.router.navigateByUrl('/iniciar-sesion');

    });
  }

}