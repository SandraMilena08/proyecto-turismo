// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { OkComponent } from './ok.component';

const routes: Routes = [
  {
    path: '',
    component: OkComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class OkRoutingModule { }
