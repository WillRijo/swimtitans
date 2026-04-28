# Swim Titans — Documentación Base de la Aplicación

## 1. Objetivo del proyecto

**Swim Titans** es una aplicación/juego simple creada en **Flutter** para enseñar programación a una niña de 12 años.

La prioridad del proyecto no es crear un juego complejo, sino construir una aplicación pequeña, clara y divertida que permita explicar conceptos básicos de programación paso a paso:

- Pantallas
- Botones
- Estados
- Navegación
- Condiciones
- Eventos táctiles
- Movimiento en pantalla
- Uso de imágenes/sprites
- Separación básica de archivos
- Lectura de código simple

El juego debe mantenerse lo más simple posible en su primera versión.

---

## 2. Concepto general del juego

El jugador controla a un nadador visto desde arriba, en una piscina con carriles.

El objetivo es completar una distancia seleccionada usando controles táctiles diferentes según el tipo de nado.

La primera versión tendrá solamente modo práctica activo. El modo competencia aparecerá en la interfaz, pero estará desactivado para uso futuro.

---

## 3. Plataforma y tecnología

### Tecnología principal

- Flutter
- Dart

### Tipo de aplicación

- App/juego simple 2D
- Vista top/down
- Orientación recomendada: horizontal o vertical simple, según sea más cómodo al inicio
- Primera versión: sin backend, sin login, sin base de datos

### Dependencias recomendadas para la primera versión

Para mantener el proyecto simple, la primera versión puede hacerse con Flutter puro, sin Flame.

Más adelante se puede migrar o comparar con Flame si se quiere enseñar conceptos de motor de juego.

---

## 4. Nombre del juego

Nombre sugerido:

**Swim Titans**

El título debe mostrarse en la pantalla inicial.

---

## 5. Flujo principal de la aplicación

### Pantalla 1: Inicio / Configuración del juego

La pantalla inicial debe contener:

1. Título del juego
2. Selector de modo
3. Botones de tipo de nado
4. Selector de distancia
5. Botón para iniciar la práctica

### Flujo del usuario

1. El usuario abre la aplicación.
2. Ve el título del juego.
3. Selecciona el modo.
   - Práctica está activo.
   - Competencia está inactivo.
4. Selecciona el tipo de nado.
5. Selecciona la distancia.
6. Presiona iniciar.
7. Entra a la pantalla de juego.
8. Usa controles táctiles para avanzar.
9. Cuando llega a la meta, se muestra un resultado simple.
10. Puede volver al inicio.

---

## 6. Modos de juego

### Práctica

Estado: activo en la primera versión.

Este modo permite jugar libremente sin oponentes.

### Competencia

Estado: inactivo en la primera versión.

Debe mostrarse como opción futura, pero no debe poder seleccionarse todavía.

Puede aparecer como botón deshabilitado con texto como:

> Competencia — Próximamente

---

## 7. Tipos de nado

La primera versión tendrá 4 tipos de nado:

1. Libre
2. Mariposa
3. Pecho
4. Dorso

Cada tipo de nado tiene una forma diferente de avanzar.

---

## 8. Distancias disponibles

El jugador podrá seleccionar una de estas distancias:

- 50 metros
- 100 metros
- 200 metros

La distancia seleccionada determina qué tan larga será la carrera.

Para simplificar, los metros pueden mapearse internamente a una cantidad de progreso.

Ejemplo:

- 50 metros = 100 puntos de progreso
- 100 metros = 200 puntos de progreso
- 200 metros = 400 puntos de progreso

No es necesario que la escala sea físicamente realista en la primera versión.

---

## 9. Vista del juego

### Cámara

La vista será desde arriba, tipo **top/down**.

El jugador verá:

- Piscina
- Carril
- Nadador
- Línea de salida
- Línea de meta
- Indicador de progreso

### Movimiento visual

Para mantenerlo simple, hay dos opciones válidas:

#### Opción A — El nadador se mueve hacia adelante

El nadador avanza desde la salida hasta la meta.

#### Opción B — El nadador queda centrado y el agua se mueve

El nadador permanece casi fijo y la pista se desplaza.

Para la primera versión se recomienda la **Opción A**, porque es más fácil de explicar y programar.

---

