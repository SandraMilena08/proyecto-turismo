// Módulos
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

// Componentes
import { LeerComponent } from './leer.component';

const routes: Routes = [
  {
    path: '',
    component: LeerComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LeerRoutingModule { }
