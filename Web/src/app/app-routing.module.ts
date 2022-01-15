// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AnonymousGuard } from './guards/anonymous.guard';

// Guardianes
import { AuthGuard } from './guards/auth.guard';

const routes: Routes = [
  {
    path: 'inicio',
    loadChildren: () => import('./pages/inicio/inicio.module').then(m => m.InicioModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'registro',
    loadChildren: () => import('./pages/registro/registro.module').then(m => m.RegistroModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'iniciar-sesion',
    loadChildren: () => import('./pages/iniciar-sesion/iniciar-sesion.module').then(m => m.IniciarSesionModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'recuperar-clave',
    loadChildren: () => import('./pages/recuperar-clave/recuperar-clave.module').then(m => m.RecuperarClaveModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'servicios',
    loadChildren: () => import('./pages/servicios/servicios.module').then(m => m.ServiciosModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'planes',
    loadChildren: () => import('./pages/planes/planes.module').then(m => m.PlanesModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'puntuacion/:modulo/:otId/:email',
    loadChildren: () => import('./pages/puntuacion/puntuacion.module').then(m => m.PuntuacionModule),
    canActivate: [AnonymousGuard]
  },
  {
    path: 'turista',
    loadChildren: () => import('./pages/security/turista/turista.module').then(m => m.TuristaModule),
    canActivate: [AuthGuard]
  },
  {
    path: 'proveedor',
    loadChildren: () => import('./pages/security/proveedor/proveedor.module').then(m => m.ProveedorModule),
    canActivate: [AuthGuard]
  },
  {
    path: 'administrador',
    loadChildren: () => import('./pages/security/administrador/administrador.module').then(m => m.AdministradorModule),
    canActivate: [AuthGuard]
  },
  {
    path: '',
    redirectTo: 'inicio',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
