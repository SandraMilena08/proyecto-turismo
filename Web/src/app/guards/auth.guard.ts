// Módulos
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { Router, ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from '@angular/router';

// Servicios
import { AuthService } from '../services/auth.service';
import { AlertaService } from '../services/alerta.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private alertaService: AlertaService
  ) { }

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {      

    var authOk: string = this.authService.validarToken(route.url.toString());    

    if (authOk == "0")
      return true;
    else if (authOk == "1") {
      this.alertaService.error('Tu sesión ha caducado');
      this.router.navigateByUrl('/iniciar-sesion');
    } else {
      this.alertaService.error('Tu cuenta no ha sido verificada, completa el registro correctamente');
      this.router.navigateByUrl('/registro/pre-registro');
    }
        
    return false;

  }
  
}
