// Interfaces
import { Usuario } from "./usuario.interface";

// Interfaz proveedor
export interface Proveedor extends Usuario {
    nit?: string;
    telefono?: string;
    municipio?: string;
    direccion?: string;
    habilitado?: boolean;
}