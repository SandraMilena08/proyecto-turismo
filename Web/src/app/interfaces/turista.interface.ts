// Interfaces
import { Usuario } from "./usuario.interface";

// Interfaz turista
export interface Turista extends Usuario {
    apellido?: string;
    fechaNacimiento?: string;
    poblacion?: string;
}