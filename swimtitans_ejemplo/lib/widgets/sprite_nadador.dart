import 'package:flutter/material.dart';

import '../models/tipo_nado.dart';

class SpriteNadador extends StatelessWidget {
  const SpriteNadador({
    super.key,
    required this.tipoNado,
    this.vaHaciaLaDerecha = true,
  });

  final TipoNado tipoNado;
  final bool vaHaciaLaDerecha;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      height: 76,
      child: Image.asset(
        tipoNado.rutaImagen,
        fit: BoxFit.contain,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return Transform.scale(
            scaleX: vaHaciaLaDerecha ? 1 : -1,
            child: child,
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _MarcadorNadador(tipoNado: tipoNado);
        },
      ),
    );
  }
}

class _MarcadorNadador extends StatelessWidget {
  const _MarcadorNadador({required this.tipoNado});

  final TipoNado tipoNado;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF0284C7), width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.pool, color: Color(0xFF0284C7), size: 28),
          Text(
            tipoNado.etiqueta,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF075985),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
