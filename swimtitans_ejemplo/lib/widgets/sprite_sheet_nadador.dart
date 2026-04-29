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
                  return _SpriteSheetPlaceholder(
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

class _SpriteSheetPlaceholder extends StatelessWidget {
  const _SpriteSheetPlaceholder({
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