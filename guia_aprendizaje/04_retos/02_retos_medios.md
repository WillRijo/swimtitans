# Retos medios

**Nivel:** Practicar

## Objetivo

Intentar mejoras que necesitan pensar un poco mas.

## Herramientas que vamos a usar

- Proyecto nuevo de Swim Titans
- Estado del juego
- Modelos
- Pantallas
- Reglas de nado
- Sprites

## Idea principal

Los retos medios mezclan varias partes del juego.

Conviene hacerlos uno por uno.

Antes de escribir codigo, es buena idea escribir la regla en palabras.

## Reto 1: Agregar distancia 25 m

Archivos:

- `lib/modelos/distancia_nado.dart`
- `lib/pantallas/pantalla_inicio.dart`

Idea:

Agregar una distancia mas corta para practicar.

Debe tener:

- etiqueta `25 m`
- metros `25`
- vueltas `1`
- `progresoNecesarioParaGanar` menor que 50 m o igual a una vuelta simple segun decidan

Pregunta:

Debe 25 m terminar a mitad de piscina o puede ser una practica corta de una vuelta simple?

## Reto 2: Agregar modo Competencia visual

Archivos:

- `lib/modelos/modo_juego.dart`
- `lib/widgets/selector_modo.dart`

Idea:

Hacer que Competencia se vea como opcion futura mas clara, pero sin activar gameplay completo.

Ejemplo:

- cambiar color
- mostrar texto corto como `Futuro`
- mantenerlo deshabilitado

## Reto 3: Agregar mensaje segun tipo de nado

Archivo:

- `lib/pantallas/pantalla_juego.dart`

Idea:

Cuando empieza el juego, mostrar una ayuda diferente segun el tipo de nado.

Ejemplos:

- Libre: `Alterna los lados`
- Pecho: `Desliza hacia arriba`
- Mariposa: `Usa los dos lados`

## Reto 4: Cambiar velocidades por dificultad

Archivos:

- `lib/modelos/tipo_nado.dart`
- `lib/pantallas/pantalla_inicio.dart`

Idea:

Agregar una opcion simple:

- Facil
- Normal
- Rapido

La dificultad podria cambiar cuanto avanza el nadador.

Nota:

Este reto puede hacerse primero solo en papel antes de programarlo.

## Reto 5: Agregar contador de acciones

Archivo:

- `lib/pantallas/pantalla_juego.dart`

Idea:

Contar cuantas veces el jugador hizo una accion valida.

Variable posible:

```dart
int cantidadDeAcciones = 0;
```

Cada vez que el nadador avance, sumar 1.

Mostrar en pantalla:

```text
Acciones: 12
```

## Reto 6: Agregar mejor mensaje final

Archivo:

- `lib/pantallas/pantalla_juego.dart`

Idea:

Al terminar, mostrar:

- distancia
- tipo de nado
- cantidad de acciones
- mensaje de felicitacion

## Reto 7: Cambiar sprite de espera

Archivos:

- `assets/images/swimmers/espera.png`
- `lib/widgets/sprite_nadador.dart`

Idea:

Crear o reemplazar el sprite de espera.

Revisar:

- cantidad de frames
- ancho
- alto
- duracion de cada frame

## Reto 8: Crear una piscina con otro color por nado

Archivo:

- `lib/widgets/vista_piscina.dart`

Idea:

Cambiar el color de la piscina segun el tipo de nado.

Ejemplo:

- Libre: azul
- Dorso: azul oscuro
- Pecho: verde claro
- Mariposa: morado suave

## Consejo para todos los retos

1. Escribe la idea en palabras.
2. Haz un cambio pequeno.
3. Ejecuta `flutter analyze`.
4. Ejecuta `flutter run`.
5. Prueba.
6. Si falla, revisa el ultimo cambio.

## Actividad

Elige un reto medio.

Antes de programarlo, escribe:

```text
Quiero cambiar:
Archivos que voy a mirar:
Que espero que pase:
```
