// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ServiciosRoutingModule } from './servicios-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { ServiciosComponent } from './servicios.component';

@NgModule({
  declarations: [
    ServiciosComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,    
    ServiciosRoutingModule
  ]
})
export class ServiciosModule { }
