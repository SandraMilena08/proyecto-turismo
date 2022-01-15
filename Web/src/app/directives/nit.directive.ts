// Librerías
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { map, catchError } from 'rxjs/operators';
import { AbstractControl, AsyncValidator, ValidationErrors } from "@angular/forms";

// Servicios
import { ProveedorService } from "../services/proveedor.service";

@Injectable({
    providedIn: 'root'
})
export class NitDirective implements AsyncValidator {

    // Constructor
    constructor(
        private proveedorService: ProveedorService
    ) { }

    // Métodos

    // Validar existencia de un nit
    public validate(cntrl: AbstractControl) : Promise<ValidationErrors | null> | Observable<ValidationErrors | null> {
        return this.proveedorService.validarNit(cntrl.value)
            .pipe(
                map(exists => (exists === true ? { nitExiste: true } : null)),
                catchError(async _ => null)
            );
    }

}