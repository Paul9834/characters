# Simpsons API MVVM + Clean Architecture

Proyecto base para estudiar consumo de APIs, organización por features y separación de responsabilidades usando MVVM y Clean Architecture.

## Objetivo

Construir una app sencilla usando `https://thesimpsonsapi.com/` como fuente de datos para entender el flujo completo desde la capa de red hasta la UI.

El enfoque del proyecto no es solo mostrar información de personajes, sino practicar una estructura mantenible y fácil de escalar.

## Qué se busca aprender

- Consumo de API REST.
- Separación de capas: presentation, domain y data.
- Uso de ViewModel como punto de coordinación de la UI.
- Definición de casos de uso.
- Implementación de repositorios.
- Mapeo entre DTOs y modelos de dominio.
- Organización por feature en lugar de agrupar todo por tipo de archivo.

## Enfoque arquitectónico

La app se plantea con dos bases principales:

- **MVVM** para manejar estado y lógica de presentación.
- **Clean Architecture** para separar reglas de negocio, acceso a datos y UI.

La idea es que la pantalla no dependa directamente de Retrofit, DTOs o detalles de infraestructura. La UI solo debería conocer estados y modelos listos para renderizar.

## Estructura propuesta

```text
app/
├── core/
│   ├── common/
│   ├── network/
│   ├── ui/
│   └── di/
└── features/
    └── characters/
        ├── data/
        │   ├── remote/
        │   ├── model/
        │   ├── mapper/
        │   └── repository/
        ├── domain/
        │   ├── model/
        │   ├── repository/
        │   └── usecase/
        └── presentation/
            ├── list/
            ├── detail/
            └── state/
```

## Responsabilidad por capa

### Presentation

Contiene pantallas, estados de UI y ViewModels.

Aquí se transforma la información del dominio en algo fácil de representar en pantalla.

### Domain

Contiene modelos de negocio, contratos de repositorio y casos de uso.

Esta capa define qué necesita la aplicación, sin saber cómo se obtiene la información.

### Data

Contiene servicios remotos, DTOs, mappers e implementaciones de repositorio.

Aquí vive la integración con el API y la transformación de datos externos hacia modelos internos.

## Flujo de datos esperado

1. La UI solicita cargar personajes.
2. El ViewModel ejecuta un caso de uso.
3. El caso de uso delega en el repositorio.
4. El repositorio consulta el origen remoto.
5. La respuesta del API se transforma a modelo de dominio.
6. El ViewModel publica un estado para la pantalla.

## Primer alcance recomendado

Para la primera versión, el proyecto puede incluir solo lo siguiente:

- Lista de personajes.
- Pantalla de detalle.
- Estados de carga, éxito y error.
- Navegación básica.

Con eso es suficiente para entender la base arquitectónica antes de agregar caché local, favoritos, búsqueda o paginación.

## Orden de implementación

1. Revisar la respuesta del API.
2. Definir modelos de dominio.
3. Crear contrato de repositorio.
4. Crear casos de uso.
5. Implementar capa data.
6. Crear ViewModel.
7. Conectar la UI.
8. Ajustar estados y errores.

## Idea principal

El valor de este proyecto no está en la complejidad funcional, sino en entender con claridad:

- qué hace cada capa,
- qué dependencias debe conocer cada módulo,
- y cómo mantener una estructura limpia desde el inicio.

## Siguiente paso

Después de esta base, se puede construir el feature `characters` completo con Kotlin, Retrofit, Hilt y Jetpack Compose.
