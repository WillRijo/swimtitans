# main y runApp

**Nivel:** Aprender

## Objetivo

Entender donde empieza una app de Flutter.

## Herramientas que vamos a usar

- `lib/main.dart`
- Funcion `main`
- Funcion `runApp`

## Idea principal

Toda app Flutter necesita un punto de inicio.

`main()` es como la puerta de entrada de la app.

`runApp()` le dice a Flutter que widget debe mostrar primero.

## Codigo importante

Este es un ejemplo corto:

```dart
void main() {
  runApp(const MyApp());
}
```

`void` significa que esta funcion no devuelve una respuesta.

`main` es el nombre especial de la funcion que empieza todo.

Las llaves `{ }` guardan lo que la funcion hace.

`runApp` prende la app de Flutter.

`MyApp` es el primer widget que Flutter va a mostrar.

## Explicacion paso a paso

1. Flutter busca la funcion `main`.
2. Dentro de `main`, encuentra `runApp`.
3. `runApp` recibe el primer widget.
4. Flutter dibuja ese widget en la pantalla.

En Swim Titans tendremos algo parecido:

```dart
void main() {
  runApp(const AplicacionSwimTitans());
}
```

`AplicacionSwimTitans` sera la app principal del juego.

## Lo que haremos despues

Despues aprenderemos que es un widget.

## Actividad

1. Abre `lib/main.dart` en tu proyecto de prueba.
2. Encuentra la palabra `main`.
3. Encuentra la palabra `runApp`.
4. Di en voz alta:

```text
main empieza la app y runApp muestra el primer widget.
```

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Entender app inicial](01_entender_app_inicial.md)  
[Siguiente leccion: Widgets](03_widgets.md)  
