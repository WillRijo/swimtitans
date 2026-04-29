# Estructura del codigo

Esta es la estructura principal de `lib/`:

```text
lib/
  main.dart
  aplicacion.dart
  modelos/
    distancia_nado.dart
    modo_juego.dart
    tipo_nado.dart
  pantallas/
    pantalla_inicio.dart
    pantalla_juego.dart
  widgets/
    boton_distancia.dart
    boton_tipo_nado.dart
    selector_modo.dart
    sprite_nadador.dart
    sprite_sheet_nadador.dart
    vista_piscina.dart
```

## main.dart

Es el punto de entrada de la app.

Aqui empieza Flutter y se llama a `AplicacionSwimTitans`.

## aplicacion.dart

Define la app principal.

Aqui se configura `MaterialApp`, el titulo de la app, el tema base y la primera pantalla.

## modelos/

La carpeta `modelos/` guarda datos simples del juego.

### distancia_nado.dart

Define las distancias:

- 50 m
- 100 m
- 200 m
- 400 m

Tambien calcula metros, vueltas y progreso necesario para ganar.

### modo_juego.dart

Define los modos del juego:

- Practica
- Competencia

Por ahora solo se usa practica.

### tipo_nado.dart

Define los tipos de nado:

- Libre
- Mariposa
- Pecho
- Dorso

Tambien define cuanto avanza el nadador por cada accion.

## pantallas/

La carpeta `pantallas/` tiene las pantallas completas de la app.

### pantalla_inicio.dart

Es la pantalla donde se elige el tipo de nado y la distancia.

### pantalla_juego.dart

Es la pantalla donde ocurre la practica dentro de la piscina.

## widgets/

La carpeta `widgets/` tiene piezas visuales mas pequenas.

### boton_distancia.dart

Boton para elegir una distancia.

### boton_tipo_nado.dart

Boton para elegir un tipo de nado.

### selector_modo.dart

Muestra el modo practica y el modo competencia como proximo.

### sprite_nadador.dart

Elige que sprite debe mostrar el nadador.

### sprite_sheet_nadador.dart

Anima una imagen tipo sprite sheet horizontal.

### vista_piscina.dart

Dibuja la piscina, los carriles, el nadador y las zonas tactiles.
