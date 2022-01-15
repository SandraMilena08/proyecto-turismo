// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { VerComponent } from './ver.component';

const routes: Routes = [
  {
    path: '',
    component: VerComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class VerRoutingModule { }
