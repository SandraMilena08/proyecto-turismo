// Interfaces
import { Usuario } from "./usuario.interface";

// Interfaz administrador
export interface Administrador extends Usuario {
    apellido?: string;
}