// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { PuntuacionRoutingModule } from './puntuacion-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { PuntuacionComponent } from './puntuacion.component';

@NgModule({
  declarations: [
    PuntuacionComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    PuntuacionRoutingModule
  ]
})
export class PuntuacionModule { }
