// Módulos
import { Pipe, PipeTransform } from "@angular/core";

@Pipe({ name: 'subString' })
export class SubStringPipe implements PipeTransform {
    transform(value: string, cantidad: number) : string {        
        if (value.length >= cantidad)
            return value.substr(0, (cantidad - 3)).concat(' ..');
        
        return value;
    }
}