// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: ':rol',
    loadChildren: () => import('./crear-registro/crear-registro.module').then(m => m.CrearRegistroModule)
  },  
  {
    path: 'ok/confirmacion',
    loadChildren: () => import('./ok/ok.module').then(m => m.OkModule)
  },
  {
    path: 'hash/:hash',
    loadChildren: () => import('./validar/validar.module').then(m => m.ValidarModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RecuperarClaveRoutingModule { }
