// Módulos
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { ProveedorRoutingModule } from './proveedor-routing.module';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { ProveedorComponent } from './proveedor.component';

@NgModule({
  declarations: [
    ProveedorComponent
  ],
  imports: [    
    CommonModule,
    ComponentsModule,
    ReactiveFormsModule,
    ProveedorRoutingModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ]
})
export class ProveedorModule { }
