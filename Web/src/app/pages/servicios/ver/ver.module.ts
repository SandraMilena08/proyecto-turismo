// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { VerRoutingModule } from './ver-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { VerComponent } from './ver.component';

@NgModule({
  declarations: [
    VerComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    VerRoutingModule
  ]
})
export class VerModule { }
