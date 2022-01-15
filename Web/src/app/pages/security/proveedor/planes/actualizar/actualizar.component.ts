// Módulos
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { PlanService } from 'src/app/services/plan.service';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';

// Interfaces
import { Plan } from 'src/app/interfaces/plan.interface';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

// Environment
import { environment } from 'src/environments/environment';

const WebImages = environment.webImages;

@Component({
  selector: 'app-actualizar',
  templateUrl: './actualizar.component.html',
  styleUrls: ['./actualizar.component.css']
})
export class ActualizarComponent implements OnInit {

  // Variables
  public plan?: Plan;
  public municipios: any[];
  public categorias: any[];  
  public formGroup?: FormGroup;
  private hash?: string | null;
  private email?: string | null;
  public volumenesIngreso: any[];
  public listaActividades: string[];
  public actividadFormGroup: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private planService: PlanService,
    private authService: AuthService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private activatedRoute: ActivatedRoute
  ) { 

    this.listaActividades = [];
    this.municipios = environment.municipios;
    this.categorias = environment.categorias;
    this.volumenesIngreso = environment.volumenesIngreso;

    this.actividadFormGroup = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(120)]]
    });

  }

  async ngOnInit(): Promise<void> {

    this.spinner.show();

    this.hash = this.authService.retornarHash();
    this.email = this.authService.retornarEmail();

    await this.obtenerId()
      .then(res => {
        this.planService.leer(Number(res).valueOf(), this.hash!, this.email!)
          .then(info => {
            if (info != null) {

              this.plan = info;              

              this.plan.imagenes = JSON.parse(this.plan.imagen!);   
              for (let i = 0; i < this.plan.imagenes!.length; i++)
                this.plan.imagenes![i] = `${ WebImages }/${ this.plan.imagenes![i] }`;

              this.formGroup = this.formBuilder.group({
                nombre: [this.plan.nombre, [Validators.required, Validators.minLength(5), Validators.maxLength(50), Validators.pattern("[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*")]],
                informacion: [this.plan.informacion, [Validators.required, Validators.minLength(5), Validators.maxLength(420)]],
                precio: [this.plan.precio, [Validators.required, Validators.min(1000), Validators.max(9999999), Validators.pattern("[0-9]*")]],
                municipio: [this.plan.municipio, [Validators.required]],
                volumenIngreso: [this.plan.volumenIngreso, [Validators.required]],
                categoria: [this.plan.categoria, [Validators.required]]   
              });

              this.plan.listaActividades = JSON.parse(this.plan.actividades!);
              this.listaActividades = this.plan.listaActividades!;

            } else {
              this.alertaService.error("No se encontró el plan turístico");
              this.router.navigateByUrl('proveedor/planes');
            }
          });
      });

    this.spinner.hide();

  }

  // Métodos

  // Actualizar plan turístico
  public async editarPlan() : Promise<void> {

    this.spinner.show();

    if (this.formGroup!.valid) {

      if (this.listaActividades.length >= 3 && this.listaActividades.length <= 15) {
      
        this.plan!.nombre = this.formGroup!.get('nombre')!.value;
        this.plan!.informacion = this.formGroup!.get('informacion')!.value;
        this.plan!.precio = this.formGroup!.get('precio')!.value;
        this.plan!.municipio = this.formGroup!.get('municipio')!.value;
        this.plan!.volumenIngreso = this.formGroup!.get('volumenIngreso')!.value;
        this.plan!.categoria = this.formGroup!.get('categoria')!.value;
        this.plan!.listaActividades = this.listaActividades;

        this.plan!.nombre = this.plan!.nombre!.trim();
        this.plan!.informacion = this.plan!.informacion!.trim();

        await this.planService.actualizar(this.plan!, this.hash!, this.email!)
          .then(res => {
            if (res == "0") {

              this.alertaService.confirmacion("Información actualizada correctamente");
              this.reloadPage();              

            } else
              this.alertaService.error(res);            
          });

      } else
        this.alertaService.error('El plan turístico debe tener mínimo 3 y máximo 15 actividades asociadas');

    } else
      this.alertaService.error("Completa el formulario correctamente");

    this.spinner.hide();

  }

  // Añadir una activida a la lista de actividades del plan turístico
  public agregarActividad() : void {

    this.spinner.show();
    
    if (this.actividadFormGroup.valid) {

      if (this.listaActividades.length < 15) {

        var actividad: string = this.actividadFormGroup.get('nombre')!.value;
              
        if (actividad.trim().length > 5) {

          this.listaActividades.push(actividad.trim());        
          this.actividadFormGroup.reset();
          this.alertaService.confirmacion('Actividad agregada correctamente');

        } else {
          this.actividadFormGroup.get('nombre')!.setErrors({ required: true });
          this.alertaService.error('Ingresa una actividad válida');    
        }   

      } else
        this.alertaService.error('Se pueden agregar un máximo de 15 actividades para un plan turístico');         

    } else
      this.alertaService.error('Ingresa una actividad válida');

    this.spinner.hide();

  }

  // Eliminar una activida de la lista de actividades del plan turístico
  public eliminarActividad(indice: number) : void {

    this.spinner.show();

    var listaAuxiliar : string[] = [];

    for (let i = 0; i < this.listaActividades.length; i++) {
      if (i != indice) listaAuxiliar.push(this.listaActividades[i]);
    }

    this.listaActividades = listaAuxiliar;    

    this.spinner.hide();

  }

  // Evento que se dispará al modificar las imágenes del servicio
  public async reloadPage() : Promise<void> {

    this.spinner.show();

    await this.obtenerId()
      .then(res => {
        this.planService.leer(Number(res).valueOf(), this.hash!, this.email!)
          .then(info => {
            if (info != null) {

              this.plan = info;              

              this.plan.imagenes = JSON.parse(this.plan.imagen!);   
              for (let i = 0; i < this.plan.imagenes!.length; i++)
                this.plan.imagenes![i] = `${ WebImages }/${ this.plan.imagenes![i] }`;

              this.formGroup = this.formBuilder.group({
                nombre: [this.plan.nombre, [Validators.required, Validators.minLength(5), Validators.maxLength(50), Validators.pattern("[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*")]],
                informacion: [this.plan.informacion, [Validators.required, Validators.minLength(5), Validators.maxLength(420)]],
                precio: [this.plan.precio, [Validators.required, Validators.min(1000), Validators.max(9999999), Validators.pattern("[0-9]*")]],
                municipio: [this.plan.municipio, [Validators.required]],
                volumenIngreso: [this.plan.volumenIngreso, [Validators.required]],
                categoria: [this.plan.categoria, [Validators.required]]   
              });

              this.plan.listaActividades = JSON.parse(this.plan.actividades!);
              this.listaActividades = this.plan.listaActividades!;              

            } else {
              this.alertaService.error("No se encontró el plan turístico");
              this.router.navigateByUrl('proveedor/planes');
            }
          });
      });

    this.spinner.hide();

  }

  // Obtener el id del plan turístico de la url
  private async obtenerId() : Promise<string> {
    return new Promise(resolve => {
      this.activatedRoute.paramMap
        .subscribe(params => {
          resolve(params.get('id')!);
        });
    });
  }

  // Obtener los valores del formulario de actualizar plan turístico
  get f() { return this.formGroup!.controls }

  // Obtener los valores del formulario de registro de actividad de plan turístico
  get af() { return this.actividadFormGroup.controls }

}