## 10. Mecánica principal de gameplay

Cada interacción correcta hace que el nadador avance.

El avance se representa con una variable simple llamada `progress`.

Cuando `progress` llega al valor necesario para la distancia seleccionada, la práctica termina.

### Variables principales del juego

- `selectedStroke`
- `selectedDistance`
- `progress`
- `targetProgress`
- `isFinished`

---

## 11. Controles por tipo de nado

### Libre

El jugador avanza presionando alternadamente el lado izquierdo y el lado derecho de la pantalla.

Regla simple inicial:

- Tap izquierdo: avanza
- Tap derecho: avanza

Regla un poco mejor para enseñar lógica:

- Si toca izquierda y luego derecha, avanza mejor.
- Si repite el mismo lado muchas veces, puede avanzar menos.

Para la primera versión, usar la regla simple.

### Dorso

Dorso funciona similar a libre.

- Tap izquierdo: avanza
- Tap derecho: avanza

La diferencia inicial puede ser visual solamente, usando otro sprite.

### Mariposa

El jugador avanza tocando ambos lados de la pantalla juntos.

Regla simple:

- Si presiona izquierda y derecha casi al mismo tiempo, avanza.

Para simplificar la primera versión:

- La pantalla puede tener dos zonas táctiles.
- Si ambas zonas están presionadas, se llama a `moveForward()`.

### Pecho

El jugador avanza haciendo swipe hacia arriba.

Regla simple:

- Detectar gesto vertical hacia arriba.
- Si el swipe es válido, avanzar.

---

## 12. Pantalla de juego

La pantalla de juego debe contener:

1. Barra superior simple
   - Tipo de nado
   - Distancia
   - Progreso
2. Área de piscina
3. Nadador
4. Zonas táctiles invisibles o semi-transparentes
5. Botón para volver al inicio

### Resultado al terminar

Cuando el jugador llega a la meta:

Mostrar un mensaje simple:

> ¡Llegaste a la meta!

Opciones:

- Volver al inicio
- Repetir práctica

---

## 13. Sprites e imágenes

Los sprites serán generados como imágenes e incluidos en el proyecto.

### Sprites iniciales necesarios

Se recomienda empezar con pocos assets:

- `swimmer_freestyle.png`
- `swimmer_butterfly.png`
- `swimmer_breaststroke.png`
- `swimmer_backstroke.png`
- `pool_lane.png` opcional

### Estilo visual sugerido

- Infantil
- Colorido
- Simple
- Vista desde arriba
- Fondo transparente para los nadadores
- Sin demasiado detalle

### Carpeta sugerida

```text
assets/
  images/
    swimmers/
      swimmer_freestyle.png
      swimmer_butterfly.png
      swimmer_breaststroke.png
      swimmer_backstroke.png
    environment/
      pool_lane.png
```

---

## 14. Estructura simple del proyecto

La estructura debe ser clara y fácil de explicar.

```text
lib/
  main.dart
  app.dart
  models/
    swim_stroke.dart
    swim_distance.dart
    game_mode.dart
  screens/
    home_screen.dart
    game_screen.dart
  widgets/
    stroke_button.dart
    distance_button.dart
    mode_selector.dart
    pool_view.dart
    swimmer_sprite.dart
```

No se recomienda una arquitectura avanzada en esta primera versión.

---

## 15. Modelos simples

### GameMode

Representa los modos del juego.

```dart
enum GameMode {
  practice,
  competition,
}
```

### SwimStroke

Representa los tipos de nado.

```dart
enum SwimStroke {
  freestyle,
  butterfly,
  breaststroke,
  backstroke,
}
```

### SwimDistance

Representa las distancias.

```dart
enum SwimDistance {
  fifty,
  oneHundred,
  twoHundred,
}
```

---

## 16. Estado mínimo de la pantalla inicial

La pantalla inicial necesita guardar:

```dart
GameMode selectedMode = GameMode.practice;
SwimStroke selectedStroke = SwimStroke.freestyle;
SwimDistance selectedDistance = SwimDistance.fifty;
```

El modo competencia debe mostrarse deshabilitado.

---

## 17. Estado mínimo de la pantalla de juego

La pantalla de juego necesita guardar:

