# Widgets

**Nivel:** Aprender

## Objetivo

Entender que los widgets son las piezas que forman una pantalla en Flutter.

## Herramientas que vamos a usar

- Flutter
- `lib/main.dart`
- Widgets como `Text`, `Column`, `Row`, `Scaffold`, `Image` y `Button`

## Idea principal

En Flutter casi todo lo que vemos en pantalla es un widget.

Un widget es como una pieza o bloque.

Juntamos widgets pequenos para crear una pantalla completa.

## Ejemplos de widgets

- `Text`: muestra palabras.
- `Image`: muestra una imagen.
- `Column`: acomoda cosas de arriba hacia abajo.
- `Row`: acomoda cosas de izquierda a derecha.
- `Scaffold`: ayuda a crear la estructura basica de una pantalla.
- `Button`: sirve para tocar y hacer algo.

## Codigo importante

Ejemplo corto:

```dart
Column(
  children: [
    Text('Swim Titans'),
    Text('Elige tu nado'),
  ],
)
```

`Column` guarda varios widgets.

`children` significa hijos.

Los hijos aparecen de arriba hacia abajo.

En este ejemplo hay dos textos.

## Conectar con Swim Titans

Swim Titans usara widgets para crear:

- titulo del juego
- icono
- botones de nado
- botones de distancia
- piscina
- nadador
- barra de progreso

## Lo que haremos despues

Despues practicaremos con `Text`, `Column` y `Row`.

## Actividad

Haz una lista de cinco widgets que podrian existir en Swim Titans.

Ejemplo:

- Titulo
- Boton Libre
- Boton 50 m
- Imagen del nadador
- Piscina

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: main y runApp](02_main_y_runapp.md)  
[Siguiente leccion: Text, Column y Row](04_text_column_row.md)  
