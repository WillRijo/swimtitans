# Navegacion

**Nivel:** Practicar

## Objetivo

Aprender a pasar de una pantalla a otra.

## Herramientas que vamos a usar

- `Navigator`
- `MaterialPageRoute`
- Dos pantallas de Flutter

## Idea principal

- Una app puede tener varias pantallas.
- Navegar significa pasar de una pantalla a otra.
- `Navigator.push` abre una pantalla nueva.
- `Navigator.pop` vuelve a la pantalla anterior.

## Ejemplo mental

En Swim Titans empiezas en la pantalla de inicio.

Cuando tocas `Iniciar practica`, vas a la pantalla del juego.

Cuando tocas volver, regresas al inicio.

## Codigo importante

Ejemplo corto para abrir una pantalla:

```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const PantallaJuego(),
  ),
);
```

`Navigator.of(context)` busca el navegador de la app.

`push` abre una pantalla nueva.

`MaterialPageRoute` prepara la nueva pantalla.

`PantallaJuego` es la pantalla que queremos abrir.

Ejemplo corto para volver:

```dart
Navigator.of(context).pop();
```

`pop` cierra la pantalla actual.

Al cerrar la pantalla actual, vuelves a la anterior.

## Conectar con Swim Titans

Swim Titans usara navegacion para:

- empezar en `PantallaInicio`
- abrir `PantallaJuego`
- enviar el tipo de nado seleccionado
- enviar la distancia seleccionada
- volver al inicio

Ejemplo de Swim Titans:

```dart
PantallaJuego(
  tipoNado: tipoNadoSeleccionado,
  distancia: distanciaSeleccionada,
)
```

`tipoNadoSeleccionado` dice que estilo se escogio.

`distanciaSeleccionada` dice cuantos metros se van a nadar.

Esos datos viajan desde inicio hasta juego.

## Lo que haremos despues

Despues empezaremos a construir Swim Titans paso a paso.

## Actividad

Crea dos pantallas simples:

- `PantallaInicio`
- `PantallaJuego`

En `PantallaInicio`, crea un boton que diga `Ir al juego`.

Cuando se toque, debe abrir `PantallaJuego`.

En `PantallaJuego`, crea un boton que diga `Volver`.

Cuando se toque, debe regresar a `PantallaInicio`.

Pregunta:

Que dato te gustaria enviar desde Inicio hasta Juego?

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Estado y setState](07_estado_setstate.md)  
[Siguiente seccion: Swim Titans paso a paso](../03_swim_titans_paso_a_paso/00_indice.md)  
