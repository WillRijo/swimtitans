import 'dart:async';

import 'package:flutter/material.dart';

class SpriteSheetNadador extends StatefulWidget {
  const SpriteSheetNadador({
    super.key,
    required this.ruta,
    required this.cantidadFrames,
    required this.ancho,
    required this.alto,
    this.duracionFrame = const Duration(milliseconds: 120),
    this.invertirHorizontal = false,
  });

  final String ruta;
  final int cantidadFrames;
  final double ancho;
  final double alto;
  final Duration duracionFrame;
  final bool invertirHorizontal;

  @override
  State<SpriteSheetNadador> createState() => _SpriteSheetNadadorState();
}

class _SpriteSheetNadadorState extends State<SpriteSheetNadador> {
  Timer? temporizador;
  int frameActual = 0;

  @override
  void initState() {
    super.initState();
    iniciarAnimacion();
  }

  @override
  void didUpdateWidget(covariant SpriteSheetNadador oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ruta != widget.ruta ||
        oldWidget.cantidadFrames != widget.cantidadFrames ||
        oldWidget.duracionFrame != widget.duracionFrame) {
      frameActual = 0;
      iniciarAnimacion();
    }
  }

  @override
  void dispose() {
    temporizador?.cancel();
    super.dispose();
  }

  void iniciarAnimacion() {
    temporizador?.cancel();

    if (widget.cantidadFrames <= 1) {
      return;
    }

    temporizador = Timer.periodic(widget.duracionFrame, (_) {
      if (!mounted) {
        return;
      }

      setState(() {
        frameActual = (frameActual + 1) % widget.cantidadFrames;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final anchoTotal = widget.ancho * widget.cantidadFrames;

    return Transform.scale(
      scaleX: widget.invertirHorizontal ? -1 : 1,
      child: SizedBox(
        width: widget.ancho,
        height: widget.alto,
        child: ClipRect(
          child: OverflowBox(
            alignment: Alignment.centerLeft,
            minWidth: anchoTotal,
            maxWidth: anchoTotal,
            minHeight: widget.alto,
            maxHeight: widget.alto,
            child: Transform.translate(
              offset: Offset(-widget.ancho * frameActual, 0),
              child: Image.asset(
                widget.ruta,
                width: anchoTotal,
                height: widget.alto,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return _SpriteSheetPlaceholder(
                    anchoFrame: widget.ancho,
                    alto: widget.alto,
                    cantidadFrames: widget.cantidadFrames,
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

class _SpriteSheetPlaceholder extends StatelessWidget {
  const _SpriteSheetPlaceholder({
    required this.anchoFrame,
    required this.alto,
    required this.cantidadFrames,
  });

  final double anchoFrame;
  final double alto;
  final int cantidadFrames;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(cantidadFrames, (index) {
        return SizedBox(
          width: anchoFrame,
          height: alto,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.white),
            child: Icon(Icons.pool, color: Color(0xFF0284C7)),
          ),
        );
      }),
    );
  }
}
