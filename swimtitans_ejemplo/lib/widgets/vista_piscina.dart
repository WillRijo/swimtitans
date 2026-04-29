import 'package:flutter/material.dart';

import '../models/tipo_nado.dart';
import 'sprite_nadador.dart';

class VistaPiscina extends StatelessWidget {
  const VistaPiscina({
    super.key,
    required this.tipoNado,
    required this.porcentajeLargo,
    required this.vaHaciaLaDerecha,
    required this.enEspera,
    required this.largoActual,
    required this.totalLargos,
    required this.alTocarLado,
    required this.alDeslizarArriba,
    required this.alCambiarLadoMariposa,
    required this.ladoIzquierdoPresionado,
    required this.ladoDerechoPresionado,
  });

  final TipoNado tipoNado;
  final double porcentajeLargo;
  final bool vaHaciaLaDerecha;
  final bool enEspera;
  final int largoActual;
  final int totalLargos;
  final void Function({required bool esIzquierda}) alTocarLado;
  final GestureDragEndCallback alDeslizarArriba;
  final void Function({required bool esIzquierda, required bool estaPresionado})
  alCambiarLadoMariposa;
  final bool ladoIzquierdoPresionado;
  final bool ladoDerechoPresionado;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final anchoPiscina = constraints.maxWidth;
        final altoPiscina = constraints.maxHeight;
        final largoVisible = (largoActual + 1).clamp(1, totalLargos).toInt();
        const margenHorizontal = 24.0;
        final anchoNadador = _anchoNadador;
        final altoNadador = _altoNadador;
        final altoCarril = altoPiscina / 3;
        final inicioX = margenHorizontal;
        final finX = (anchoPiscina - margenHorizontal - anchoNadador)
            .clamp(inicioX, double.infinity)
            .toDouble();
        final avanceLargo = porcentajeLargo.clamp(0, 1).toDouble();
        final posicionIzquierdaNadador = vaHaciaLaDerecha
            ? inicioX + (finX - inicioX) * avanceLargo
            : finX - (finX - inicioX) * avanceLargo;
        final limiteSuperiorY = altoPiscina > altoNadador + 16
            ? altoPiscina - altoNadador - 8
            : 8.0;
        final posicionSuperiorNadador =
            (altoCarril + (altoCarril - altoNadador) / 2)
                .clamp(8.0, limiteSuperiorY)
                .toDouble();