```dart
double progress = 0;
double targetProgress = 100;
bool isFinished = false;
```

La función principal del juego puede ser:

```dart
void moveForward() {
  if (isFinished) return;

  setState(() {
    progress += 5;

    if (progress >= targetProgress) {
      progress = targetProgress;
      isFinished = true;
    }
  });
}
```

---

## 18. Mapeo de distancia a progreso

Ejemplo simple:

```dart
double targetProgressForDistance(SwimDistance distance) {
  switch (distance) {
    case SwimDistance.fifty:
      return 100;
    case SwimDistance.oneHundred:
      return 200;
    case SwimDistance.twoHundred:
      return 400;
  }
}
```

---

## 19. Mapeo de tipo de nado a imagen

Ejemplo:

```dart
String spriteForStroke(SwimStroke stroke) {
  switch (stroke) {
    case SwimStroke.freestyle:
      return 'assets/images/swimmers/swimmer_freestyle.png';
    case SwimStroke.butterfly:
      return 'assets/images/swimmers/swimmer_butterfly.png';
    case SwimStroke.breaststroke:
      return 'assets/images/swimmers/swimmer_breaststroke.png';
    case SwimStroke.backstroke:
      return 'assets/images/swimmers/swimmer_backstroke.png';
  }
}
```

---

## 20. Interacciones táctiles por nado

### Libre y dorso

La pantalla puede dividirse en dos zonas:

- Izquierda
- Derecha

Cada tap llama a:

```dart
moveForward();
```

### Mariposa

Guardar si cada lado está presionado:

```dart
bool isLeftPressed = false;
bool isRightPressed = false;
```

Cuando ambos estén presionados:

```dart
if (isLeftPressed && isRightPressed) {
  moveForward();
}
```

### Pecho

Usar un detector de swipe:

```dart
onVerticalDragEnd: (_) {
  moveForward();
}
```

Más adelante se puede validar si el swipe fue realmente hacia arriba.

---

## 21. Enseñanza por partes

El proyecto debe dividirse en lecciones simples.

### Lección 1 — Crear el proyecto Flutter

Objetivo:

- Crear la app
- Ejecutarla
- Mostrar texto en pantalla

Conceptos:

- `main()`
- `runApp()`
- `MaterialApp`
- `Scaffold`

### Lección 2 — Crear la pantalla inicial

Objetivo:

- Mostrar el título
- Crear botones
- Usar columnas y filas

Conceptos:

- `Column`
- `Row`
- `Text`
- `ElevatedButton`

### Lección 3 — Guardar selección del jugador

Objetivo:

- Seleccionar tipo de nado
- Seleccionar distancia

Conceptos:

- Variables
- `setState`
- Estados
- `enum`

### Lección 4 — Navegar a la pantalla de juego

Objetivo:

- Pasar de home a game
- Enviar datos seleccionados

Conceptos:

- `Navigator.push`
- Constructores
- Parámetros

### Lección 5 — Dibujar la piscina y el nadador

Objetivo:

- Crear el área de juego
- Mostrar el sprite del nadador

Conceptos:

- `Stack`
- `Positioned`
- `Container`
- `Image.asset`

### Lección 6 — Hacer que el nadador avance

Objetivo:

- Tocar pantalla y mover al nadador

Conceptos:

- Eventos
- `GestureDetector`
- Funciones
- Sumar valores

### Lección 7 — Agregar reglas por tipo de nado

Objetivo:

- Cambiar el control dependiendo del nado

Conceptos:

- `switch`
- `if`
- lógica condicional

### Lección 8 — Terminar la práctica

Objetivo:

- Detectar meta
- Mostrar mensaje final

Conceptos:

- Comparaciones
- Booleanos
- Diálogos o mensajes

### Lección 9 — Agregar imágenes propias

Objetivo:

- Incluir sprites generados
- Declararlos en `pubspec.yaml`

Conceptos:

- Assets
- Carpetas
- Rutas de archivos

---

## 22. Reglas para mantener el proyecto simple

1. No usar backend.
2. No usar login.
3. No usar base de datos.
4. No usar arquitectura compleja.
5. No usar paquetes innecesarios.
6. No agregar pantalla de configuración avanzada.
7. No agregar oponentes todavía.
8. No agregar sonidos en la primera versión.
9. No agregar sistema de puntuación complejo.
10. Mantener nombres claros y fáciles de leer.

