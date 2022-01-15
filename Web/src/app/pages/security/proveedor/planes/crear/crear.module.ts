// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { CrearRoutingModule } from './crear-routing.module';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { CrearComponent } from './crear.component';

@NgModule({
  declarations: [
    CrearComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    CrearRoutingModule,
    ReactiveFormsModule,    
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class CrearModule { }
