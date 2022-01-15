// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LeerRoutingModule } from './leer-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { LeerComponent } from './leer.component';

@NgModule({
  declarations: [
    LeerComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    LeerRoutingModule
  ]
})
export class LeerModule { }
