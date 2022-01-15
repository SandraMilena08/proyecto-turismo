// Librerías
import { Observable } from "rxjs";
import { Injectable } from "@angular/core";
import { map, catchError } from 'rxjs/operators';
import { AbstractControl, AsyncValidator, ValidationErrors } from "@angular/forms";

// Servicios
import { UsuarioService } from "../services/usuario.service";

@Injectable({
    providedIn: 'root'
})
export class EmailDirective implements AsyncValidator {

    // Constructor
    constructor(
        private usuarioService: UsuarioService
    ) { }

    // Métodos

    // Validar existencia de un correo electrónico
    public validate(cntrl: AbstractControl) : Promise<ValidationErrors | null> | Observable<ValidationErrors | null> {
        return this.usuarioService.validarEmail(cntrl.value)
            .pipe(
                map(exists => (exists === true ? { emailExiste: true } : null)),
                catchError(async _ => null)
            );
    }

}