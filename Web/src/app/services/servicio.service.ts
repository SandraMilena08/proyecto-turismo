// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from './alerta.service';

// Interfaces
import { Servicio } from '../interfaces/servicio.interface';
import { Paginado } from '../interfaces/paginado.interface';
import { Busqueda } from '../interfaces/busqueda.interface';

// Environments
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class ServicioService {

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

  // Crear servicio turístico
  public async crear(servicio: Servicio, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/servicio/${ hash }/${ email }`, servicio, { observe: 'response', headers: this.httpHeaders })
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

  // Leer un servicio turístico para turista
  public async leerForTurista(id: number) : Promise<any | null> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/t/${ id }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {          
          resolve(res.body.datos);
        }, (err: HttpErrorResponse) => {          
          if (err.status != 500)
          this.alertaService.error(err.error.error.message);
          else
            this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");

          resolve(null);
        });
    });
  }

  // Leer un servicio turístico para administrador
  public async leerForAdministrador(id: number, estado: boolean) : Promise<any | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/a/${ id }/${ estado }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {          
          resolve(res.body.datos);
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

  // Leer servicio turístico
  public async leerId(id: number) : Promise<Servicio | null> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/${ id }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          resolve(res.body.servicio);
        }, (err: HttpErrorResponse) => {
          resolve(null);
        });
    });
  }

  // Leer servicios turísticos de proveedor
  public async leerXProveedor(hash: string, email: string, inicio: number, cantidad: number) : Promise<Servicio[] | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/${ hash }/${ email }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);          
          else resolve(res.body.listaServicios);
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

  // Leer servicio turístico
  public async leer(id: number, hash: string, email: string) : Promise<Servicio | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/${ id }/${ hash }/${ email }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {              
          if (res.status == 204) resolve(null);          
          else resolve(res.body.servicio);
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

  // Leer servicios turísticos paginados filtrados por estado habilitado
  public async leerXEstadoHabilitado(pagina: number, cantidad: number, estado: boolean) : Promise<Paginado<Servicio> | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/pag/${ pagina }/${ cantidad }/${ estado }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          console.log(res);
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

  // Leer servicios turísticos paginados con filtros
  public async leerPaginado(parametros: Busqueda, pagina: number, cantidad: number) : Promise<Paginado<Servicio> | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/servicio/pag/${ pagina }/${ cantidad }`, parametros, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);
          else resolve(res.body.informacion);
        }, (err: HttpErrorResponse) => {
          if (err.status != 500)
            this.alertaService.error(err.error.error.message);
          else
            this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");

          resolve(null);
        });
    });
  }

  // Leer servicios turísticos paginados con filtros para turistas
  public async leerPaginadoTurista(parametros: Busqueda, pagina: number, cantidad: number) : Promise<Paginado<Servicio> | null> {

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/servicio/pag/t/${ pagina }/${ cantidad }`, parametros, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);
          else resolve(res.body.informacion);
        }, (err: HttpErrorResponse) => {
          if (err.status != 500)
          this.alertaService.error(err.error.error.message);
          else
            this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");

          resolve(null);
        });
    });

  }

  // Actualizar servicio turístico
  public async actualizar(servicio: Servicio, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/servicio/${ hash }/${ email }`, servicio, { observe: 'response', headers: this.httpHeaders })
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

  // Actualizar imágenes de un servicio turístico
  public async actualizarImagenes(id: number, imagenes: File[], hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => this.httpHeaders = res);

    const formData = new FormData();    
    for (let i = 0; i < imagenes.length; i++) formData.append('img', imagenes[i], imagenes[i].name);      

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/servicio/imagenes/${ id }/${ hash }/${ email }`, formData, { observe: 'response', headers: this.httpHeaders } )
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

  // Actualizar el estado de habilitado de un servicio turístico
  public async actualizarEstadoHabilitado(id: number) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => this.httpHeaders = res);

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/servicio/habilitado/${ id }`, { observe: 'response', headers: this.httpHeaders })
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

  // Eliminar servicio turístico
  public async eliminar(id: number, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.delete(`${ WebAPI }/servicio/${ id }/${ hash }/${ email }`, { observe: 'response', headers: this.httpHeaders })
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

  // Eliminar imagen de un servicio turístico
  public async eliminarImagen(id: number, hash: string, email: string, direccionImagen: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.delete(`${ WebAPI }/servicio/imagenes/${ id }/${ hash }/${ email }/${ direccionImagen }`, { observe: 'response', headers: this.httpHeaders })
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

}
