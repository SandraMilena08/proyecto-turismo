// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';
import { CodigoPuntuacionRoutingModule } from './codigo-puntuacion-routing.module';

// Componentes
import { CodigoPuntuacionComponent } from './codigo-puntuacion.component';

@NgModule({
  declarations: [
    CodigoPuntuacionComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    CodigoPuntuacionRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class CodigoPuntuacionModule { }
