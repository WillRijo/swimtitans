import 'dart:async';

import 'package:flutter/material.dart';

import '../modelos/distancia_nado.dart';
import '../modelos/tipo_nado.dart';
import '../widgets/sprite_nadador.dart';
import '../widgets/vista_piscina.dart';

enum LadoToque { izquierdo, derecho }

class PantallaJuego extends StatefulWidget {
  const PantallaJuego({
    super.key,
    required this.tipoNado,
    required this.distancia,
  });

  final TipoNado tipoNado;
  final DistanciaNado distancia;

  @override
  State<PantallaJuego> createState() => _PantallaJuegoState();
}

class _PantallaJuegoState extends State<PantallaJuego> {
  double progreso = 0;
  bool estaTerminado = false;
  bool ladoIzquierdoPresionado = false;
  bool ladoDerechoPresionado = false;
  bool hayAccionReciente = false;
  Timer? temporizadorEspera;
  LadoToque? ultimoLadoToque;

  double get progresoMeta => widget.distancia.progresoMeta;
  int get totalLargos => widget.distancia.largos;

  Duration get duracionAccionSprite {
    switch (widget.tipoNado) {
      case TipoNado.libre:
        return SpriteNadador.configuracionLibre.duracionCiclo +
            const Duration(milliseconds: 100);
      case TipoNado.dorso:
        return SpriteNadador.configuracionDorso.duracionCiclo +
            const Duration(milliseconds: 100);
      case TipoNado.pecho:
        return SpriteNadador.configuracionPecho.duracionCiclo +
            const Duration(milliseconds: 100);
      case TipoNado.mariposa:
        return SpriteNadador.configuracionMariposa.duracionCiclo +
            const Duration(milliseconds: 100);
    }
  }

  @override
  void dispose() {
    temporizadorEspera?.cancel();
    super.dispose();
  }

  void registrarAccion() {
    if (estaTerminado) {
      return;
    }

    if (!hayAccionReciente) {
      setState(() {
        hayAccionReciente = true;
      });
    }

    temporizadorEspera?.cancel();
    temporizadorEspera = Timer(duracionAccionSprite, () {
      if (!mounted) {
        return;
      }

      setState(() {
        hayAccionReciente = false;
      });
    });
  }

  void avanzar() {
    if (estaTerminado) {
      return;
    }

    setState(() {
      progreso += widget.tipoNado.avancePorAccion;
      if (progreso >= progresoMeta) {
        progreso = progresoMeta;
        estaTerminado = true;
      }
    });
  }

  void repetirPractica() {
    temporizadorEspera?.cancel();
    setState(() {
      progreso = 0;
      estaTerminado = false;
      ladoIzquierdoPresionado = false;
      ladoDerechoPresionado = false;
      hayAccionReciente = false;
      ultimoLadoToque = null;
    });
  }

  void volverAlInicio() {
    Navigator.of(context).pop();
  }

  void presionarLadoMariposa({
    required bool esIzquierda,
    required bool estaPresionado,
  }) {
    registrarAccion();

    setState(() {
      if (esIzquierda) {
        ladoIzquierdoPresionado = estaPresionado;
      } else {
        ladoDerechoPresionado = estaPresionado;
      }
    });

    if (ladoIzquierdoPresionado && ladoDerechoPresionado) {
      avanzar();
      setState(() {
        ladoIzquierdoPresionado = false;
        ladoDerechoPresionado = false;
      });
    }
  }

  void tocarLado({required bool esIzquierda}) {
    if (estaTerminado) {
      return;
    }

    registrarAccion();

    final lado = esIzquierda ? LadoToque.izquierdo : LadoToque.derecho;

    if (widget.tipoNado == TipoNado.libre ||
        widget.tipoNado == TipoNado.dorso) {
      if (ultimoLadoToque == lado) {
        return;
      }

      ultimoLadoToque = lado;
      avanzar();
    }
  }

