// Módulos
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from './alerta.service';

// Interfaces
import { Proveedor } from '../interfaces/proveedor.interface';
import { BusquedaProveedor } from '../interfaces/busqueda-proveedor.interface';

// Environment
import { environment } from 'src/environments/environment';
import { Paginado } from '../interfaces/paginado.interface';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class ProveedorService {

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

  // Crear proveedor
  public async crear(proveedor: Proveedor) : Promise<string> {
    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/proveedor`, proveedor, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          sessionStorage.removeItem('email-verificar');
          sessionStorage.setItem('email-verificar', proveedor.correoElectronico!);
          resolve("0"); // Proveedor creado correctamente
        }, (err: HttpErrorResponse) => {          
            if (err.status != 500)
              resolve(err.error.error.message);
            else
              resolve("Ha ocurrido un error inesperado! Inténtalo nuevamente.");
        });
    });
  }

  // Leer proveedor filtrado por hash
  public async leer(hash: string) : Promise<Proveedor | null> {
   
    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/proveedor/${ hash }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {          
          resolve(res.body.proveedor);
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

  // Leer proveedores paginados filtrados
  public async leerPaginado(parametros: BusquedaProveedor, pagina: number, cantidad: number) : Promise<Paginado<Proveedor> | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/proveedor/pag/${ pagina }/${ cantidad }`, parametros, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);
          else resolve(res.body.informacion);
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

  // Actualizar información personal de proveedor
  public async actualizar(proveedor: Proveedor) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/proveedor`, proveedor, { observe: 'response', headers: this.httpHeaders })
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

  // Actualizar icono
  public async actualizarIcono(icono: File, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    const formData = new FormData();
    formData.append('imagen', icono);

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/proveedor/${ hash }/${ email }`, formData, { observe: 'response', headers: this.httpHeaders })
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

  // Actualizar el estado de habilitado de un proveedor
  public async actualizarEstado(hash: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/proveedor/habilitado/${ hash }`, { observe: 'response', headers: this.httpHeaders })
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

  // Validar la integridad de un nit
  public validarNit(nit: string) : any {
    return this.http.get(`${ WebAPI }/proveedor/nit/${ nit }`)
      .pipe(map((res: any) => res['existe']));
  }

}
