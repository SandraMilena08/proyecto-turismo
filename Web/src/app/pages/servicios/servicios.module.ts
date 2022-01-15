// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { ServiciosRoutingModule } from './servicios-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    ServiciosRoutingModule
  ]
})
export class ServiciosModule { }
