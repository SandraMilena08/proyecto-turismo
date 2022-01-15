// Módulos
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-listar',
  templateUrl: './listar.component.html',
  styleUrls: ['./listar.component.css']
})
export class ListarComponent implements OnInit {

  // Constructor
  constructor() { }

  ngOnInit(): void {
    sessionStorage.removeItem("fil_search"); // Eliminar el objeto de búsqueda cada vez que se entre al módulo de planes
  }

}
