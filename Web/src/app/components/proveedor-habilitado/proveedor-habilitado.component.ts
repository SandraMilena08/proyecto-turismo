// Módulos
import { Component, OnInit } from '@angular/core';

// Servicios
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-proveedor-habilitado',
  templateUrl: './proveedor-habilitado.component.html',
  styleUrls: ['./proveedor-habilitado.component.css']
})
export class ProveedorHabilitadoComponent implements OnInit {

  // Variables
  public proveedorHabilitado: boolean; // Estado de habilitado del proveedor

  // Constructor
  constructor(
    private authService: AuthService
  ) { 
    this.proveedorHabilitado = true;
  }

  ngOnInit(): void {
    this.proveedorHabilitado = this.authService.retornarHabilitadoProveedor();
  }

}
