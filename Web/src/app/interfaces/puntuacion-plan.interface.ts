// Interfaces
import { Puntuacion } from "./puntuacion.interface";

// Interfaz de puntuación de plan turístico
export interface PuntuacionPlan extends Puntuacion {
    planId?: number
}