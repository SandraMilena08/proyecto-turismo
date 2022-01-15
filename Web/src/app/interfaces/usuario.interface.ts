// Interfaz usuario
export interface Usuario {
    id?: number;
    nombre?: string;
    icono?: string;
    correoElectronico?: string;
    clave?: string;
    verificado?: boolean;
    hash?: string;
}