// Módulos
import { Label } from 'ng2-charts';
import { Component, OnInit } from '@angular/core';
import { ChartDataSets, ChartOptions, ChartType } from 'chart.js';

// Serivicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { ReporteService } from 'src/app/services/reporte.service';

// Environment
import { environment } from 'src/environments/environment.prod';

@Component({
  selector: 'app-bar-chart',
  templateUrl: './bar-chart.component.html',
  styleUrls: ['./bar-chart.component.css']
})
export class BarChartComponent implements OnInit {

  // Variables
  public municipio: string;
  public municipios: any[];
  public ofertaTuristica: string;
  public ofertasTuristicas: string[];
  public month: number;
  public months: any[];
  public year: number;
  public years: number[];

  public barChartType: ChartType;
  public barChartLegend: boolean;
  public barChartLabels?: Label[];
  public barChartOptions: ChartOptions;
  public barChartData?: ChartDataSets[];

  // Constructor
  constructor(
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private reporteService: ReporteService
  ) { 
    this.municipios = environment.municipios;
    this.municipio = this.municipios[0].nombre;
    this.ofertasTuristicas = ["Planes", "Servicios"];
    this.ofertaTuristica = this.ofertasTuristicas[0];
    this.months = environment.meses;
    this.month = this.months[0].id;
    this.years = environment.years;
    this.year = this.years[0];

    this.barChartLegend = true;
    this.barChartType = 'bar';
    this.barChartOptions = {
      responsive: true,
      legend: {
        position: 'bottom'
      },       
      // We use these empty structures as placeholders for dynamic theming.
      scales: { xAxes: [{}], yAxes: [{}] },
      plugins: {
        datalabels: {
          anchor: 'end',
          align: 'end',
        }
      }
    };
  }

  ngOnInit(): void { 
  }

  public async generarReporte() : Promise<void> {

    this.spinner.show();    

    if (this.ofertaTuristica == 'Planes') {
      await this.reporteService.mejoresPlanesTuristicos(this.month, this.year, this.municipio)
        .then(res => {
          if (res != null) {
            this.barChartData = [];
            res.forEach(x => this.barChartData!.push({ data: [x.cantidad, 0], label: x.nombre }));
            this.barChartLabels = [this.municipio];
          } else {
            this.barChartData = undefined;
            this.barChartLabels = undefined;
            this.alertaService.error('No hay datos para generer el reporte');
          }
        });
    } else {
      await this.reporteService.mejoresServiciosTuristicos(this.month, this.year, this.municipio)
        .then(res => {
          if (res != null) {            
            this.barChartData = [];
            res.forEach(x => this.barChartData!.push({ data: [x.cantidad, 0], label: x.nombre }));
            this.barChartLabels = [this.municipio];
          } else {
            this.barChartData = undefined;
            this.barChartLabels = undefined;
            this.alertaService.error('No hay datos para generer el reporte');
          }         
        });
    }   

    this.spinner.hide();

  }

  public seleccionarMunicipio(indice: number) : void {
    this.municipio = this.municipios[indice].nombre;
  }

  public seleccionarMes(indice: number) : void {
    this.month = this.months[indice-1].id;
  }

  public seleccionarYear(year: number) : void {
    this.year = year;
  }

  public seleccionarOfertaTuristica(nombre: string) : void {
    this.ofertaTuristica = nombre;
  }

}
