// Módulos
import { Component, Input, OnInit } from '@angular/core';

// Interfaces
import { OfertaTuristica } from 'src/app/interfaces/oferta-turistica.interface';

@Component({
  selector: 'app-oferta-turistica',
  templateUrl: './oferta-turistica.component.html',
  styleUrls: ['./oferta-turistica.component.css']
})
export class OfertaTuristicaComponent implements OnInit {

  // Variables
  @Input() servicio?: OfertaTuristica;

  // Constructor
  constructor() { }

  ngOnInit(): void {

  }

}