  void deslizarArriba(DragEndDetails detalles) {
    if (widget.tipoNado != TipoNado.pecho) {
      return;
    }

    registrarAccion();

    final velocidad = detalles.primaryVelocity ?? 0;
    if (velocidad < 0) {
      avanzar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final porcentajeProgreso = progreso / progresoMeta;
    final enEspera = estaTerminado || !hayAccionReciente;
    final juegoCompleto = progreso >= progresoMeta;
    final largoActual = juegoCompleto
        ? totalLargos - 1
        : (progreso ~/ 100).clamp(0, totalLargos - 1).toInt();
    final progresoEnLargo = juegoCompleto ? 100.0 : progreso % 100;
    final porcentajeLargo = progresoEnLargo / 100;
    final vaHaciaLaDerecha = largoActual.isEven;
    final largoMostrado = juegoCompleto ? totalLargos : largoActual + 1;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _BarraSuperior(
                tipoNado: widget.tipoNado,
                distancia: widget.distancia,
                alVolverInicio: volverAlInicio,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: VistaPiscina(
                      tipoNado: widget.tipoNado,
                      porcentajeLargo: porcentajeLargo,
                      vaHaciaLaDerecha: vaHaciaLaDerecha,
                      enEspera: enEspera,
                      largoActual: largoActual,
                      totalLargos: totalLargos,
                      alTocarLado: tocarLado,
                      alDeslizarArriba: deslizarArriba,
                      alCambiarLadoMariposa: presionarLadoMariposa,
                      ladoIzquierdoPresionado: ladoIzquierdoPresionado,
                      ladoDerechoPresionado: ladoDerechoPresionado,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _PanelInferior(
                tipoNado: widget.tipoNado,
                progreso: progreso,
                progresoMeta: progresoMeta,
                porcentajeProgreso: porcentajeProgreso,
                largoMostrado: largoMostrado,
                totalLargos: totalLargos,
                distancia: widget.distancia,
                estaTerminado: estaTerminado,
                alRepetir: repetirPractica,
                alVolverInicio: volverAlInicio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarraSuperior extends StatelessWidget {
  const _BarraSuperior({
    required this.tipoNado,
    required this.distancia,
    required this.alVolverInicio,
  });

  final TipoNado tipoNado;
  final DistanciaNado distancia;
  final VoidCallback alVolverInicio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: alVolverInicio,
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Volver',
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 18,
              runSpacing: 8,
              children: [
                _TextoInfo(etiqueta: 'Nado', valor: tipoNado.etiqueta),
                _TextoInfo(etiqueta: 'Distancia', valor: distancia.etiqueta),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextoInfo extends StatelessWidget {
  const _TextoInfo({required this.etiqueta, required this.valor});

  final String etiqueta;
  final String valor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          etiqueta,
          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
        ),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}

class _PanelInferior extends StatelessWidget {
  const _PanelInferior({
    required this.tipoNado,
    required this.progreso,
    required this.progresoMeta,
    required this.porcentajeProgreso,
    required this.largoMostrado,
    required this.totalLargos,
    required this.distancia,
    required this.estaTerminado,
    required this.alRepetir,
    required this.alVolverInicio,
  });

  final TipoNado tipoNado;
  final double progreso;
  final double progresoMeta;
  final double porcentajeProgreso;
  final int largoMostrado;
  final int totalLargos;
  final DistanciaNado distancia;
  final bool estaTerminado;
  final VoidCallback alRepetir;
  final VoidCallback alVolverInicio;

  String get textoAyuda {
    switch (tipoNado) {
      case TipoNado.libre:
      case TipoNado.dorso:
        return 'Alterna izquierda y derecha';
      case TipoNado.mariposa:
        return 'Presiona ambos lados';
      case TipoNado.pecho:
        return 'Desliza hacia arriba';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progreso',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                '${progreso.toInt()} / ${progresoMeta.toInt()}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF075985),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 16,
            runSpacing: 6,
            children: [
              Text(
                'Largo $largoMostrado / $totalLargos',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                'Distancia total: ${distancia.etiqueta}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: porcentajeProgreso,
            minHeight: 14,
            borderRadius: BorderRadius.circular(20),
            backgroundColor: const Color(0xFFE0F2FE),
          ),
          const SizedBox(height: 12),
          Text(
            textoAyuda,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          if (estaTerminado) ...[
            const SizedBox(height: 14),
            _PanelFinal(alRepetir: alRepetir, alVolverInicio: alVolverInicio),
          ],
        ],
      ),
    );
  }
}

class _PanelFinal extends StatelessWidget {
  const _PanelFinal({required this.alRepetir, required this.alVolverInicio});

  final VoidCallback alRepetir;
  final VoidCallback alVolverInicio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F2FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Llegaste a la meta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF075985),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              FilledButton(
                onPressed: alRepetir,
                child: const Text('Repetir practica'),
              ),
              OutlinedButton(
                onPressed: alVolverInicio,
                child: const Text('Volver al inicio'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
