// Módulos
import { Label } from 'ng2-charts';
import { Component, OnInit } from '@angular/core';
import { ChartType, ChartOptions } from 'chart.js';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { ReporteService } from 'src/app/services/reporte.service';

// Environment
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-chart-pie',
  templateUrl: './chart-pie.component.html',
  styleUrls: ['./chart-pie.component.css']
})
export class ChartPieComponent implements OnInit {

  // Variables
  public pieChartOptions: ChartOptions;
  public pieChartColors: any;
  public pieChartLabels: Label[];
  public pieChartData?: number[];
  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;    
  public month: number;
  public year: number;  
  public months: any[];
  public years: number[];

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

    this.pieChartLabels = ['Albán','La Peña','La Vega','Nimaima','Nocaima','Quebradanegra','San Francisco','Sasaima','Supatá','Útica','Vergara','Villeta'];

    this.pieChartOptions = {
      responsive: true,
      legend: {
        position: 'bottom',
      },      
      plugins: {
        datalabels: {
          formatter: (value: any, ctx: any) => {
            const label = ctx.chart.data.labels[ctx.dataIndex];
            return label;
          },
        },
      }
    };
    this.pieChartColors = [
      {
        backgroundColor: [
          'rgba(243, 166, 131, 0.7)',
          'rgba(247, 215, 148, 0.7', 
          'rgba(119, 139, 235, 0.7)',
          'rgba(207, 106, 135, 0.7)',
          'rgba(120, 111, 166, 0.7', 
          'rgba(248, 165, 194, 0.7)',
          'rgba(99, 205, 218, 0.7)',
          'rgba(234, 134, 133, 0.7)',
          'rgba(89, 98, 117, 0.7)',
          'rgba(87, 75, 144, 0.7)',
          'rgba(230, 103, 103, 0.7)',
          'rgba(48, 57, 82, 0.7)'
        ]
      },
    ];
  }

  ngOnInit(): void {
  }

  // Métodos

  public async generarReporte() : Promise<void> {

    this.spinner.show();

    await this.reporteService.mejoresMunicipios(this.month, this.year)
      .then(res => {        
        if (res != null)
          this.pieChartData = res;
        else {
          this.pieChartData = undefined;
          this.alertaService.error('No hay datos para generar el reporte');
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
