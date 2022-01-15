// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'servicios/:pag/:qnt',
    loadChildren: () => import('./servicios/servicios.module').then(m => m.ServiciosModule)
  },
  {
    path: 'planes/:pag/:qnt',
    loadChildren: () => import('./planes/planes.module').then(m => m.PlanesModule)
  },
  {
    path: 'proveedores/:pag/:qnt',
    loadChildren: () => import('./proveedores/proveedores.module').then(m => m.ProveedoresModule)
  },
  {
    path: 'reportes',
    loadChildren: () => import('./reportes/reportes.module').then(m => m.ReportesModule)
  },
  {
    path: 'cuenta',
    loadChildren: () => import('./cuenta/cuenta.module').then(m => m.CuentaModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdministradorRoutingModule { }
