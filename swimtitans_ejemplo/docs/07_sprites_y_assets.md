# Sprites y assets

Los assets son archivos que usa la app, como imagenes e iconos.

## Assets principales

El icono de la app esta en:

```text
assets/images/iconos/icono.png
```

Los sprites del nadador estan en:

```text
assets/images/swimmers/espera.png
assets/images/swimmers/libre.png
assets/images/swimmers/dorso.png
assets/images/swimmers/pecho.png
assets/images/swimmers/mariposa.png
```

## espera.png

`espera.png` tiene 4 frames.

Representa al nadador flotando o esperando.

Se usa cuando el jugador no esta haciendo una accion reciente.

## Sprites de nado

Los sprites de nado tienen 8 frames:

- `libre.png`
- `dorso.png`
- `pecho.png`
- `mariposa.png`

Cada imagen es un sprite sheet horizontal.

Esto significa que los frames estan en una sola fila.

## SpriteNadador

`SpriteNadador` esta en:

```text
lib/widgets/sprite_nadador.dart
```

Su trabajo es decidir que sprite se debe mostrar.

Ejemplos:

- Si el nadador esta en espera, usa `espera.png`
- Si el tipo de nado es libre, usa `libre.png`
- Si el tipo de nado es dorso, usa `dorso.png`
- Si el tipo de nado es pecho, usa `pecho.png`
- Si el tipo de nado es mariposa, usa `mariposa.png`

Tambien guarda configuraciones de:

- Ruta
- Cantidad de frames
- Ancho
- Alto
- Duracion por frame

## SpriteSheetNadador

`SpriteSheetNadador` esta en:

```text
lib/widgets/sprite_sheet_nadador.dart
```

Es la pieza interna que anima el sprite sheet.

Usa un temporizador para cambiar de frame.

La idea simple es:

1. Recortar un frame.
2. Mostrar ese frame.
3. Cambiar al siguiente frame despues de un tiempo.
4. Repetir.

## Rutas en pubspec.yaml

Flutter necesita saber que carpetas de assets puede usar.

Las rutas se declaran en:

```text
pubspec.yaml
```

En este proyecto se declaran:

```text
assets/images/iconos/
assets/images/swimmers/
```
