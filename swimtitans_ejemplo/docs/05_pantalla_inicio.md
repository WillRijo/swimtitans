# Pantalla de inicio

La pantalla de inicio esta en:

```text
lib/pantallas/pantalla_inicio.dart
```

Esta pantalla sirve para preparar la practica.

## Partes de la pantalla

La pantalla tiene:

- Titulo
- Icono
- Selector de modo
- Selector de tipo de nado
- Selector de distancia
- Boton para iniciar practica

## Titulo

El titulo principal es:

```text
Swim Titans
```

## Icono

El icono se carga desde:

```text
assets/images/iconos/icono.png
```

Se muestra debajo del titulo.

## Modo

El modo se muestra con `SelectorModo`.

Por ahora:

- Practica esta activo
- Competencia queda como opcion futura

## Tipo de nado

La seccion de tipo de nado usa botones para elegir:

- Libre
- Mariposa
- Pecho
- Dorso

La variable que guarda esta seleccion es:

```text
tipoNadoSeleccionado
```

## Distancia

La seccion de distancia usa botones para elegir:

- 50 m
- 100 m
- 200 m
- 400 m

La variable que guarda esta seleccion es:

```text
distanciaSeleccionada
```

## Boton Iniciar practica

El boton `Iniciar practica` llama a:

```text
iniciarPractica
```

## iniciarPractica

`iniciarPractica` abre `PantallaJuego`.

Tambien envia:

```text
tipoNadoSeleccionado
distanciaSeleccionada
```

Asi la pantalla de juego sabe que tipo de practica debe iniciar.
