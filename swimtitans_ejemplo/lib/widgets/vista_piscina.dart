import 'package:flutter/material.dart';

import '../models/tipo_nado.dart';
import 'sprite_nadador.dart';

class VistaPiscina extends StatelessWidget {
  const VistaPiscina({
    super.key,
    required this.tipoNado,
    required this.porcentajeProgreso,
    required this.alTocarLado,
    required this.alDeslizarArriba,
    required this.alCambiarLadoMariposa,
    required this.ladoIzquierdoPresionado,
    required this.ladoDerechoPresionado,
  });

  final TipoNado tipoNado;
  final double porcentajeProgreso;
  final VoidCallback alTocarLado;
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
        final posicionSuperiorNadador =
            (altoPiscina - 74) * porcentajeProgreso.clamp(0, 1);

        return GestureDetector(
          onVerticalDragEnd: alDeslizarArriba,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF7DD3FC),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white, width: 6),
            ),
            child: Stack(
              children: [
                ..._crearLineasCarril(anchoPiscina),
                _crearLineaMeta(),
                _crearZonasControl(),
                Positioned(
                  top: posicionSuperiorNadador,
                  left: anchoPiscina / 2 - 38,
                  child: SpriteNadador(tipoNado: tipoNado),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _crearLineasCarril(double anchoPiscina) {
    return [
      Positioned(
        left: anchoPiscina / 3,
        top: 0,
        bottom: 0,
        child: _LineaCarril(),
      ),
      Positioned(
        left: anchoPiscina * 2 / 3,
        top: 0,
        bottom: 0,
        child: _LineaCarril(),
      ),
    ];
  }

  Widget _crearLineaMeta() {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 18,
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
            onTapDown: alTocarLado,
          ),
        ),
        Expanded(
          child: _ZonaControl(
            etiqueta: tipoNado == TipoNado.pecho ? 'Swipe arriba' : 'Toca',
            onTapDown: alTocarLado,
          ),
        ),
      ],
    );
  }
}

class _LineaCarril extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 3, color: Colors.white.withValues(alpha: 0.5));
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
