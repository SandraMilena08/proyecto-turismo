// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { CrearRegistroComponent } from './crear-registro.component';

const routes: Routes = [
  {
    path: '',
    component: CrearRegistroComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CrearRegistroRoutingModule { }
