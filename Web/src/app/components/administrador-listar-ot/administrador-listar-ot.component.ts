// Módulos
import Swal from 'sweetalert2';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { Component, ElementRef, HostListener, Input, OnInit, ViewChild } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { PlanService } from 'src/app/services/plan.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { ServicioService } from 'src/app/services/servicio.service';

// Interfaces
import { Paginado } from 'src/app/interfaces/paginado.interface';
import { Busqueda } from 'src/app/interfaces/busqueda.interface';
import { OfertaTuristica } from 'src/app/interfaces/oferta-turistica.interface';

// Environment
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;
const ListaMunicipios = environment.municipios;
const ListaCategorias = environment.categorias;

@Component({
  selector: 'app-administrador-listar-ot',
  templateUrl: './administrador-listar-ot.component.html',
  styleUrls: ['./administrador-listar-ot.component.css']
})
export class AdministradorListarOtComponent implements OnInit {

  // Variables
  @Input() modulo?: string;  
  public parametros?: Busqueda; 
  public formGroup?: FormGroup;
  public listaMunicipios?: any[];
  public listaCategorias?: any[]; 
  @Input() moduloSingular?: string;
  public paginado?: Paginado<OfertaTuristica> | null;  
  @ViewChild('inputNombreOT') inputNombreOT?: ElementRef; 

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private planService: PlanService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute,
    private servicioService: ServicioService
  ) { }

  async ngOnInit(): Promise<void> {        

    await this.cargarInformacion();    

  }

  // Métodos 

  public async paginar(pagina: number) : Promise<void> {    
    this.router.navigateByUrl(`administrador/${ this.modulo }/${ pagina }/12`)
      .then(_ => this.cargarInformacion());
  }

  // Mostrar alerta de eliminar plan o servicio turístico
  public async eliminarAlert(id: number, estado: boolean, nombre: string) : Promise<void> {

    Swal.fire({
      title: `¿Estás seguro?`,
      text: `Se va a ${ estado == true ? 'deshabilitar' : 'habilitar' } el ${ this.moduloSingular } turístico: ${ nombre }`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#D16A1D',
      cancelButtonColor: '#e74c3c',
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Cancelar'
    }).then((result: any) => {
      if (result.isConfirmed) {
        this.cambiarEstadoHabilitado(id, estado);
      }
    })

  }

  // Cambiar el estado de habilitado de plan o servicio turístico
  public async cambiarEstadoHabilitado(id: number, estado: boolean) : Promise<void> {

    this.spinner.show();

    if (this.modulo == 'servicios') {
      await this.servicioService.actualizarEstadoHabilitado(id)
        .then(res => {
          if (res == '0') { 
            this.alertaService.confirmacion(`Servicio turístico ${ estado == true ? 'deshabilitado' : 'habilitado' } correctamente`);
            this.cargarInformacion();
          }
          else this.alertaService.error(res);
        });
    } else {
      await this.planService.actualizarEstadoHabilitado(id)
        .then(res => {
          if (res == '0') {
            this.alertaService.confirmacion(`Plan turístico ${ estado == true ? 'deshabilitado' : 'habilitado' } correctamente`);
            this.cargarInformacion();
          } else
            this.alertaService.error(res);
        });
    }

    this.spinner.hide();

  }

  // Buscar planes o servicios turísticos
  public async buscarOT() : Promise<void> {    

    if (this.formGroup!.valid) {      

      this.parametros!.nombre = this.formGroup!.get('nombre')!.value;

      sessionStorage.setItem("fil_search", JSON.stringify(this.parametros));

      await this.cargarInformacion();

    } else {
      this.alertaService.error('Parámetros de búsqueda incorrectos');
    }        

  }

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

  public seleccionarCategoria(nombre: string) : void {

    if (nombre == 'Todas') {
      this.listaCategorias!.forEach(categorias => categorias.estado = false);
      this.listaCategorias![0].estado = true;
      this.parametros!.categorias = [""];
    } else {

      this.listaCategorias![0].estado = false;
      this.parametros!.categorias = [];

      this.listaCategorias!.forEach(categoria => {
        if (categoria.nombre == nombre) categoria.estado = !categoria.estado;
      });

      let cantidad = this.listaCategorias!.filter(c => c.estado == true).length;
      
      if (cantidad == 5) {
        this.listaCategorias!.forEach(categoria => categoria.estado = false);
        this.listaCategorias![0].estado = true;
      }

      this.listaCategorias!.forEach(categorias => {
        if (categorias.estado == true) this.parametros!.categorias!.push(categorias.nombre);
      });

      if (this.listaCategorias?.filter(m => m.estado == true).length == 0) {
        this.listaCategorias![0].estado = true;
        this.parametros!.categorias = [""];
      }

      if (this.parametros!.categorias!.length == 1 && this.parametros!.categorias![0] == 'Todas')
        this.parametros!.categorias![0] = '';
    }

  }

  // Establecer estado de habilitado
  public seleccionarEstadoHabilitado(estado: boolean) : void {
    this.parametros!.estado = estado;
  }

  // Limpiar input de nombre
  public clearNombre() : void {
    this.formGroup!.get('nombre')!.setValue('');
  }

  // Cargar información de la página
  private async cargarInformacion() : Promise<void> {    

    this.spinner.show();

    this.prepararBusqueda();
    this.inicializarFormulario();
    this.inicializarListas();    

    await this.obtenerDatosPaginacion()
      .then(params => {

        var pagina: number = Number(params.pagina).valueOf();
        var cantidad: number = Number(params.cantidad).valueOf();   
        
        if (this.modulo! == 'servicios') { // Servicios turísticos
          this.servicioService.leerPaginado(this.parametros!, pagina, cantidad)
            .then(res => {
              this.paginado = res;  
              if (this.paginado != null) {
                if (this.paginado!.contenido!.length > 0) // Verificar si la lista de ofertas turísticas tiene información
                      this.paginado!.contenido!.forEach(ofertaTuristica => {
                        ofertaTuristica.imagenes = JSON.parse(ofertaTuristica.imagen!); // Transformando JSON de imágenes a array de string
                        for (let i = 0; i < ofertaTuristica.imagenes!.length; i++) // Se recorren todas las imágenes de la oferta turística
                          ofertaTuristica.imagenes![i] = `${ WebImages }/${ ofertaTuristica.imagenes![i] }`; // Se establece la URL correcta para obtener las imágenes
                      });
              }            
              this.spinner.hide();
            });
        } else {
          this.planService.leerPaginado(this.parametros!, pagina, cantidad)
            .then(res => {
              this.paginado = res;  
              if (this.paginado != null) {
                if (this.paginado!.contenido!.length > 0) // Verificar si la lista de ofertas turísticas tiene información
                      this.paginado!.contenido!.forEach(ofertaTuristica => {
                        ofertaTuristica.imagenes = JSON.parse(ofertaTuristica.imagen!); // Transformando JSON de imágenes a array de string
                        for (let i = 0; i < ofertaTuristica.imagenes!.length; i++) // Se recorren todas las imágenes de la oferta turística
                          ofertaTuristica.imagenes![i] = `${ WebImages }/${ ofertaTuristica.imagenes![i] }`; // Se establece la URL correcta para obtener las imágenes
                      });
              }            
              this.spinner.hide();
            });
        }

      });          

  }

  // Preparando los parámetros de búsqueda
  private prepararBusqueda() : void {

    if (sessionStorage.getItem("fil_search") == null) {
      this.parametros = {
        nombre: "",
        municipios: [""],
        categorias: [""],
        precios: [1000, 9999999],
        puntuaciones: [0, 5],
        estado: true
      };
    } else {
      this.parametros = JSON.parse(sessionStorage.getItem("fil_search")!);
    }    

    sessionStorage.setItem("fil_search", JSON.stringify(this.parametros));    

  }

  public puntuacionDesdeEvent() : void {

    var valor: String = this.formGroup!.get('puntuacionDesde')!.value;    

    if (!valor) {
      this.parametros!.puntuaciones![0] = 0;
    } else {
      this.parametros!.puntuaciones![0] = Number(valor).valueOf();
    }

  }

  public puntuacionHastaEvent() : void {

    var valor: String = this.formGroup!.get('puntuacionHasta')!.value;    

    if (!valor) {
      this.parametros!.puntuaciones![1] = 5;
    } else {
      this.parametros!.puntuaciones![1] = Number(valor).valueOf();
    }

  }

  public precioDesdeEvent() : void {

    var valor: String = this.formGroup!.get('precioDesde')!.value;    

    if (!valor) {
      this.parametros!.precios![0] = 1000;
    } else {
      this.parametros!.precios![0] = Number(valor).valueOf();
    }

  }

  public precioHastaEvent() : void {

    var valor: String = this.formGroup!.get('precioHasta')!.value;    

    if (!valor) {
      this.parametros!.precios![1] = 9999999;
    } else {
      this.parametros!.precios![1] = Number(valor).valueOf();
    }

  }

  // Inicializar formulario de parámetros de búsqueda
  private inicializarFormulario() : void {

    // Formulario de parámetros de búsqueda
    this.formGroup = this.formBuilder.group({
      nombre: [this.parametros!.nombre, [Validators.minLength(3), Validators.maxLength(50)]],
      precioDesde: [this.parametros!.precios![0], []],
      precioHasta: [this.parametros!.precios![1], []],
      puntuacionDesde: [this.parametros!.puntuaciones![0], [Validators.required, Validators.pattern("[0-9]{1}")]],
      puntuacionHasta: [this.parametros!.puntuaciones![1], [Validators.required, Validators.pattern("[0-9]{1}")]]
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

    // Inicializando lista de categorías
    this.listaCategorias = [{ nombre: 'Todas', estado: false }];
    ListaCategorias.forEach(categoria => {
      this.listaCategorias!.push({ nombre: categoria.nombre, estado: false });
    });    

    this.listaCategorias.forEach(categoria => {
      this.parametros!.categorias!.forEach(c => {
        if (categoria.nombre == c || (categoria.nombre == 'Todas' && c == '')) categoria.estado = true;
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

  // Obtener los valores del formulario de buscar planes o servicios turísticos
  get f() { return this.formGroup!.controls }

  // Obtener la cantidad de letras del campo nombre
  get qn() { 
    var nombre: string = this.formGroup!.get('nombre')?.value;
    return nombre.length;
  }

}
