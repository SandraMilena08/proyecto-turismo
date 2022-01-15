// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { CrearRegistroComponent } from './crear-registro.component';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';
import { CrearRegistroRoutingModule } from './crear-registro-routing.module';

@NgModule({
  declarations: [
    CrearRegistroComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    CrearRegistroRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class CrearRegistroModule { }
