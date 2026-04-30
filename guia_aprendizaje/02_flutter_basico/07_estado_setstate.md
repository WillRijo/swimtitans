# Estado y setState

**Nivel:** Aprender y Practicar

## Objetivo

Entender como una pantalla cambia cuando cambian sus datos.

## Herramientas que vamos a usar

- `StatefulWidget`
- `setState`
- Variables
- Un contador simple

## Idea principal

- El estado es la memoria de una pantalla.
- Una pantalla puede recordar datos.
- Cuando un dato cambia, queremos que la pantalla tambien cambie.
- `setState` le avisa a Flutter que algo cambio y que debe dibujar la pantalla otra vez.

## Ejemplo mental

Si tienes un marcador de puntos, el numero debe cambiar cuando ganas puntos.

El numero guardado es el estado.

`setState` es como decir: "Flutter, actualiza la pantalla".

## Codigo importante

Ejemplo corto:

```dart
int contador = 0;

void sumarUno() {
  setState(() {
    contador = contador + 1;
  });
}
```

## Explicacion paso a paso

`contador` guarda el numero actual.

`sumarUno` es una funcion.

Dentro de `setState`, cambiamos el contador.

Cuando termina `setState`, Flutter vuelve a dibujar la pantalla.

Asi el numero nuevo aparece.

## Conectar con Swim Titans

Swim Titans usara estado para guardar:

- el tipo de nado seleccionado
- la distancia seleccionada
- el progreso del nadador
- si la practica termino
- si el jugador esta nadando

Ejemplo de Swim Titans:

```dart
double progresoActual = 0;

void avanzarNadador() {
  setState(() {
    progresoActual = progresoActual + 3;
  });
}
```

Cuando `progresoActual` cambia, el nadador puede moverse en la pantalla.

## Lo que haremos despues

Despues aprenderemos navegacion, que sirve para pasar de una pantalla a otra.

## Actividad

Crea o modifica un contador simple:

1. Crea una variable `contador`.
2. Crea un boton.
3. Cuando se toque el boton, suma 1 usando `setState`.
4. Mira que el numero cambia en pantalla.

Pregunta:

Que pasaria si cambias el numero sin usar `setState`?
