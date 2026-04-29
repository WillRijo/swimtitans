import 'package:flutter/material.dart';

import '../modelos/tipo_nado.dart';
import 'sprite_sheet_nadador.dart';

class ConfiguracionSpriteNadador {
  const ConfiguracionSpriteNadador({
    required this.rutaImagen,
    required this.cantidadDeFrames,
    required this.anchoDelSprite,
    required this.altoDelSprite,
    required this.duracionDeCadaFrame,
  });

  final String rutaImagen;
  final int cantidadDeFrames;
  final double anchoDelSprite;
  final double altoDelSprite;
  final Duration duracionDeCadaFrame;

  Duration get duracionDelCiclo {
    return Duration(
      milliseconds: duracionDeCadaFrame.inMilliseconds * cantidadDeFrames,
    );
  }
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
    rutaImagen: 'assets/images/swimmers/espera.png',
    cantidadDeFrames: 4,
    anchoDelSprite: 64,
    altoDelSprite: 50,
    duracionDeCadaFrame: Duration(milliseconds: 180),
  );

  static const configuracionLibre = ConfiguracionSpriteNadador(
    rutaImagen: 'assets/images/swimmers/libre.png',
    cantidadDeFrames: 8,
    anchoDelSprite: 100,
    altoDelSprite: 100,
    duracionDeCadaFrame: Duration(milliseconds: 100),
  );

  static const configuracionDorso = ConfiguracionSpriteNadador(
    rutaImagen: 'assets/images/swimmers/dorso.png',
    cantidadDeFrames: 8,
    anchoDelSprite: 100,
    altoDelSprite: 100,
    duracionDeCadaFrame: Duration(milliseconds: 100),
  );

  static const configuracionPecho = ConfiguracionSpriteNadador(
    rutaImagen: 'assets/images/swimmers/pecho.png',
    cantidadDeFrames: 8,
    anchoDelSprite: 100,
    altoDelSprite: 100,
    duracionDeCadaFrame: Duration(milliseconds: 100),
  );

  static const configuracionMariposa = ConfiguracionSpriteNadador(
    rutaImagen: 'assets/images/swimmers/mariposa.png',
    cantidadDeFrames: 8,
    anchoDelSprite: 100,
    altoDelSprite: 100,
    duracionDeCadaFrame: Duration(milliseconds: 100),
  );

  static ConfiguracionSpriteNadador configuracionPara({
    required TipoNado tipoNado,
    required bool enEspera,
  }) {
    if (enEspera) {
      return configuracionEspera;
    }

    switch (tipoNado) {
      case TipoNado.libre:
        return configuracionLibre;
      case TipoNado.dorso:
        return configuracionDorso;
      case TipoNado.pecho:
        return configuracionPecho;
      case TipoNado.mariposa:
        return configuracionMariposa;
    }
  }

  static double anchoVisual({
    required TipoNado tipoNado,
    required bool enEspera,
  }) {
    return configuracionPara(
      tipoNado: tipoNado,
      enEspera: enEspera,
    ).anchoDelSprite;
  }

  static double altoVisual({
    required TipoNado tipoNado,
    required bool enEspera,
  }) {
    return configuracionPara(
      tipoNado: tipoNado,
      enEspera: enEspera,
    ).altoDelSprite;
  }

  @override
  Widget build(BuildContext context) {
    final configuracion = configuracionPara(
      tipoNado: tipoNado,
      enEspera: enEspera,
    );

    return SpriteSheetNadador(
      key: ValueKey('${configuracion.rutaImagen}-$enEspera'),
      rutaImagen: configuracion.rutaImagen,
      cantidadDeFrames: configuracion.cantidadDeFrames,
      anchoDelFrame: configuracion.anchoDelSprite,
      altoDelFrame: configuracion.altoDelSprite,
      duracionDeCadaFrame: configuracion.duracionDeCadaFrame,
      invertirHorizontal: !vaHaciaLaDerecha,
    );
  }
}