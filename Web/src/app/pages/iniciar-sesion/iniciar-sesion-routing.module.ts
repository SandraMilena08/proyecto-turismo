// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { IniciarSesionComponent } from './iniciar-sesion.component';

const routes: Routes = [
  {
    path: '',
    component: IniciarSesionComponent
  },
  {
    path: 'turista',
    loadChildren: () => import('./turista/turista.module').then(m => m.TuristaModule)
  },
  {
    path: 'proveedor',
    loadChildren: () => import('./proveedor/proveedor.module').then(m => m.ProveedorModule)
  },
  {
    path: 'TMBRkXShGtVXTXi',
    loadChildren: () => import('./administrador/administrador.module').then(m => m.AdministradorModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class IniciarSesionRoutingModule { }
