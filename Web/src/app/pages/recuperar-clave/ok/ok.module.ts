// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OkRoutingModule } from './ok-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { OkComponent } from './ok.component';

@NgModule({
  declarations: [
    OkComponent
  ],
  imports: [
    CommonModule,
    OkRoutingModule,
    ComponentsModule    
  ]
})
export class OkModule { }