---

## 23. Posibles mejoras futuras

Estas mejoras no pertenecen a la primera versión, pero pueden agregarse después:

- Modo competencia
- Rival controlado por computadora
- Cronómetro
- Mejor animación de sprites
- Sonidos
- Medallas
- Puntuación
- Personalización del nadador
- Selección de piscina
- Guardar mejores tiempos
- Nivel fácil / medio / difícil
- Tutorial interactivo
- Migración a Flame

---

## 24. Criterio de éxito de la primera versión

La primera versión está completa cuando:

1. La app abre correctamente.
2. Muestra el título Swim Titans.
3. Permite seleccionar práctica.
4. Muestra competencia como inactivo.
5. Permite elegir libre, mariposa, pecho o dorso.
6. Permite elegir 50, 100 o 200 metros.
7. Inicia la pantalla de juego.
8. Muestra una piscina simple desde arriba.
9. Muestra el nadador correcto según el tipo de nado.
10. El jugador puede avanzar usando el control correspondiente.
11. El juego detecta cuando llega a la meta.
12. Muestra un mensaje final.
13. Permite volver al inicio.

---

## 25. Prompt base para Codex

Usa este prompt para pedirle a Codex que implemente la primera versión:

```text
Implementa una aplicación Flutter simple llamada Swim Titans.

Objetivo:
Crear un juego educativo muy simple para enseñar programación a una niña de 12 años. Mantén el código claro, pequeño y fácil de explicar. No uses backend, login, base de datos ni arquitectura compleja.

Requisitos:
1. Crear una pantalla inicial con:
   - Título: Swim Titans
   - Selector de modo con Práctica activo
   - Competencia visible pero deshabilitado como futura opción
   - 4 botones de tipo de nado: Libre, Mariposa, Pecho, Dorso
   - 3 botones de distancia: 50m, 100m, 200m
   - Botón para iniciar práctica

2. Crear una pantalla de juego top/down con:
   - Piscina simple dibujada con widgets Flutter
   - Nadador mostrado como sprite usando Image.asset si existe el asset
   - Si el asset no existe todavía, usar un placeholder visual simple
   - Indicador de progreso
   - Botón para volver al inicio

3. Gameplay:
   - Libre: avanzar tocando lado izquierdo o derecho de la pantalla
   - Dorso: igual que libre
   - Mariposa: avanzar cuando ambos lados estén presionados al mismo tiempo
   - Pecho: avanzar con swipe hacia arriba
   - Cuando progress >= targetProgress, mostrar mensaje de meta

4. Estructura sugerida:
   lib/main.dart
   lib/app.dart
   lib/models/game_mode.dart
   lib/models/swim_stroke.dart
   lib/models/swim_distance.dart
   lib/screens/home_screen.dart
   lib/screens/game_screen.dart
   lib/widgets/mode_selector.dart
   lib/widgets/stroke_button.dart
   lib/widgets/distance_button.dart
   lib/widgets/pool_view.dart
   lib/widgets/swimmer_sprite.dart

5. Mantener nombres simples y código fácil de leer.
6. Agregar comentarios cortos donde ayuden a explicar el código a una principiante.
7. No agregar paquetes externos por ahora.
8. Asegurar que la app compile.

Después de implementar, devuelve:
- Árbol de archivos actualizado
- Lista de archivos cambiados
- Explicación corta de cómo funciona
- Sugerencia de cómo enseñar este código por partes
```

---

## 26. Nota educativa

Este proyecto debe tratarse como una herramienta de aprendizaje.

El código no debe optimizarse demasiado al principio. Es mejor que sea fácil de leer, aunque no sea perfecto.

La meta es que una niña pueda mirar el código y entender preguntas como:

- ¿Qué pasa cuando presiono este botón?
- ¿Dónde se guarda la distancia?
- ¿Cómo sabe el juego qué tipo de nado elegí?
- ¿Qué hace que el nadador avance?
- ¿Cómo sabe el juego que llegué a la meta?

Si esas preguntas se pueden responder mirando el código, la primera versión está bien diseñada.

