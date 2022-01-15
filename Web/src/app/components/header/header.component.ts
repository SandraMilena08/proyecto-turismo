// Módulos
import { Router } from '@angular/router';
import { Component, OnInit, Input, ViewChild, ElementRef } from '@angular/core';

// Servicios
import { NgxSpinnerService } from 'ngx-spinner';
import { AuthService } from 'src/app/services/auth.service';
import { AlertaService } from 'src/app/services/alerta.service';
import { SeguridadService } from 'src/app/services/seguridad.service';

// Environment
import { environment } from 'src/environments/environment';

const webImages = environment.webImages;

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  // Variables
  public usuario: string;
  public menuAdmin: any[];
  public menuTurista: any[];
  public menuAnonimo: any[];
  public menuProveedor: any[];
  public estadoUlTurista: boolean;
  public estadoUlProveedor: boolean;
  public estadoUlAdministrador: boolean;
  public datosUsuario?: { [key :string]: string } | null;
  @Input() rol?: string;  
  @ViewChild('navMenu') navMenu?: ElementRef;
  @ViewChild('ulTurista') ulTurista?: ElementRef;
  @ViewChild('ulProveedor') ulProveedor?: ElementRef;
  @ViewChild('ulAdministrador') ulAdministrador?: ElementRef;

  // Constructor
  constructor(
    private router: Router,
    private authService: AuthService,
    private spinner: NgxSpinnerService,
    private alertaService: AlertaService,
    private seguridadService: SeguridadService
  ) { 
    this.usuario = "anonimo";
    this.estadoUlTurista = false;
    this.estadoUlProveedor = false;
    this.estadoUlAdministrador = false;
    this.menuAnonimo = [
      {
        texto: 'Inicio',
        ruta: '/inicio'
      },
      {
        texto: 'Planes',
        ruta: '/planes/0/12'
      },
      {
        texto: 'Servicios',
        ruta: '/servicios/0/12'
      }      
    ];
    this.menuTurista = [
      {
        texto: 'Inicio',
        ruta: '/inicio'
      },
      {
        texto: 'Planes',
        ruta: '/planes/0/12'
      },
      {
        texto: 'Servicios',
        ruta: '/servicios/0/12'
      },      
      {
        texto: 'Recomendaciones',
        ruta: '/turista/recomendaciones'
      }
    ];

    this.menuProveedor = [
      {
        texto: 'Planes',
        ruta: '/proveedor/planes'
      },
      {
        texto: 'Servicios',
        ruta: '/proveedor/servicios'
      }
    ];

    this.menuAdmin = [
      {
        texto: 'Planes',
        ruta: '/administrador/planes/0/12'
      },
      {
        texto: 'Servicios',
        ruta: '/administrador/servicios/0/12'
      },
      {
        texto: 'Proveedores',
        ruta: '/administrador/proveedores/0/12'
      },      
      {
        texto: 'Reportes',
        ruta: '/administrador/reportes'
      }
    ];
  }

  ngOnInit(): void {     
    this.usuario = this.authService.retornarRol().toString();
    this.datosUsuario = this.authService.retornarIconoNombre();  
    if (this.usuario != "anonimo")  
      this.datosUsuario!.icono = `${ webImages }/${ this.datosUsuario!.icono }`;    
  }

  // Métodos

  // Navegar
  public navegar(ruta: string) : void {
    this.router.navigateByUrl(ruta);
  }

  // Mostrar menú
  public mostrarMenu() : void {    
    this.navMenu!.nativeElement.classList.add('mostrar-menu');
  }
  
  // Cerrar menú
  public cerrarMenu() : void {
    this.navMenu!.nativeElement.classList.remove('mostrar-menu');
  }

  // Cerrar sesión
  public async cerrarSesion() : Promise<void> {

    this.spinner.show();

    const email: string | null = this.authService.retornarEmail();

    await this.seguridadService.cerrarSesion(email!)
      .then((res: string) => {
        if (res == "0") {
          this.router.navigateByUrl('/iniciar-sesion');
          this.alertaService.confirmacion("Sesión finalizada correctamente");
        } else {
          this.alertaService.error(res);
        }
      });

    this.spinner.hide();

  }

  // Mostrar menú turista
  public mostrarMenuTurista() : void {    

    if (this.estadoUlTurista == false)
      this.ulTurista!.nativeElement.classList.add('mostrar-menu-usuario');
    else
      this.ulTurista!.nativeElement.classList.remove('mostrar-menu-usuario');

    this.estadoUlTurista = !this.estadoUlTurista;
  }

  // Mostrar menú proveedor
  public mostrarMenuProveedor() : void {

    if (this.estadoUlProveedor == false)
      this.ulProveedor!.nativeElement.classList.add('mostrar-menu-usuario');
    else
      this.ulProveedor!.nativeElement.classList.remove('mostrar-menu-usuario');

    this.estadoUlProveedor = !this.estadoUlProveedor;
  }
  
  // Mostrar menú administrador
  public mostrarMenuAdministrador() : void {

    if (this.estadoUlAdministrador == false)
      this.ulAdministrador!.nativeElement.classList.add('mostrar-menu-usuario');
    else
      this.ulAdministrador!.nativeElement.classList.remove('mostrar-menu-usuario');

    this.estadoUlAdministrador = !this.estadoUlAdministrador;

  }

}
