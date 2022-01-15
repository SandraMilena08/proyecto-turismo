// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { CodigoPuntuacionComponent } from './codigo-puntuacion.component';

const routes: Routes = [
  {
    path: '',
    component: CodigoPuntuacionComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CodigoPuntuacionRoutingModule { }
