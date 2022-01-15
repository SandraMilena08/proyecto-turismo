// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { TuristaComponent } from './turista.component';

const routes: Routes = [
  {
    path: '',
    component: TuristaComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TuristaRoutingModule { }
