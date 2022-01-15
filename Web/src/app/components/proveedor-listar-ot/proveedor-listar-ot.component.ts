// Módulos
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { Input, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { PlanService } from 'src/app/services/plan.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { ServicioService } from 'src/app/services/servicio.service';

// Interfaces
import { OfertaTuristica } from 'src/app/interfaces/oferta-turistica.interface';

// Módulos Swiper 
import SwiperCore, { EffectCoverflow, Pagination } from 'swiper/core';
SwiperCore.use([EffectCoverflow, Pagination]);

// Environments
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;

@Component({
  selector: 'app-proveedor-listar-ot',
  templateUrl: './proveedor-listar-ot.component.html',
  styleUrls: ['./proveedor-listar-ot.component.css']
})
export class ProveedorListarOtComponent implements OnInit {

  // Variables
  @Input() modulo?: string; // Módulo servicios | planes
  @Input() moduloSingular?: string; // Módulo servicio | plan
  public formGroup: FormGroup; // Formulario para búsquedas
  private hash?: string | null; // Hash del proveedor
  private email?: string | null; // E-mail del proveedor
  public listaOT?: OfertaTuristica[]; // Lista de oferta turística  

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private planService: PlanService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private servicioService: ServicioService
  ) { 
    this.formGroup = this.formBuilder.group({
      nombre: [null, [ Validators.minLength(2), Validators.maxLength(50)]]
    });
  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();    
    
    this.hash = this.authService.retornarHash(); // Obtener el hash del proveedor
    this.email = this.authService.retornarEmail(); // Obtener el e-mail del proveedor

    if (this.modulo! == 'servicios') { // Módulo de servicios            
      await this.servicioService.leerXProveedor(this.hash!, this.email!, 0, 30) // Obteniendo todos los servicios turísticos registrados del proveedor
        .then(res => this.listaOT = res != null ? res : []); // Tratando la información recibida
    } else { // Módulo de planes
      await this.planService.leerXProveedor(this.hash!, this.email!, 0, 30) // Obteniendo todos los planes turísticos registrados del proveedor
        .then(res => this.listaOT = res != null ? res : []); // Tratando la información recibida
    }

    if (this.listaOT!.length > 0) // Verificar si la lista de ofertas turísticas tiene información
      this.listaOT!.forEach(ofertaTuristica => {
        ofertaTuristica.imagenes = JSON.parse(ofertaTuristica.imagen!); // Transformando JSON de imágenes a array de string
        for (let i = 0; i < ofertaTuristica.imagenes!.length; i++) // Se recorren todas las imágenes de la oferta turística
          ofertaTuristica.imagenes![i] = `${ WebImages }/${ ofertaTuristica.imagenes![i] }`; // Se establece la URL correcta para obtener las imágenes
      });    

    sessionStorage.removeItem('planes');
    sessionStorage.removeItem('servicios');
    sessionStorage.setItem(this.modulo!, JSON.stringify(this.listaOT));    

    this.spinner.hide();

  }

  // Métodos

  // Buscar planes o servicios turísticos
  public buscarOT() : void {

    this.spinner.show();

    var nombreBuscar: string | null = this.formGroup.get('nombre')!.value;

    this.listaOT = JSON.parse(sessionStorage.getItem(this.modulo!)!);

    if (nombreBuscar != null)
      this.listaOT! = this.listaOT!.filter(ot => ot.nombre!.toLowerCase().includes(nombreBuscar!.toLowerCase()));
    
    console.log(this.listaOT);

    this.spinner.hide();

  }

  // Mostrar ventana de eliminar plan o servicio turístico
  public async eliminarAlert(id: number, nombre: string) : Promise<void> {

    Swal.fire({
      title: `¿Estás seguro?`,
      text: `Se va a eliminar el ${ this.moduloSingular } turístico: ${ nombre }. La acción no se puede puede revertir. `,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#D16A1D',
      cancelButtonColor: '#e74c3c',
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Cancelar'
    }).then((result: any) => {
      if (result.isConfirmed) {
        this.eliminarOT(id);        
      }
    })

  }

  // Eliminar plan o servicio turístico
  public async eliminarOT(id: number) : Promise<void> {
    
    this.spinner.show();

    if (this.modulo == 'servicios') { // Eliminar servicio turístico
      await this.servicioService.eliminar(id, this.hash!, this.email!)
        .then(res => {
          if (res == "0") {

            this.alertaService.confirmacion(`${ this.moduloSingular } turístico eliminado correctamente`);

            this.listaOT = [];

            this.router.navigateByUrl('proveedor/servicios')
              .then(_ => {
                this.servicioService.leerXProveedor(this.hash!, this.email!, 0, 30)
                  .then(res => {
                    
                    this.listaOT = [];
                    this.listaOT = res != null ? res : [];                                       

                    if (this.listaOT!.length > 0) // Verificar si la lista de ofertas turísticas tiene información
                      this.listaOT!.forEach(ofertaTuristica => {
                        ofertaTuristica.imagenes = JSON.parse(ofertaTuristica.imagen!); // Transformando JSON de imágenes a array de string
                        for (let i = 0; i < ofertaTuristica.imagenes!.length; i++) // Se recorren todas las imágenes de la oferta turística
                          ofertaTuristica.imagenes![i] = `${ WebImages }/${ ofertaTuristica.imagenes![i] }`; // Se establece la URL correcta para obtener las imágenes
                      });        
                      
                    sessionStorage.removeItem('planes');
                    sessionStorage.removeItem('servicios');
                    sessionStorage.setItem(this.modulo!, JSON.stringify(this.listaOT));
                  });
              });            

          } else this.alertaService.error(res);
        });
    } else { // Eliminar plan turístico
      await this.planService.eliminar(id, this.hash!, this.email!)
        .then(res => {
          if (res == "0") {

            this.alertaService.confirmacion(`${ this.moduloSingular } turístico eliminado correctamente`);            

            this.router.navigateByUrl('proveedor/planes')
              .then(_ => {
                this.planService.leerXProveedor(this.hash!, this.email!, 0, 30)
                  .then(res => {
                    
                    this.listaOT = [];
                    this.listaOT = res != null ? res : [];                                       

                    if (this.listaOT!.length > 0) // Verificar si la lista de ofertas turísticas tiene información
                      this.listaOT!.forEach(ofertaTuristica => {
                        ofertaTuristica.imagenes = JSON.parse(ofertaTuristica.imagen!); // Transformando JSON de imágenes a array de string
                        for (let i = 0; i < ofertaTuristica.imagenes!.length; i++) // Se recorren todas las imágenes de la oferta turística
                          ofertaTuristica.imagenes![i] = `${ WebImages }/${ ofertaTuristica.imagenes![i] }`; // Se establece la URL correcta para obtener las imágenes
                      });        
                      
                    sessionStorage.removeItem('planes');
                    sessionStorage.removeItem('servicios');
                    sessionStorage.setItem(this.modulo!, JSON.stringify(this.listaOT));
                  });
              });

          } else this.alertaService.error(res);
        });
    }              

    this.spinner.hide();

  }

  // Redirigir a crear oferta turística
  public navegar() : void {
    this.router.navigateByUrl(`proveedor/${ this.modulo! }/crear`);
  }

  // Redirigir a editar oferta turística
  public navegarEditar(id: number) : void {
    this.router.navigateByUrl(`proveedor/${ this.modulo! }/editar/${ id }`);
  }

  // Redirigir a generar código de puntuación
  public navegarCodigoPuntuacion(id: number) : void {
    this.router.navigateByUrl(`proveedor/${ this.modulo! }/codigo-puntuacion/${ id }`);
  }

  // Obtener los valores del formulario de búsqueda de ofertas turísticas
  get f() { return this.formGroup.controls }

}
