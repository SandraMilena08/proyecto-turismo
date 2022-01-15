// Módulos
import Swal from 'sweetalert2';
import { ActivatedRoute } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { ProveedorService } from 'src/app/services/proveedor.service';

// Interfaces
import { Paginado } from 'src/app/interfaces/paginado.interface';
import { Proveedor } from 'src/app/interfaces/proveedor.interface';
import { BusquedaProveedor } from 'src/app/interfaces/busqueda-proveedor.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;
const ListaMunicipios = environment.municipios;

@Component({
  selector: 'app-proveedores',
  templateUrl: './proveedores.component.html',
  styleUrls: ['./proveedores.component.css']
})
export class ProveedoresComponent implements OnInit {

  // Variables
  public formGroup?: FormGroup;
  public listaMunicipios?: any[];
  public listaCategorias?: any[]; 
  public parametros?: BusquedaProveedor;
  public paginado?: Paginado<Proveedor> | null;

  // Constructor
  constructor(
    private formBuilder: FormBuilder,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute,
    private proveedorService: ProveedorService
  ) { 
    sessionStorage.clear();
  }

  async ngOnInit(): Promise<void> {
    
    await this.cargarInformacion();

  }

  // Métodos  

  // Mostrar alerta de habilitar o deshabilitar proveedor
  public async eliminarAlert(hash: string, estado: boolean, nombre: string) : Promise<void> {

    Swal.fire({
      title: `¿Estás seguro?`,
      text: `Se va a ${ estado == true ? 'deshabilitar' : 'habilitar' } el proveedor: ${ nombre }`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#D16A1D',
      cancelButtonColor: '#e74c3c',
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Cancelar'
    }).then((result: any) => {
      if (result.isConfirmed) {
        this.cambiarEstadoHabilitado(hash, estado);
      }
    })

  }

  // Cambiar estado de habilitado de proveedor
  public async cambiarEstadoHabilitado(hash: string, estado: boolean) : Promise<void> {

    this.spinner.show();

    await this.proveedorService.actualizarEstado(hash)
      .then(res => {
        if (res == "0") {
          this.alertaService.confirmacion(`Proveedor ${ estado == true ? 'deshabilitado' : 'habilitado' } correctamente`);
          this.cargarInformacion();
        } else 
          this.alertaService.error(res);
      });
    
    this.spinner.hide();

  }

  // Filtrar proveedores
  public async buscarProveedores() : Promise<void> {    

    if (this.formGroup!.valid) {

      this.parametros!.nombre = this.formGroup!.get('nombre')!.value;
      this.parametros!.nit = this.formGroup!.get('nit')!.value;

      sessionStorage.setItem("fil_prov_search", JSON.stringify(this.parametros));

      await this.cargarInformacion();

    } else {
      this.alertaService.error('Parámetros de búsqueda incorrectos');
    }    

  }

  // Seleccionar municipio
  public seleccionarMunicipio(nombre: string) : void {          
    
    if (nombre == 'Todos') {
      this.listaMunicipios!.forEach(municipio => municipio.estado = false);
      this.listaMunicipios![0].estado = true;
      this.parametros!.municipios = [""];
    } else {

      this.listaMunicipios![0].estado = false;
      this.parametros!.municipios = [];

      this.listaMunicipios!.forEach(municipio => {
        if (municipio.nombre == nombre) municipio.estado = !municipio.estado;
      });

      let cantidad = this.listaMunicipios!.filter(m => m.estado == true).length;
      
      if (cantidad == 12) {
        this.listaMunicipios!.forEach(municipio => municipio.estado = false);
        this.listaMunicipios![0].estado = true;
      }

      this.listaMunicipios!.forEach(municipio => {
        if (municipio.estado == true) this.parametros!.municipios!.push(municipio.nombre);
      });

      if (this.listaMunicipios?.filter(m => m.estado == true).length == 0) {
        this.listaMunicipios![0].estado = true;
        this.parametros!.municipios = [""];
      }

      if (this.parametros!.municipios!.length == 1 && this.parametros!.municipios![0] == 'Todos')
        this.parametros!.municipios![0] = '';

    }    
    
  }

  // Cargar información de la cuenta
  private async cargarInformacion() : Promise<void> {

    this.spinner.show();

    this.prepararBusqueda();
    this.inicializarFormulario();
    this.inicializarListas();

    await this.obtenerDatosPaginacion()
      .then(params => {

        var pagina: number = Number(params.pagina).valueOf();
        var cantidad: number = Number(params.cantidad).valueOf();

        this.proveedorService.leerPaginado(this.parametros!, pagina, cantidad)
          .then(res => {
            this.paginado = res;

            if (this.paginado != null) {
              this.paginado.contenido?.forEach(p => {
                p.icono = `${ WebImages }/${ p.icono }`;
              });
            }

            this.spinner.hide();

          });

      });    

  }

  // Establecer estado de habilitado
  public seleccionarEstadoHabilitado(estado: boolean) : void {
    this.parametros!.estado = estado;
  }

  // Limpiar campo de nombre o nit
  public clearControl(controlName: string) {
    this.formGroup!.get(controlName)!.setValue('');
  }

  // Preparar parámetros de búsqueda
  private prepararBusqueda() : void {

    if (sessionStorage.getItem("fil_prov_search") == null) {
      this.parametros = {
        nombre: "",
        nit: "",
        municipios: [""],
        estado: true
      };
    } else {
      this.parametros = JSON.parse(sessionStorage.getItem("fil_prov_search")!);
    }

    sessionStorage.setItem("fil_prov_search", JSON.stringify(this.parametros));

  }

  // Inicializar formulario de parámetros de búsqueda
  private inicializarFormulario() : void {

    // Formulario de parámetros de búsqueda
    this.formGroup = this.formBuilder.group({
      nombre: [this.parametros!.nombre, [Validators.minLength(3), Validators.maxLength(50)]],      
      nit: [this.parametros!.nit, [Validators.minLength(3), Validators.maxLength(12), Validators.pattern("[0-9-]*")]]
    });

  }

  // Inicializar listas de municipios y categorías
  private inicializarListas() : void {
  
    // Inicializando lista de municipios
    this.listaMunicipios = [{ nombre: 'Todos', estado: false }];
    ListaMunicipios.forEach(municipio => {
      this.listaMunicipios!.push({ nombre: municipio.nombre, estado: false });
    });

    this.listaMunicipios.forEach(municipio => {
      this.parametros!.municipios!.forEach(m => {
        if (municipio.nombre == m || (municipio.nombre == 'Todos' && m == '')) municipio.estado = true;
      });
    });      

  }

  // Obtener la página y cantidad de la url
  private async obtenerDatosPaginacion() : Promise<{ [key: string]: string }> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve({ 'pagina': params.get('pag')!, 'cantidad': params.get('qnt')!});
        });
    });
  }

  // Obtener los valores del formulario de buscar proveedores
  get f() { return this.formGroup!.controls }

  // Obtener la cantidad de letras del campo nombre
  get qn() { 
    var nombre: string = this.formGroup!.get('nombre')?.value;
    return nombre.length;
  }

  // Obtener la cantidad de letras del campo nit
  get qnit() { 
    var nombre: string = this.formGroup!.get('nit')?.value;
    return nombre.length;
  }

}
