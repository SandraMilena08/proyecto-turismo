// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: 'crear',
    loadChildren: () => import('./crear/crear.module').then(m => m.CrearModule)
  },
  {
    path: ':id',
    loadChildren: () => import('./leer/leer.module').then(m => m.LeerModule)
  },
  {
    path: 'editar/:id',
    loadChildren: () => import('./actualizar/actualizar.module').then(m => m.ActualizarModule)
  },
  {
    path: 'codigo-puntuacion/:id',
    loadChildren: () => import('./codigo-puntuacion/codigo-puntuacion.module').then(m => m.CodigoPuntuacionModule)
  },
  {
    path: '',
    loadChildren: () => import('./listar/listar.module').then(m => m.ListarModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ServiciosRoutingModule { }
