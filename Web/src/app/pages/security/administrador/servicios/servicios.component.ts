// Módulos
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-servicios',
  templateUrl: './servicios.component.html',
  styleUrls: ['./servicios.component.css']
})
export class ServiciosComponent implements OnInit {  

  // Constructor
  constructor() { }

  ngOnInit(): void {
    sessionStorage.removeItem("fil_search"); // Eliminar el objeto de búsqueda cada vez que se entre al módulo de servicios
  }

}