        return GestureDetector(
          onVerticalDragEnd: alDeslizarArriba,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF7DD3FC),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white, width: 6),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                children: [
                  _crearMarcasAgua(),
                  _crearCarriles(),
                  _crearLineaSalida(),
                  _crearLineaVuelta(),
                  _crearEtiquetaLargo(largoVisible),
                  _crearEtiquetasMetros(),
                  _crearZonasControl(),
                  Positioned(
                    top: posicionSuperiorNadador,
                    left: posicionIzquierdaNadador,
                    child: SpriteNadador(
                      tipoNado: tipoNado,
                      vaHaciaLaDerecha: vaHaciaLaDerecha,
                      enEspera: enEspera,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double get _anchoNadador {
    return SpriteNadador.anchoVisual(tipoNado: tipoNado, enEspera: enEspera);
  }

  double get _altoNadador {
    return SpriteNadador.altoVisual(tipoNado: tipoNado, enEspera: enEspera);
  }

  Widget _crearMarcasAgua() {
    return Positioned.fill(child: CustomPaint(painter: _PintorMarcasAgua()));
  }

  Widget _crearCarriles() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Column(
        children: const [
          Expanded(child: _CarrilPiscina()),
          _SeparadorCarril(),
          Expanded(child: _CarrilPiscina(esCentral: true)),
          _SeparadorCarril(),
          Expanded(child: _CarrilPiscina()),
        ],
      ),
    );
  }

  Widget _crearLineaSalida() {
    return Positioned(
      left: 18,
      top: 24,
      bottom: 24,
      child: _LineaVertical(color: Colors.white),
    );
  }

  Widget _crearLineaVuelta() {
    return Positioned(
      right: 18,
      top: 24,
      bottom: 24,
      child: _LineaVertical(color: const Color(0xFF075985)),
    );
  }

  Widget _crearEtiquetasMetros() {
    return const Positioned(
      left: 24,
      right: 24,
      bottom: 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_EtiquetaMetro('0 m'), _EtiquetaMetro('50 m')],
      ),
    );
  }

  Widget _crearEtiquetaLargo(int largoVisible) {
    return Positioned(
      top: 14,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.26),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Largo $largoVisible / $totalLargos',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.95),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearZonasControl() {
    if (tipoNado == TipoNado.mariposa) {
      return Row(
        children: [
          Expanded(
            child: _ZonaControl(
              etiqueta: 'Izquierda',
              estaPresionada: ladoIzquierdoPresionado,
              onTapDown: () => alCambiarLadoMariposa(
                esIzquierda: true,
                estaPresionado: true,
              ),
              onTapUp: () => alCambiarLadoMariposa(
                esIzquierda: true,
                estaPresionado: false,
              ),
            ),
          ),
          Expanded(
            child: _ZonaControl(
              etiqueta: 'Derecha',
              estaPresionada: ladoDerechoPresionado,
              onTapDown: () => alCambiarLadoMariposa(
                esIzquierda: false,
                estaPresionado: true,
              ),
              onTapUp: () => alCambiarLadoMariposa(
                esIzquierda: false,
                estaPresionado: false,
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _ZonaControl(
            etiqueta: tipoNado == TipoNado.pecho ? 'Swipe arriba' : 'Toca',
            onTapDown: () => alTocarLado(esIzquierda: true),
          ),
        ),
        Expanded(
          child: _ZonaControl(
            etiqueta: tipoNado == TipoNado.pecho ? 'Swipe arriba' : 'Toca',
            onTapDown: () => alTocarLado(esIzquierda: false),
          ),
        ),
      ],
    );
  }
}

class _LineaVertical extends StatelessWidget {
  const _LineaVertical({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class _CarrilPiscina extends StatelessWidget {
  const _CarrilPiscina({this.esCentral = false});

  final bool esCentral;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: esCentral ? Colors.white.withValues(alpha: 0.08) : null,
      child: Center(
        child: Container(
          height: 2,
          margin: const EdgeInsets.symmetric(horizontal: 34),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: esCentral ? 0.32 : 0.18),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class _SeparadorCarril extends StatelessWidget {
  const _SeparadorCarril();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.62),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class _EtiquetaMetro extends StatelessWidget {
  const _EtiquetaMetro(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.9),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _PintorMarcasAgua extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pintura = Paint()
      ..color = Colors.white.withValues(alpha: 0.22)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (double y = 34; y < size.height; y += 44) {
      final ruta = Path()..moveTo(20, y);
      for (double x = 20; x < size.width; x += 36) {
        ruta.quadraticBezierTo(x + 9, y - 8, x + 18, y);
        ruta.quadraticBezierTo(x + 27, y + 8, x + 36, y);
      }
      canvas.drawPath(ruta, pintura);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _ZonaControl extends StatelessWidget {
  const _ZonaControl({
    required this.etiqueta,
    this.estaPresionada = false,
    this.onTapDown,
    this.onTapUp,
  });

  final String etiqueta;
  final bool estaPresionada;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) => onTapDown?.call(),
      onTapUp: (_) => onTapUp?.call(),
      onTapCancel: () => onTapUp?.call(),
      child: Container(
        alignment: Alignment.bottomCenter,
        color: estaPresionada ? Colors.white.withValues(alpha: 0.2) : null,
        padding: const EdgeInsets.only(bottom: 36),
        child: Text(
          etiqueta,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
