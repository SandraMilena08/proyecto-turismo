// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';
import { PreRegistroRoutingModule } from './pre-registro-routing.module';

// Componentes
import { PreRegistroComponent } from './pre-registro.component';

@NgModule({
  declarations: [
    PreRegistroComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    PreRegistroRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class PreRegistroModule { }
