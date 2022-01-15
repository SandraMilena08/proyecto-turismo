// Módulos
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-planes',
  templateUrl: './planes.component.html',
  styleUrls: ['./planes.component.css']
})
export class PlanesComponent implements OnInit {

  // Constructor
  constructor() { }

  ngOnInit(): void {
    sessionStorage.removeItem("fil_search"); // Eliminar el objeto de búsqueda cada vez que se entre al módulo de servicios
  }

}
