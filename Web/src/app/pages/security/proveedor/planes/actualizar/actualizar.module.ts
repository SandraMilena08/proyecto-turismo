// Módulos
import { NgModule } from '@angular/core';
import { SwiperModule } from 'swiper/angular';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { ActualizarRoutingModule } from './actualizar-routing.module';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { ActualizarComponent } from './actualizar.component';

@NgModule({
  declarations: [
    ActualizarComponent
  ],
  imports: [
    CommonModule,
    SwiperModule,
    ComponentsModule,
    ReactiveFormsModule,
    ActualizarRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class ActualizarModule { }
