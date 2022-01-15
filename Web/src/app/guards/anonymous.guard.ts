// Módulos
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { Router, ActivatedRouteSnapshot, CanActivate, RouterStateSnapshot, UrlTree } from '@angular/router';

// Servicios
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AnonymousGuard implements CanActivate {

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService
  ) { }

  // Métodos

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
      
    const rol: string = this.authService.retornarRol();    

    if (route.url.toString() == 'inicio' || route.url.toString().split(',')[0] == 'servicios' || route.url.toString().split(',')[0] == 'planes') {

      switch (rol) {
        case "proveedor":
        case "administrador":
          this.router.navigateByUrl(`${ rol }/cuenta`);
          return false;
      }

    } else {      

      switch (rol) {      
        case "turista":
        case "proveedor":
        case "administrador":
          this.router.navigateByUrl(`${ rol }/cuenta`);
          return false;
      }

    }          

    return true;

  }
  
}
