// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { TuristaRoutingModule } from './turista-routing.module';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { TuristaComponent } from './turista.component';

@NgModule({
  declarations: [
    TuristaComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    TuristaRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class TuristaModule { }
