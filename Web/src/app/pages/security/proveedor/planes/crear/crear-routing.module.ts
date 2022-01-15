// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { CrearComponent } from './crear.component';

const routes: Routes = [
  {
    path: '',
    component: CrearComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CrearRoutingModule { }
