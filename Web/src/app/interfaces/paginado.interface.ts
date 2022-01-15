// Interfaces
import { OfertaTuristica } from "./oferta-turistica.interface";

// Interfaz de paginado
export interface Paginado<OfertaTuristica> {
    contenido?: OfertaTuristica[],
    paginaActual?: number,
    totalPaginas?: number,
    totalItems?: number
};