// Módulos
import { Component, Input, OnInit } from '@angular/core';

// Interfaces
import { Plan } from 'src/app/interfaces/plan.interface';
import { Servicio } from 'src/app/interfaces/servicio.interface';
import { Proveedor } from 'src/app/interfaces/proveedor.interface';

@Component({
  selector: 'app-ot-detail',
  templateUrl: './ot-detail.component.html',
  styleUrls: ['./ot-detail.component.css']
})
export class OtDetailComponent implements OnInit {

  // Variables
  @Input() plan?: Plan;
  @Input() modulo!: string;
  @Input() servicio?: Servicio;
  @Input() listaPlanes?: Plan[];
  @Input() proveedor?: Proveedor;
  @Input() listaServicios?: Servicio[];  

  // Constructor
  constructor() { }

  ngOnInit(): void {
  }

  // Métodos

}
