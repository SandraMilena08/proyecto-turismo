// Módulos
import { NgModule } from '@angular/core';
import { SwiperModule } from 'swiper/angular';
import { CommonModule } from '@angular/common';
import { InicioRoutingModule } from './inicio-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { InicioComponent } from './inicio.component';

@NgModule({
  declarations: [
    InicioComponent
  ],
  imports: [
    CommonModule,
    SwiperModule,
    ComponentsModule,
    InicioRoutingModule
  ]
})
export class InicioModule { }
