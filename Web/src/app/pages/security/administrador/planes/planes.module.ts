// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PlanesRoutingModule } from './planes-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { PlanesComponent } from './planes.component';

@NgModule({
  declarations: [
    PlanesComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    PlanesRoutingModule,
  ]
})
export class PlanesModule { }
