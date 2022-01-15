// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: ':id',
    loadChildren: () => import('./ver/ver.module').then(m => m.VerModule)
  },
  {
    path: ':pag/:qnt',
    loadChildren: () => import('./listar/listar.module').then(m => m.ListarModule)
  }  
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ServiciosRoutingModule { }
