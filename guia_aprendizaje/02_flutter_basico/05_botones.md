# Botones

**Nivel:** Practicar

## Objetivo

Aprender a poner botones y hacer que respondan al tocarlos.

## Herramientas que vamos a usar

- `lib/main.dart`
- `ElevatedButton`
- `FilledButton`
- `onPressed`

## Idea principal

- Un boton sirve para que la persona toque la pantalla y pase algo.
- En Flutter, muchos botones usan `onPressed`.
- `onPressed` dice que debe ocurrir cuando se toca el boton.

## Codigo importante

Ejemplo corto:

```dart
ElevatedButton(
  onPressed: () {
    print('Boton tocado');
  },
  child: Text('Empezar'),
)
```

## Explicacion paso a paso

`ElevatedButton` crea un boton.

`child` es lo que se ve dentro del boton.

`Text('Empezar')` muestra la palabra Empezar.

`onPressed` guarda la accion del boton.

`print` muestra un mensaje en la terminal.

## Conectar con Swim Titans

Swim Titans usara botones para:

- elegir Libre
- elegir Dorso
- elegir Pecho
- elegir Mariposa
- elegir distancia
- iniciar practica
- repetir practica

## Lo que haremos despues

Despues aprenderemos variables.

## Actividad

Crea un boton que diga `Empezar`.

Cuando se toque, debe mostrar este mensaje en la terminal:

```dart
print('Vamos a nadar');
```

Pregunta:

Que otra palabra pondrias dentro del boton?

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Text, Column y Row](04_text_column_row.md)  
[Siguiente leccion: Variables](06_variables.md)  
