# Crear piscina simple

**Nivel:** Practicar

## Objetivo

Dibujar una piscina sencilla en la pantalla del juego.

## Herramientas que vamos a usar

- `pantalla_juego.dart`
- `Container`
- `Stack`
- `Positioned`
- `Column`
- Colores
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- Antes de crear una piscina avanzada, vamos a dibujar una version simple.
- Una piscina puede ser un rectangulo azul.
- Los carriles pueden ser lineas blancas.
- El nadador puede ser un circulo o icono temporal.
- Despues cambiaremos ese circulo por sprites.

## Paso 1: Crear _PiscinaSimple

Crea un widget temporal dentro de `pantalla_juego.dart` llamado `_PiscinaSimple`.

Usa este codigo:

```dart
class _PiscinaSimple extends StatelessWidget {
  const _PiscinaSimple({
    required this.porcentajeDeLaVuelta,
    required this.vaHaciaLaDerecha,
  });

  final double porcentajeDeLaVuelta;
  final bool vaHaciaLaDerecha;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: const Color(0xFF7DD3FC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 6),
      ),
      child: Stack(
        children: [
          const _CarrilesSimples(),
          _NadadorTemporal(
            porcentajeDeLaVuelta: porcentajeDeLaVuelta,
            vaHaciaLaDerecha: vaHaciaLaDerecha,
          ),
        ],
      ),
    );
  }
}
```

`Container` dibuja la piscina azul.

`Stack` permite poner cosas una encima de otra.

Primero dibujamos carriles.

Despues ponemos el nadador.

## Paso 2: Crear carriles simples

Agrega:

```dart
class _CarrilesSimples extends StatelessWidget {
  const _CarrilesSimples();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: SizedBox()),
        Divider(color: Colors.white, thickness: 3),
        Expanded(child: SizedBox()),
        Divider(color: Colors.white, thickness: 3),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
```

`Column` divide la piscina en partes verticales.

`Expanded` reparte el espacio.

`Divider` dibuja lineas blancas.

Asi la piscina parece tener tres carriles.

## Paso 3: Crear nadador temporal

Agrega:

```dart
class _NadadorTemporal extends StatelessWidget {
  const _NadadorTemporal({
    required this.porcentajeDeLaVuelta,
    required this.vaHaciaLaDerecha,
  });

  final double porcentajeDeLaVuelta;
  final bool vaHaciaLaDerecha;

  @override
  Widget build(BuildContext context) {
    final avance = porcentajeDeLaVuelta.clamp(0, 1).toDouble();

    return LayoutBuilder(
      builder: (context, constraints) {
        const tamanoNadador = 42.0;
        const margen = 24.0;

        final inicio = margen;
        final fin = constraints.maxWidth - margen - tamanoNadador;

        final posicionX = vaHaciaLaDerecha
            ? inicio + (fin - inicio) * avance
            : fin - (fin - inicio) * avance;

        final posicionY = constraints.maxHeight / 2 - tamanoNadador / 2;

        return Positioned(
          left: posicionX,
          top: posicionY,
          child: Container(
            width: tamanoNadador,
            height: tamanoNadador,
            decoration: const BoxDecoration(
              color: Color(0xFF075985),
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
```

`porcentajeDeLaVuelta` dice donde esta el nadador dentro de la piscina.

`0` significa inicio.

`1` significa final.

`vaHaciaLaDerecha` decide si va o regresa.

`Positioned` coloca el nadador dentro del `Stack`.

## Paso 4: Calcular la vuelta en PantallaJuego

En `build` de `PantallaJuego`, calcula:

```dart
final practicaCompleta = progresoActual >= progresoNecesarioParaGanar;

final vueltaActual = practicaCompleta
    ? totalVueltas - 1
    : (progresoActual ~/ progresoPorVuelta)
        .clamp(0, totalVueltas - 1)
        .toInt();

final progresoEnLaVuelta = practicaCompleta
    ? progresoPorVuelta
    : progresoActual % progresoPorVuelta;

final porcentajeDeLaVuelta = progresoEnLaVuelta / progresoPorVuelta;

final vaHaciaLaDerecha = vueltaActual.isEven;
```

Cada vuelta usa 100 puntos de progreso.

Si la vuelta es par, va hacia la derecha.

Si la vuelta es impar, regresa hacia la izquierda.

## Paso 5: Mostrar la piscina simple

Muestra la piscina en la pantalla:

```dart
_PiscinaSimple(
  porcentajeDeLaVuelta: porcentajeDeLaVuelta,
  vaHaciaLaDerecha: vaHaciaLaDerecha,
)
```

## Paso 6: Ejecutar y probar

1. Entra a la pantalla del juego.
2. Presiona el boton `Avanzar`.
3. Mira como el circulo se mueve por la piscina.
4. En 100 m debe ir y volver.

## Si algo sale mal

- Revisa que `_PiscinaSimple`, `_CarrilesSimples` y `_NadadorTemporal` esten en el mismo archivo por ahora.
- Revisa que `progresoPorVuelta` exista.
- Revisa que `porcentajeDeLaVuelta` no sea mayor que 1.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues haremos que el nadador avance con toques reales en la piscina, no solo con un boton.

## Actividad

1. Crea `_PiscinaSimple`.
2. Crea `_CarrilesSimples`.
3. Crea `_NadadorTemporal`.
4. Muestra la piscina en `PantallaJuego`.
5. Presiona `Avanzar` y mira el movimiento.

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Crear estado del juego](07_crear_estado_del_juego.md)  
[Siguiente leccion: Mover nadador](09_mover_nadador.md)  
