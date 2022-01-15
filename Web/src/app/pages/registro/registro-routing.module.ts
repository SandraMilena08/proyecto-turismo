// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { RegistroComponent } from './registro.component';

const routes: Routes = [
  {
    path: '',
    component: RegistroComponent
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
    path: 'pre-registro',
    loadChildren: () => import('./pre-registro/pre-registro.module').then(m => m.PreRegistroModule)
  },
  {
    path: 'hash/:hash',
    loadChildren: () => import('./hash/hash.module').then(m => m.HashModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RegistroRoutingModule { }
