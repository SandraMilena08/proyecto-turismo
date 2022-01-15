// Módulos
import { NgModule } from '@angular/core';
import { ChartsModule } from 'ng2-charts';
import { CommonModule } from '@angular/common';
import { NgxTabsModule } from '@ngx-tiny/tabs';
import { ReportesRoutingModule } from './reportes-routing.module';
import { ComponentsModule } from 'src/app/components/components.module';

// Componentes
import { ReportesComponent } from './reportes.component';

@NgModule({
  declarations: [
    ReportesComponent
  ],
  imports: [
    CommonModule,    
    ChartsModule,
    NgxTabsModule,
    ComponentsModule,
    ReportesRoutingModule
  ]
})
export class ReportesModule { }
