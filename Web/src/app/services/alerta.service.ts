// Módulos
import Swal from 'sweetalert2';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AlertaService {

  private Toast: any;

  // Constructor
  constructor() { 
    this.Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    });
  }

  // Métodos

  // Alerta de confirmación
  public confirmacion(titulo: string) : void {    
    this.Toast.fire({
      icon: 'success',
      title: titulo
    });
  }

  // Alerta de error
  public error(titulo: string) : void {
    this.Toast.fire({
      icon: 'error',
      title: titulo
    });
  }

}
