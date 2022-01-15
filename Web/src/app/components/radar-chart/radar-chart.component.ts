// Módulos
import { Label } from 'ng2-charts';
import { Component, OnInit } from '@angular/core';
import { ChartDataSets, ChartType, RadialChartOptions } from 'chart.js';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { ReporteService } from 'src/app/services/reporte.service';

// Environment
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-radar-chart',
  templateUrl: './radar-chart.component.html',
  styleUrls: ['./radar-chart.component.css']
})
export class RadarChartComponent implements OnInit {

  // Variables
  public month: number;
  public months: any[];
  public year: number;
  public years: number[];

  public radarChartType: ChartType;
  public radarChartLabels: Label[];
  public radarChartOptions: RadialChartOptions;
  public radarChartData?: ChartDataSets[];

  // Constructor
  constructor(
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private reporteService: ReporteService
  ) { 
    this.months = environment.meses;
    this.month = this.months[0].id;
    this.years = environment.years;
    this.year = this.years[0];
    this.radarChartType = 'radar';
    this.radarChartOptions = {
      responsive: true,
      legend: {
        fullWidth: true,
        position: 'bottom'
      }
    };
    this.radarChartLabels = environment.categoriasTurismo;
  }

  ngOnInit(): void {    
  }

  // Métodos

  public async generarReporte() : Promise<void> {

    this.spinner.show();    

    await this.reporteService.categoriasEdad(this.month, this.year)
      .then(res => {
        if (res != null) {
          this.radarChartData = [];
          res.forEach(x => {
            this.radarChartData!.push({
              label: x.nombre,
              data: x.cantidades
            });
          });               
        } else {
          this.radarChartData = undefined;
          this.alertaService.error('No hay datos para generer el reporte');
        }
      });

    this.spinner.hide();

  }

  public seleccionarMes(indice: number) : void {
    this.month = this.months[indice-1].id;
  }

  public seleccionarYear(year: number) : void {
    this.year = year;
  }

}
