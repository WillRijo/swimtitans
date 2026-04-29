import 'package:flutter/material.dart';

import '../models/tipo_nado.dart';
import 'sprite_sheet_nadador.dart';

class ConfiguracionSpriteNadador {
  const ConfiguracionSpriteNadador({
    required this.ruta,
    required this.cantidadFrames,
    required this.ancho,
    required this.alto,
    required this.duracionFrame,
  });

  final String ruta;
  final int cantidadFrames;
  final double ancho;
  final double alto;
  final Duration duracionFrame;
}

class SpriteNadador extends StatelessWidget {
  const SpriteNadador({
    super.key,
    required this.tipoNado,
    this.vaHaciaLaDerecha = true,
    this.enEspera = false,
  });

  final TipoNado tipoNado;
  final bool vaHaciaLaDerecha;
  final bool enEspera;

  static const configuracionEspera = ConfiguracionSpriteNadador(
    ruta: 'assets/images/swimmers/espera.png',
    cantidadFrames: 4,
    ancho: 64,
    alto: 50,
    duracionFrame: Duration(milliseconds: 180),
  );

  static const configuracionLibre = ConfiguracionSpriteNadador(
    ruta: 'assets/images/swimmers/libre.png',
    cantidadFrames: 8,
    ancho: 132,
    alto: 80,
    duracionFrame: Duration(milliseconds: 100),
  );

  static ConfiguracionSpriteNadador? configuracionPara({
    required TipoNado tipoNado,
    required bool enEspera,
  }) {
    if (enEspera) {
      return configuracionEspera;
    }

    if (tipoNado == TipoNado.libre) {
      return configuracionLibre;
    }

    return null;
  }

  static double anchoVisual({
    required TipoNado tipoNado,
    required bool enEspera,
  }) {
    return configuracionPara(tipoNado: tipoNado, enEspera: enEspera)?.ancho ??
        76;
  }

  static double altoVisual({
    required TipoNado tipoNado,
    required bool enEspera,
  }) {
    return configuracionPara(tipoNado: tipoNado, enEspera: enEspera)?.alto ??
        76;
  }

  @override
  Widget build(BuildContext context) {
    final configuracion = configuracionPara(
      tipoNado: tipoNado,
      enEspera: enEspera,
    );

    if (configuracion != null) {
      return SpriteSheetNadador(
        ruta: configuracion.ruta,
        cantidadFrames: configuracion.cantidadFrames,
        ancho: configuracion.ancho,
        alto: configuracion.alto,
        duracionFrame: configuracion.duracionFrame,
        invertirHorizontal: !vaHaciaLaDerecha,
      );
    }

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
