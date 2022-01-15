// Módulos
import { NgModule } from '@angular/core';
import { ChartsModule } from 'ng2-charts';
import { SwiperModule } from 'swiper/angular';
import { CommonModule } from '@angular/common';
import { ReactiveFormsModule } from '@angular/forms';
import { TooltipModule, TooltipOptions } from 'ng2-tooltip-directive';

// Componentes
import { HeaderComponent } from './header/header.component';
import { BannerComponent } from './banner/banner.component';
import { ListarOtComponent } from './listar-ot/listar-ot.component';
import { ChartPieComponent } from './chart-pie/chart-pie.component';
import { NoReportComponent } from './no-report/no-report.component';
import { BarChartComponent } from './bar-chart/bar-chart.component';
import { NoContentComponent } from './no-content/no-content.component';
import { RadarChartComponent } from './radar-chart/radar-chart.component';
import { IconoTuristaComponent } from './icono-turista/icono-turista.component';
import { CrudOtImagesComponent } from './crud-ot-images/crud-ot-images.component';
import { SeleccionarRolComponent } from './seleccionar-rol/seleccionar-rol.component';
import { OfertaTuristicaComponent } from './oferta-turistica/oferta-turistica.component';
import { PaginationButtonsComponent } from './pagination-buttons/pagination-buttons.component';
import { ProveedorListarOtComponent } from './proveedor-listar-ot/proveedor-listar-ot.component';
import { ProveedorHabilitadoComponent } from './proveedor-habilitado/proveedor-habilitado.component';
import { AdministradorListarOtComponent } from './administrador-listar-ot/administrador-listar-ot.component';

// Pipes
import { SubStringPipe } from 'src/app/pipes/sub-string.pipe';
import { OtDetailComponent } from './ot-detail/ot-detail.component';

@NgModule({
  declarations: [
    SubStringPipe,
    HeaderComponent,
    BannerComponent,
    ListarOtComponent,
    ChartPieComponent,
    NoReportComponent,
    BarChartComponent,
    OtDetailComponent,
    NoContentComponent,
    RadarChartComponent,
    IconoTuristaComponent,
    CrudOtImagesComponent,
    SeleccionarRolComponent,
    OfertaTuristicaComponent,
    ProveedorListarOtComponent,
    PaginationButtonsComponent,
    ProveedorHabilitadoComponent,
    AdministradorListarOtComponent
  ],
  imports: [
    ChartsModule,
    CommonModule, 
    SwiperModule,   
    ReactiveFormsModule,
    TooltipModule.forRoot({
      'placement': 'left',
      'max-width': '250px'
    } as TooltipOptions)
  ],
  exports: [
    SubStringPipe,
    HeaderComponent,
    BannerComponent,
    ListarOtComponent,
    ChartPieComponent,
    NoReportComponent,
    BarChartComponent,
    OtDetailComponent,
    NoContentComponent,
    RadarChartComponent,
    IconoTuristaComponent,
    CrudOtImagesComponent,
    SeleccionarRolComponent,
    OfertaTuristicaComponent,
    ProveedorListarOtComponent,
    PaginationButtonsComponent,
    ProveedorHabilitadoComponent,
    AdministradorListarOtComponent
  ]
})
export class ComponentsModule { }
