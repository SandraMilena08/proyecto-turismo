// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AlertaService } from 'src/app/services/alerta.service';
import { ProveedorService } from 'src/app/services/proveedor.service';

// Directivas
import { NitDirective } from 'src/app/directives/nit.directive';
import { EmailDirective } from 'src/app/directives/email.directive';

// Interfaces
import { Proveedor } from 'src/app/interfaces/proveedor.interface';

// Validadores
import * as Validadores from 'src/app/validators/validators';

// Environments
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-proveedor',
  templateUrl: './proveedor.component.html',
  styleUrls: ['./proveedor.component.css']
})
export class ProveedorComponent implements OnInit {

  // Variables
  public municipios: any[];
  public formGroup: FormGroup;  

  // Constructor
  constructor(
    private router: Router,
    private formBuilder: FormBuilder,
    private nitDirective: NitDirective,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private emailDirective: EmailDirective,
    private proveedorService: ProveedorService
  ) { 
    this.municipios = environment.municipios;
    this.formGroup = this.formBuilder.group({
      nombre: ['', [Validators.required, Validators.minLength(4), Validators.maxLength(50), Validators.pattern('[a-zA-ZáéíóúÁÉÍÓÚñÑ ]*')]],
      nit: ['', [Validators.required, Validators.pattern('([0-9]{8,10})+-[0-9]{1}')], this.nitDirective.validate.bind(this.nitDirective)],
      municipio: [null, [Validators.required]],
      direccion: ['', [Validators.minLength(5), Validators.maxLength(120)]],
      telefono: ['', [Validators.required, Validators.minLength(7), Validators.maxLength(10), Validators.pattern('[0-9]*')]],
      email: ['', [Validators.required, Validators.email], this.emailDirective.validate.bind(this.emailDirective)],
      clave: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20), Validators.pattern("[A-Za-z0-9!?-]*")]],
      confirmarClave: ['', [Validators.required]]
    }, {
      validators: [
        Validadores.clavesIguales('clave', 'confirmarClave')
      ]
    });
  }

  ngOnInit(): void {
  }

  // Métodos

  // Crear proveedor
  public async crearProveedor() : Promise<void> {

    this.spinner.show();

    if (this.formGroup.valid) {

      var proveedor: Proveedor = {
        nombre: this.formGroup.get('nombre')!.value,
        correoElectronico: this.formGroup.get('email')!.value,
        clave: this.formGroup.get('clave')!.value,
        nit: this.formGroup.get('nit')!.value,
        municipio: this.formGroup.get('municipio')!.value,
        direccion: this.formGroup.get('direccion')?.value,
        telefono: this.formGroup.get('telefono')!.value
      };

      proveedor.correoElectronico = proveedor.correoElectronico!.trim();
      if (proveedor.direccion != null) proveedor.direccion = proveedor.direccion.trim();

      await this.proveedorService.crear(proveedor)
        .then(res => {
          if (res == "0") 
            this.router.navigateByUrl('/registro/pre-registro');
          else
            this.alertaService.error(res);
        });

    } else this.alertaService.error('Completa el formulario correctamente');

    this.spinner.hide();

  }

  // Obtener los valores del formulario de registro de proveedor
  get f() { return this.formGroup.controls }

  // Obtener la cantidad de letras del campo dirección
  get qd() { 
    var direccion: string = this.formGroup.get('direccion')?.value;
    return direccion.length;
  }

}
