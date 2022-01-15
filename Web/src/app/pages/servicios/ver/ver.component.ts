// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { ServicioService } from 'src/app/services/servicio.service';

// Interfaces
import { Plan } from 'src/app/interfaces/plan.interface';
import { Servicio } from 'src/app/interfaces/servicio.interface';
import { Proveedor } from 'src/app/interfaces/proveedor.interface';

// Environments
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;

@Component({
  selector: 'app-ver',
  templateUrl: './ver.component.html',
  styleUrls: ['./ver.component.css']
})
export class VerComponent implements OnInit {

  // Variables
  public servicio?: Servicio;  
  public listaPlanes?: Plan[];
  public proveedor?: Proveedor;
  public listaServicios?: Servicio[];

  // Constructor
  constructor(
    private router: Router,
    private spinner: NgxSpinnerService,
    private activatedRoute: ActivatedRoute,
    private servicioService: ServicioService
  ) { }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    await this.obtenerId()
      .then(id => {
        this.servicioService.leerForTurista(id)
          .then(res => {

            if (res != null) {

              this.servicio = res.servicio!;
              this.servicio!.imagenes = JSON.parse(this.servicio!.imagen!);

              this.proveedor = res.proveedor!;        

              this.listaPlanes = res.listaPlanes!;
              this.listaPlanes!.forEach(p => {
                p.imagenes = JSON.parse(p.imagen!);
                p.imagenes!.forEach(ip => ip = `${ WebImages }/${ ip }`);
              });  

              this.listaServicios = res.listaServicios!;
              this.listaServicios!.forEach(s => {
                s.imagenes = JSON.parse(s.imagen!);
                s.imagenes!.forEach(is => is = `${ WebImages }/${ is }`);
              });
              
            } else
              this.router.navigateByUrl('/servicios/0/12');
              
          });
      });

    this.spinner.hide();

  }

  // Métodos

  // Obtener el ID del servicio turístico a partir de la URL
  private async obtenerId() : Promise<number> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve(Number(params.get('id')!).valueOf());
        });
    });
  }

}
