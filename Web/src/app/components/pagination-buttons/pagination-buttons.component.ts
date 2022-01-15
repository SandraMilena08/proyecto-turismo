// Módulos
import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';

const NumeroBotones = 5;

@Component({
  selector: 'app-pagination-buttons',
  templateUrl: './pagination-buttons.component.html',
  styleUrls: ['./pagination-buttons.component.css']
})
export class PaginationButtonsComponent implements OnInit, OnChanges {

  // Variables  
  public estado?: string;
  public listaBotones: number[];
  @Input() totalPaginas!: number;
  @Input() paginaActual!: number;
  @Output() recargarModulo = new EventEmitter<number>(); // Evento que solicita recargar página

  // Constructor
  constructor() { 
    this.listaBotones = [];
  }

  ngOnInit(): void {    
    this.prepararBotones();    
  }

  ngOnChanges(changes: SimpleChanges) : void {      
    if (changes["totalPaginas"]) this.totalPaginas = changes["totalPaginas"].currentValue;
    if (changes["paginaActual"]) this.paginaActual = changes["paginaActual"].currentValue;    
    this.prepararBotones();  
  }

  // Métodos

  // Paginación
  public paginar(pagina: number) : void {       
    this.recargarModulo.emit(pagina);
  }

  // Preparar botones de paginación
  private prepararBotones() : void {    

    this.listaBotones = [];
    
    if (this.totalPaginas == 1) {

      this.estado = "none";      

    } else if (this.totalPaginas <= NumeroBotones) {

      this.estado = "none";

      for (let i = 1; i < this.totalPaginas - 1; i++)
        this.listaBotones.push(i+1);

    } else {      

      if (NumeroBotones - this.paginaActual > 0) {

        for (let i = 1; i < NumeroBotones; i++)
          this.listaBotones.push(i+1);              

        this.estado = "last";

      } else if (this.paginaActual + NumeroBotones > this.totalPaginas) {        

        for (let i = (this.totalPaginas - (NumeroBotones - 2)); i < this.totalPaginas; i++)
          this.listaBotones.push(i);

        this.estado = "first";

      } else {        

        this.listaBotones.push(this.paginaActual-1);
        this.listaBotones.push(this.paginaActual);
        this.listaBotones.push(this.paginaActual+1);      
        
        this.estado = "both";

      }              

    }

  }

}
