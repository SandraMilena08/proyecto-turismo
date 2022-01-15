// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service'; 
import { PlanService } from 'src/app/services/plan.service';
import { AlertaService } from 'src/app/services/alerta.service';

// Interfaces
import { Plan } from 'src/app/interfaces/plan.interface';

// Environments
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-crear',
  templateUrl: './crear.component.html',
  styleUrls: ['./crear.component.css']
})
export class CrearComponent implements OnInit {

  // Variables
  public municipios: any[];
  public categorias: any[]; 
  public formGroup: FormGroup;
  public volumenesIngreso: any[];
  public listaActividades: string[];
  public actividadFormGroup: FormGroup;

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private formBuilder: FormBuilder,
    private planService: PlanService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService
  ) { 

    this.listaActividades = [];
    this.municipios = environment.municipios;
    this.categorias = environment.categorias;
    this.volumenesIngreso = environment.volumenesIngreso;

    this.formGroup = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(50), Validators.pattern("[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*")]],
      informacion: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(420)]],
      precio: ['', [Validators.required, Validators.min(1000), Validators.max(9999999), Validators.pattern("[0-9]*")]],
      municipio: [null, [Validators.required]],
      volumenIngreso: [null, [Validators.required]],
      categoria: [null, [Validators.required]]      
    });

    this.actividadFormGroup = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(120)]]
    });

  }

  ngOnInit(): void {
  }

  // Métodos

  // Crear plan turístico
  public async crearPlan() : Promise<void> {

    this.spinner.show();

    if (this.formGroup.valid) {

      if (this.listaActividades.length >= 3 && this.listaActividades.length <= 15) {

        var plan: Plan = {
          nombre: this.formGroup.get('nombre')!.value,
          informacion: this.formGroup.get('informacion')!.value,
          precio: this.formGroup.get('precio')!.value,
          municipio: this.formGroup.get('municipio')!.value,
          volumenIngreso: this.formGroup.get('volumenIngreso')!.value,
          categoria: this.formGroup.get('categoria')!.value,
          listaActividades: this.listaActividades
        };

        plan.nombre = plan.nombre!.trim();
        plan.informacion = plan.informacion!.trim();

        const hash: string | null = this.authService.retornarHash();
        const email: string | null = this.authService.retornarEmail();

        await this.planService.crear(plan, hash!, email!)
          .then(res => {
            if (res == "0") {
              this.listaActividades = [];
              this.formGroup.reset();
              this.actividadFormGroup.reset();
              this.alertaService.confirmacion("Plan turístico agregado correctamente");
              this.router.navigateByUrl('/proveedor/planes');
            } else
              this.alertaService.error(res);
          });

      } else
        this.alertaService.error('El plan turístico debe tener mínimo 3 y máximo 15 actividades asociadas');

    } else
      this.alertaService.error('Completa el formulario correctamente');

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

  // Obtener los valores del formulario de registro de plan turístico
  get f() { return this.formGroup.controls }

  // Obtener los valores del formulario de registro de actividad de plan turístico
  get af() { return this.actividadFormGroup.controls }

}
