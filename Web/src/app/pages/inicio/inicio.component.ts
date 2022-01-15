// Módulos
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';

// Interfaces
import { Municipio } from 'src/app/interfaces/municipio.interface';

// Municipios
import { MUNICIPIOS } from 'src/app/extras/mock-municipios';

// Módulos Swiper 
import SwiperCore, { EffectCoverflow, Pagination } from 'swiper/core';
SwiperCore.use([EffectCoverflow, Pagination]);

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {

  // Variables
  public listaMunicipios: Municipio[] = MUNICIPIOS;

  // Constructor
  constructor(
    private router: Router
  ) { }

  ngOnInit(): void {
    
  }

  // Métodos

  // Mostrar información de un municipio
  public mostrarMunicipio(id: number) : void {
    this.listaMunicipios.forEach(municipio => {
      municipio.activo = false;
    });
    this.listaMunicipios[id].activo = true;
  }

  // Scroll
  public scroll() : void {
    document.querySelector('#towns-data')?.scrollIntoView({ block: 'start' });
  }

  // Redirigir a mostrar servicios turísticos
  public redirigir(ruta: string) : void {
    this.router.navigateByUrl(ruta);
  }

}
