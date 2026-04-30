# Text, Column y Row

**Nivel:** Practicar

## Objetivo

Practicar como mostrar texto y ordenar cosas en vertical u horizontal.

## Herramientas que vamos a usar

- `lib/main.dart`
- Widget `Text`
- Widget `Column`
- Widget `Row`

## Idea principal

- `Text` muestra palabras en la pantalla.
- `Column` acomoda widgets de arriba hacia abajo.
- `Row` acomoda widgets de izquierda a derecha.

## Codigo importante

Ejemplo corto:

```dart
Column(
  children: [
    Text('Swim Titans'),
    Text('Elige tu nado'),
    Row(
      children: [
        Text('Libre'),
        Text('Dorso'),
      ],
    ),
  ],
)
```

## Explicacion paso a paso

La `Column` es como una lista vertical.

Primero aparece `Swim Titans`.

Debajo aparece `Elige tu nado`.

Luego aparece una `Row`.

La `Row` muestra `Libre` y `Dorso` uno al lado del otro.

## Conectar con Swim Titans

En la pantalla de inicio usaremos:

- `Text` para el titulo.
- `Column` para poner cosas de arriba hacia abajo.
- `Row` o `Wrap` para poner botones uno al lado del otro.

## Lo que haremos despues

Despues aprenderemos botones.

## Actividad

Crea una pantalla simple con:

- Un texto grande: `Swim Titans`.
- Un texto debajo: `Elige tu nado`.
- Una fila con dos textos: `Libre` y `Dorso`.

Pregunta:

Que pasaria si cambiaras `Row` por `Column`?
