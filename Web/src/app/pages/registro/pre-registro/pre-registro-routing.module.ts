// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { PreRegistroComponent } from './pre-registro.component';

const routes: Routes = [
  {
    path: '',
    component: PreRegistroComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PreRegistroRoutingModule { }
