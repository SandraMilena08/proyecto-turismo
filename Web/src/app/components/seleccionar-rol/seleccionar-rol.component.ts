// Módulos
import { Router } from '@angular/router';
import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-seleccionar-rol',
  templateUrl: './seleccionar-rol.component.html',
  styleUrls: ['./seleccionar-rol.component.css']
})
export class SeleccionarRolComponent implements OnInit {

  // Variables
  @Input() ruta?: string;
  @Input() titulo?: string;
  public roles: any[];

  // Constructor
  constructor(
    private router: Router
  ) { 
    this.roles = [
      {
        nombre: 'Turista',
        funciones: [
          'Ver planes y servicios turísticos registrados',
          'Ver información de contacto de las empresas registradas',
          'Recibir recomendaciones de planes y servicios'
        ]
      },
      {
        nombre: 'Proveedor',
        funciones: [
          'Registrar planes y servicios turísticos',
          'Registrar información de contacto de tu empresa',
          'Apoyar el turismo de la región del Gualivá'
        ]
      }
    ];
  }

  ngOnInit(): void {        
  }

  // Métodos  
  public navegar(rol: string) : void {
    this.router.navigateByUrl(`${ this.ruta }/${ rol.toLocaleLowerCase() }`);
  }

}
