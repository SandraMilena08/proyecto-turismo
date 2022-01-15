// Interfaces
import { OfertaTuristica } from "./oferta-turistica.interface";

// Interfáz plan
export interface Plan extends OfertaTuristica {
    actividades?: string;
    listaActividades?: string[];
}