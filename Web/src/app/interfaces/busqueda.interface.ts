// Interfaz de búsqueda
export interface Busqueda {
    nombre?: string,
    precios?: number[],
    municipios?: string[],
    categorias?: string[],
    puntuaciones?: number[],
    estado?: boolean
}