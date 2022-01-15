// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ComponentsModule } from 'src/app/components/components.module';
import { IniciarSesionRoutingModule } from './iniciar-sesion-routing.module';

// Componentes
import { IniciarSesionComponent } from './iniciar-sesion.component';

@NgModule({
  declarations: [
    IniciarSesionComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    IniciarSesionRoutingModule
  ]
})
export class IniciarSesionModule { }
