// Módulos
import { Label } from 'ng2-charts';
import { Component, OnInit } from '@angular/core';
import { ChartType, ChartOptions, ChartDataSets } from 'chart.js';
//import ChartDataLabels from 'chartjs-plugin-datalabels';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { ReporteService } from 'src/app/services/reporte.service';

// Interfaces
import { BarChart } from 'src/app/interfaces/bar-chart.interface';

@Component({
  selector: 'app-reportes',
  templateUrl: './reportes.component.html',
  styleUrls: ['./reportes.component.css']
})
export class ReportesComponent implements OnInit {

  // Variables
  public municipios: string[] = ['Albán','La Peña','La Vega','Nimaima','Nocaima','Quebradanegra','San Francisco','Sasaima','Supatá','Útica','Vergara','Villeta'];
  public pieChartOptions: ChartOptions = {
    responsive: true,
    legend: {
      position: 'top',
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

  public pieChartLabels: Label[] = ['Albán','La Peña','La Vega','Nimaima','Nocaima','Quebradanegra','San Francisco','Sasaima','Supatá','Útica','Vergara','Villeta'];
  public pieChartData: number[] = [300, 500, 100];
  public pieChartType: ChartType = 'pie';
  public pieChartLegend = true;
  //public pieChartPlugins = [ChartDataLabels];
  public pieChartColors = [
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

  public barChartOptions: ChartOptions = {
    responsive: true,
    // We use these empty structures as placeholders for dynamic theming.
    scales: { xAxes: [{}], yAxes: [{}] },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'end',
      }
    }
  };
  public barChartLabels: Label[] = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
  public barChartType: ChartType = 'bar';
  public barChartLegend = true;

  public barChartData: ChartDataSets[] = [
    { data: [65, 59, 80, 81, 56, 55, 40], label: 'Series A' },
    { data: [28, 48, 40, 19, 86, 27, 90], label: 'Series B' }
  ];

  // Constructor
  constructor(
    private spinner: NgxSpinnerService,
    private reporteService: ReporteService
  ) { }

  async ngOnInit(): Promise<void> {
    
    this.spinner.show();

    await this.reporteService.mejoresMunicipios(11, 2021)
      .then(res => {
        this.pieChartData = res!;
      });

    await this.reporteService.mejoresServiciosTuristicos(11, 2021, 'Sasaima')
      .then((res: BarChart[] | null) => {
        //console.log(res);
        if (res != null) {
          this.barChartData = [];
          this.barChartLabels = [];
          res.forEach(d => {
            this.barChartData.push({
              label: d.nombre,
              data: [d.cantidad, 0]
            });            
          });
          this.barChartLabels.push('Sasaima');
          //console.log(this.barChartData);
        }        
      });

    this.spinner.hide();

  }

}
