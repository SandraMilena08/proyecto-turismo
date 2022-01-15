// Módulos
import { Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';

// Servicios
import { AuthService } from './auth.service';
import { AlertaService } from './alerta.service'; 

// Interfaces
import { Plan } from '../interfaces/plan.interface';
import { Paginado } from '../interfaces/paginado.interface';
import { Busqueda } from '../interfaces/busqueda.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebAPI = environment.webAPI;

@Injectable({
  providedIn: 'root'
})
export class PlanService {

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

  // Crear plan turístico
  public async crear(plan: Plan, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/plan/${ hash }/${ email }`, plan, { observe: 'response', headers: this.httpHeaders })
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

  // Leer plan turístico para turista
  public async leerForTurista(id: number) : Promise<any | null> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/t/${ id }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          console.log(res.body); // * Borrar *
          resolve(res.body);
        }, (err: HttpErrorResponse) => {
          if (err.status != 500)
            this.alertaService.error(err.error.error.message);
          else
            this.alertaService.error("Ha ocurrido un error inesperado! Inténtalo nuevamente.");

          resolve(null);
        });
    });
  }

  // Leer plan turístico para administrador
  public async leerForAdministrador(id: number, estado: boolean) : Promise<any | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });
    
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/a/${ id }/${ estado }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          console.log(res.body); // * Borrar *
          resolve(res.body);
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

  // Leer plan turístico
  public async leerId(id: number) : Promise<Plan | null> {
    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/${ id }`, { observe: 'response' })
        .subscribe((res: HttpResponse<any>) => {
          resolve(res.body.plan);
        }, (err: HttpErrorResponse) => {
          resolve(null);
        });
    });
  }

  // Leer planes turísticos del proveedor
  public async leerXProveedor(hash: string, email: string, inicio: number, cantidad: number) : Promise<Plan[] | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/${ hash }/${ email }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);
          else resolve(res.body.listaPlanes);
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

  // Leer plan turístico
  public async leer(id: number, hash: string, email: string) : Promise<Plan | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/${ id }/${ hash }/${ email }`, { observe: 'response', headers: this.httpHeaders })
        .subscribe((res: HttpResponse<any>) => {
          if (res.status == 204) resolve(null);          
          else resolve(res.body.plan);
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

  // Leer planes turísticos paginados filtrados por estado habilitado
  public async leerXEstadoHabilitado(pagina: number, cantidad: number, estado: boolean) : Promise<Paginado<Plan> | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/pag/${ pagina }${ cantidad }/${ estado }`, { observe: 'response', headers: this.httpHeaders })
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

  // Leer planes turísticos paginados filtrados
  public async leerPaginado(parametros: Busqueda, pagina: number, cantidad: number) : Promise<Paginado<Plan> | null> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/plan/pag/${ pagina }/${ cantidad }`, parametros, { observe: 'response', headers: this.httpHeaders })
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

  // Leer planes turísticos paginados filtrados para turistas
  public async leerPaginadoTurista(parametros: Busqueda, pagina: number, cantidad: number) : Promise<Paginado<Plan> | null> {  

    return new Promise(resolve => {
      this.http.post(`${ WebAPI }/plan/pag/t/${ pagina }/${ cantidad }`, parametros, { observe: 'response' })
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

  // Actualizar plan turístico
  public async actualizar(plan: Plan, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/plan/${ hash }/${ email }`, plan, { observe: 'response', headers: this.httpHeaders })
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

  // Actualizar imágenes de un plan turístico
  public async actualizarImagenes(id: number, imagenes: File[], hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => this.httpHeaders = res);

    const formData = new FormData();    
    for (let i = 0; i < imagenes.length; i++) formData.append('img', imagenes[i], imagenes[i].name);      

    return new Promise(resolve => {
      this.http.put(`${ WebAPI }/plan/imagenes/${ id }/${ hash }/${ email }`, formData, { observe: 'response', headers: this.httpHeaders })
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

  // Actualizar el estado de habilitado de un plan turístico
  public async actualizarEstadoHabilitado(id: number) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => this.httpHeaders = res);

    return new Promise(resolve => {
      this.http.get(`${ WebAPI }/plan/habilitado/${ id }`, { observe: 'response', headers: this.httpHeaders })
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

  // Eliminar plan turístico
  public async eliminar(id: number, hash: string, email: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.delete(`${ WebAPI }/plan/${ id }/${ hash }/${ email }`, { observe: 'response', headers: this.httpHeaders })
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

  // Eliminar imagen de un plan turístico
  public async eliminarImagen(id: number, hash: string, email: string, direccionImagen: string) : Promise<string> {

    await this.authService.prepareHeaders()
      .then(res => {
        this.httpHeaders = res;
      });

    return new Promise(resolve => {
      this.http.delete(`${ WebAPI }/plan/imagenes/${ id }/${ hash }/${ email }/${ direccionImagen }`, { observe: 'response', headers: this.httpHeaders })
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
