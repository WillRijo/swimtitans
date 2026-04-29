import 'dart:async';

import 'package:flutter/material.dart';

import '../modelos/distancia_nado.dart';
import '../modelos/tipo_nado.dart';
import '../widgets/sprite_nadador.dart';
import '../widgets/vista_piscina.dart';

enum LadoPantalla { izquierdo, derecho }

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
  static const double progresoPorVuelta = 100;
  double progresoActual = 0;
  bool practicaTerminada = false;
  bool ladoIzquierdoPresionado = false;
  bool ladoDerechoPresionado = false;
  bool elJugadorEstaNadando = false;
  Timer? temporizadorParaVolverAEspera;
  LadoPantalla? ultimoLadoTocado;

  double get progresoNecesarioParaGanar =>
      widget.distancia.progresoNecesarioParaGanar;
  int get totalVueltas => widget.distancia.vueltas;

  Duration get duracionAccionSprite {
    switch (widget.tipoNado) {
      case TipoNado.libre:
        return SpriteNadador.configuracionLibre.duracionDelCiclo +
            const Duration(milliseconds: 100);
      case TipoNado.dorso:
        return SpriteNadador.configuracionDorso.duracionDelCiclo +
            const Duration(milliseconds: 100);
      case TipoNado.pecho:
        return SpriteNadador.configuracionPecho.duracionDelCiclo +
            const Duration(milliseconds: 100);
      case TipoNado.mariposa:
        return SpriteNadador.configuracionMariposa.duracionDelCiclo +
            const Duration(milliseconds: 100);
    }
  }

  @override
  void dispose() {
    temporizadorParaVolverAEspera?.cancel();
    super.dispose();
  }

  void registrarQueElJugadorEstaNadando() {
    if (practicaTerminada) {
      return;
    }

    if (!elJugadorEstaNadando) {
      setState(() {
        elJugadorEstaNadando = true;
      });
    }

    temporizadorParaVolverAEspera?.cancel();
    temporizadorParaVolverAEspera = Timer(duracionAccionSprite, () {
      if (!mounted) {
        return;
      }

      setState(() {
        elJugadorEstaNadando = false;
      });
    });
  }

  void avanzarNadador() {
    if (practicaTerminada) {
      return;
    }

    setState(() {
      progresoActual += widget.tipoNado.avancePorAccion;
      if (progresoActual >= progresoNecesarioParaGanar) {
        progresoActual = progresoNecesarioParaGanar;
        practicaTerminada = true;
      }
    });
  }

  void reiniciarPractica() {
    temporizadorParaVolverAEspera?.cancel();
    setState(() {
      progresoActual = 0;
      practicaTerminada = false;
      ladoIzquierdoPresionado = false;
      ladoDerechoPresionado = false;
      elJugadorEstaNadando = false;
      ultimoLadoTocado = null;
    });
  }

  void volverAlInicio() {
    Navigator.of(context).pop();
  }

  void cambiarPresionDelLadoParaMariposa({
    required bool esIzquierda,
    required bool estaPresionado,
  }) {
    registrarQueElJugadorEstaNadando();

    setState(() {
      if (esIzquierda) {
        ladoIzquierdoPresionado = estaPresionado;
      } else {
        ladoDerechoPresionado = estaPresionado;
      }
    });

    if (ladoIzquierdoPresionado && ladoDerechoPresionado) {
      avanzarNadador();
      setState(() {
        ladoIzquierdoPresionado = false;
        ladoDerechoPresionado = false;
      });
    }
  }

  void tocarLadoDeLaPiscina({required bool esIzquierda}) {
    if (practicaTerminada) {
      return;
    }

    registrarQueElJugadorEstaNadando();

    final lado = esIzquierda ? LadoPantalla.izquierdo : LadoPantalla.derecho;

    if (widget.tipoNado == TipoNado.libre ||
        widget.tipoNado == TipoNado.dorso) {
      if (ultimoLadoTocado == lado) {
        return;
      }

      ultimoLadoTocado = lado;
      avanzarNadador();
    }
  }

  void intentarAvanzarConDeslizamiento(DragEndDetails detalles) {
    if (widget.tipoNado != TipoNado.pecho) {
      return;
    }

    registrarQueElJugadorEstaNadando();

    final velocidad = detalles.primaryVelocity ?? 0;
    if (velocidad < 0) {
      avanzarNadador();
    }
  }

  @override
  Widget build(BuildContext context) {
    final porcentajeProgreso = progresoActual / progresoNecesarioParaGanar;

    final enEspera = practicaTerminada || !elJugadorEstaNadando;
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

    final vueltaMostrada = practicaCompleta ? totalVueltas : vueltaActual + 1;

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
                      porcentajeDeLaVuelta: porcentajeDeLaVuelta,
                      vaHaciaLaDerecha: vaHaciaLaDerecha,
                      enEspera: enEspera,
                      alTocarLado: tocarLadoDeLaPiscina,
                      alDeslizarArriba: intentarAvanzarConDeslizamiento,
                      alCambiarLadoMariposa: cambiarPresionDelLadoParaMariposa,
                      ladoIzquierdoPresionado: ladoIzquierdoPresionado,
                      ladoDerechoPresionado: ladoDerechoPresionado,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _PanelInferior(
                tipoNado: widget.tipoNado,
                progresoActual: progresoActual,
                progresoNecesarioParaGanar: progresoNecesarioParaGanar,
                porcentajeProgreso: porcentajeProgreso,
                vueltaMostrada: vueltaMostrada,
                totalVueltas: totalVueltas,
                distancia: widget.distancia,
                estaTerminado: practicaTerminada,
                alRepetir: reiniciarPractica,
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
    required this.progresoActual,
    required this.progresoNecesarioParaGanar,
    required this.porcentajeProgreso,
    required this.vueltaMostrada,
    required this.totalVueltas,
    required this.distancia,
    required this.estaTerminado,
    required this.alRepetir,
    required this.alVolverInicio,
  });

  final TipoNado tipoNado;
  final double progresoActual;
  final double progresoNecesarioParaGanar;
  final double porcentajeProgreso;
  final int vueltaMostrada;
  final int totalVueltas;
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
                '${progresoActual.toInt()} / ${progresoNecesarioParaGanar.toInt()}',
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
                'Vuelta $vueltaMostrada / $totalVueltas',
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
