// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ListarRoutingModule } from './listar-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { ListarComponent } from './listar.component';

@NgModule({
  declarations: [
    ListarComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    ListarRoutingModule    
  ]
})
export class ListarModule { }
