// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ProveedoresRoutingModule } from './proveedores-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { ProveedoresComponent } from './proveedores.component';

@NgModule({
  declarations: [
    ProveedoresComponent
  ],
  imports: [
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    ProveedoresRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class ProveedoresModule { }
