// This file can be replaced during build by using the `fileReplacements` array.
// `ng build` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  webAPI: 'https://localhost:44396/api',
  webImages: 'https://localhost:44396/Imagenes',
  poblaciones: [
    "Jovenes",
    "Adultos jovenes",
    "Adultos",
    "Adultos mayores",
    "Ancianos",
    "Longevos" // >= 75 años
  ],
  categoriasTurismo: [
    'Salud',
    'Natural',
    'Cultural',
    'Deportivo',
    'Esparcimiento'
  ],
  volumenesIngreso: [
    {
      id: 0,
      nombre: 'Individual'
    },
    {
      id: 1,
      nombre: 'Grupal'
    },
    {
      id: 2,
      nombre: 'Familiar'
    }
  ],
  categorias: [
    {
      id: 0,
      nombre: 'Salud',
      descripcion: 'Se lleva a cabo con fines de salud y médicos'
    },
    {
      id: 1,
      nombre: 'Natural',
      descripcion: 'Tiene como objetivo que los turistas disfruten por medio del contacto con la naturaleza'
    },
    {
      id: 2,
      nombre: 'Cultural',
      descripcion: 'Tiene como objetivo enriquecer los conocimientos de los turistas aplicado a regiones, pueblos o temas'
    },
    {
      id: 3,
      nombre: 'Deportivo',
      descripcion: 'Tiene como objetivo la realización de actividades deportivas'
    },
    {
      id: 4,
      nombre: 'Esparcimiento',
      descripcion: 'Tiene como objetivo la relajación y la distracción de los turistas'
    }
  ],
  municipios: [
    {
      id: 0,
      nombre: 'Albán'
    },
    {
      id: 1,
      nombre: 'La Peña'
    },
    {
      id: 2,
      nombre: 'La Vega'
    },
    {
      id: 3,
      nombre: 'Nimaima'
    },
    {
      id: 4,
      nombre: 'Nocaima'
    },
    {
      id: 5,
      nombre: 'Quebradanegra'
    },
    {
      id: 6,
      nombre: 'San Francisco'
    },
    {
      id: 7,
      nombre: 'Sasaima'
    },
    {
      id: 8,
      nombre: 'Supatá'
    },
    {
      id: 9,
      nombre: 'Útica'
    },
    {
      id: 10,
      nombre: 'Vergara'
    },
    {
      id: 11,
      nombre: 'Villeta'
    }
  ],
  meses: [
    {
      id: 1,
      nombre: 'Enero'
    },
    {
      id: 2,
      nombre: 'Febrero'
    },
    {
      id: 3,
      nombre: 'Marzo'
    },
    {
      id: 4,
      nombre: 'Abril'
    },
    {
      id: 5,
      nombre: 'Mayo'
    },
    {
      id: 6,
      nombre: 'Junio'
    },
    {
      id: 7,
      nombre: 'Julio'
    },
    {
      id: 8,
      nombre: 'Agosto'
    },
    {
      id: 9,
      nombre: 'Septiembre'
    },
    {
      id: 10,
      nombre: 'Octubre'
    },
    {
      id: 11,
      nombre: 'Noviembre'
    },
    {
      id: 12,
      nombre: 'Diciembre'
    }
  ],
  years: [2021, 2022, 2023, 2024]
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/plugins/zone-error';  // Included with Angular CLI.
