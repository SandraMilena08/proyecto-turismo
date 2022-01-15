// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HashRoutingModule } from './hash-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { HashComponent } from './hash.component';

@NgModule({
  declarations: [
    HashComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    HashRoutingModule
  ]
})
export class HashModule { }
