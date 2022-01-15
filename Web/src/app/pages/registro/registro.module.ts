// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RegistroRoutingModule } from './registro-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { RegistroComponent } from './registro.component';

@NgModule({
  declarations: [
    RegistroComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,    
    RegistroRoutingModule
  ]
})
export class RegistroModule { }
