# Motor sprite sheet

**Nivel:** Copiar y usar

## Objetivo

Usar codigo preparado para convertir una imagen con varios frames en una animacion.

## Herramientas que vamos a usar

- `lib/widgets/sprite_sheet_nadador.dart`
- Sprite sheet
- Flutter
- Dart
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- Un sprite sheet es una imagen larga con varios dibujos.
- Cada dibujo se llama frame.
- El motor muestra un frame, luego otro, y luego otro.
- Cuando llega al ultimo frame, vuelve al primero.
- Esta parte usa ideas mas avanzadas como `Timer`, `ClipRect` y `Transform`.
- No tienes que entender todo hoy.
- Primero puedes copiarlo y usarlo.

## Paso 1: Crear archivo

Crea este archivo:

```text
lib/widgets/sprite_sheet_nadador.dart
```

## Paso 2: Copiar el motor completo

Copia este codigo completo:

```dart
import 'dart:async';

import 'package:flutter/material.dart';

class SpriteSheetNadador extends StatefulWidget {
  const SpriteSheetNadador({
    super.key,
    required this.rutaImagen,
    required this.cantidadDeFrames,
    required this.anchoDelFrame,
    required this.altoDelFrame,
    this.duracionDeCadaFrame = const Duration(milliseconds: 120),
    this.invertirHorizontal = false,
  });

  final String rutaImagen;
  final int cantidadDeFrames;
  final double anchoDelFrame;
  final double altoDelFrame;
  final Duration duracionDeCadaFrame;
  final bool invertirHorizontal;

  @override
  State<SpriteSheetNadador> createState() => _SpriteSheetNadadorState();
}

class _SpriteSheetNadadorState extends State<SpriteSheetNadador> {
  Timer? temporizadorAnimacion;
  int numeroDelFrameActual = 0;

  @override
  void initState() {
    super.initState();
    iniciarAnimacion();
  }

  @override
  void didUpdateWidget(covariant SpriteSheetNadador oldWidget) {
    super.didUpdateWidget(oldWidget);

    final cambioLaImagen = oldWidget.rutaImagen != widget.rutaImagen;
    final cambioLaCantidadDeFrames =
        oldWidget.cantidadDeFrames != widget.cantidadDeFrames;
    final cambioLaDuracion =
        oldWidget.duracionDeCadaFrame != widget.duracionDeCadaFrame;

    if (cambioLaImagen || cambioLaCantidadDeFrames || cambioLaDuracion) {
      setState(() {
        numeroDelFrameActual = 0;
      });
      iniciarAnimacion();
    }
  }

  @override
  void dispose() {
    temporizadorAnimacion?.cancel();
    super.dispose();
  }

  void iniciarAnimacion() {
    temporizadorAnimacion?.cancel();

    if (widget.cantidadDeFrames <= 1) {
      return;
    }

    temporizadorAnimacion = Timer.periodic(widget.duracionDeCadaFrame, (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        numeroDelFrameActual =
            (numeroDelFrameActual + 1) % widget.cantidadDeFrames;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final anchoTotalDelSpriteSheet =
        widget.anchoDelFrame * widget.cantidadDeFrames;

    return Transform.scale(
      scaleX: widget.invertirHorizontal ? -1 : 1,
      child: SizedBox(
        width: widget.anchoDelFrame,
        height: widget.altoDelFrame,
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.centerLeft,
            minWidth: anchoTotalDelSpriteSheet,
            maxWidth: anchoTotalDelSpriteSheet,
            minHeight: widget.altoDelFrame,
            maxHeight: widget.altoDelFrame,
            child: Transform.translate(
              offset: Offset(-widget.anchoDelFrame * numeroDelFrameActual, 0),
              child: Image.asset(
                widget.rutaImagen,
                width: anchoTotalDelSpriteSheet,
                height: widget.altoDelFrame,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return _DibujoTemporalDelSprite(
                    anchoDelFrame: widget.anchoDelFrame,
                    altoDelFrame: widget.altoDelFrame,
                    cantidadDeFrames: widget.cantidadDeFrames,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DibujoTemporalDelSprite extends StatelessWidget {
  const _DibujoTemporalDelSprite({
    required this.anchoDelFrame,
    required this.altoDelFrame,
    required this.cantidadDeFrames,
  });

  final double anchoDelFrame;
  final double altoDelFrame;
  final int cantidadDeFrames;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(cantidadDeFrames, (index) {
        return SizedBox(
          width: anchoDelFrame,
          height: altoDelFrame,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: Icon(Icons.pool, color: Color(0xFF0284C7)),
          ),
        );
      }),
    );
  }
}
```

Este codigo incluye:

- `Timer` para cambiar de frame.
- `ClipRect` para mostrar solo una parte de la imagen.
- `Transform.translate` para mover la tira de frames.
- Un dibujo temporal si la imagen falla.

## Paso 3: Entender los parametros importantes

- `rutaImagen`: donde esta la imagen.
- `cantidadDeFrames`: cuantos dibujos tiene la tira.
- `anchoDelFrame`: ancho de un dibujo.
- `altoDelFrame`: alto de un dibujo.
- `duracionDeCadaFrame`: cuanto tiempo se ve cada dibujo.
- `invertirHorizontal`: si el nadador debe mirar al otro lado.

## Paso 4: Usarlo con un ejemplo pequeno

Puedes probarlo asi:

```dart
SpriteSheetNadador(
  rutaImagen: 'assets/images/swimmers/libre.png',
  cantidadDeFrames: 8,
  anchoDelFrame: 100,
  altoDelFrame: 100,
  duracionDeCadaFrame: Duration(milliseconds: 100),
)
```

## Paso 5: Ajustar velocidad o tamano

Si la animacion va muy rapido, aumenta `duracionDeCadaFrame`.

Si va muy lenta, reduce `duracionDeCadaFrame`.

Si se ve cortada, revisa `anchoDelFrame` y `altoDelFrame`.

## Si algo sale mal

- Revisa que el archivo este en `lib/widgets`.
- Revisa que la ruta de la imagen exista.
- Revisa que el sprite tenga la cantidad correcta de frames.
- Ejecuta `flutter pub get` si agregaste assets.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues usaremos este motor dentro de `SpriteNadador`, que decide que imagen usar segun el tipo de nado.

## Actividad

1. Crea `sprite_sheet_nadador.dart`.
2. Copia el codigo preparado.
3. Usalo temporalmente con `libre.png`.
4. Cambia `duracionDeCadaFrame` para ver la animacion mas lenta.
5. Escribe una pregunta sobre una parte que quieras entender despues.
