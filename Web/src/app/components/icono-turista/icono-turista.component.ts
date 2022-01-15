// Módulos
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-icono-turista',
  templateUrl: './icono-turista.component.html',
  styleUrls: ['./icono-turista.component.css']
})
export class IconoTuristaComponent implements OnInit {

  // Variables
  public iconos: string[];
  @Input() iconoSeleccionado?: number;
  @Output() eventEmitter = new EventEmitter<string>();

  // Constructor
  constructor() {        
    this.iconos = [
      'Avatar/avatar-1.png',
      'Avatar/avatar-2.png',
      'Avatar/avatar-3.png',
      'Avatar/avatar-4.png'
    ];    
  }

  ngOnInit(): void {
  }

  // Métodos

  // Cambiar el valor del icono seleccionado
  public setIconoSeleccionado(indice: number) : void {
    this.iconoSeleccionado = indice;
    this.eventEmitter.emit(this.iconos[indice]);
  }

}
