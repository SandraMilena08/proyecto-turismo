// Módulos
import { FormGroup, AbstractControl } from "@angular/forms";

// Métodos

// Validar coincidencia de claves
export function clavesIguales(controlClave: string, controlConfirmarClave: string) {

    return (formGroup: FormGroup) => {

        const control = formGroup.controls[controlClave];
        const controlConfirmar = formGroup.controls[controlConfirmarClave];

        if (controlConfirmar.errors && !controlConfirmar.errors.clavesCoinciden) {
            return;
        }

        if (control.value !== controlConfirmar.value) controlConfirmar.setErrors({ wrongPass: true });
        else controlConfirmar.setErrors(null);

    };

}

// Validar edad mediante fecha de nacimiento
export function Edad(control: AbstractControl) : { [key: string]: boolean } | null {        

    if (control.value != null && control.value !== '') {            

        const fechaActual: Date = new Date();
        const fechaNacimiento: Date = new Date(control.value);          
        
        var edad = fechaActual.getFullYear() - fechaNacimiento.getFullYear();        

        if (fechaNacimiento.getMonth() > fechaActual.getMonth()) edad--;

        // Verificar si todos los navegadores restan un día a la fecha que se ingrese **
        if (fechaNacimiento.getMonth() == fechaActual.getMonth())
            if ((fechaNacimiento.getDate() + 1) > fechaActual.getDate()) edad--; // ** fechaNacimiento.getDate() + 1                        

        if (edad < 18) return { 'wrongAge': true };        

    }

    return null;

}