// Interfáz oferta turística
export interface OfertaTuristica {
    id?: number;
    nombre?: string;
    informacion?: string;
    precio?: number;
    puntuacion?: number;
    imagen?: string;
    municipio?: string;
    volumenIngreso?: string;
    categoria?: string;
    fechaCreacion?: Date;
    proveedorId?: number;
    imagenes?: string[];
    habilitado?: boolean;
};