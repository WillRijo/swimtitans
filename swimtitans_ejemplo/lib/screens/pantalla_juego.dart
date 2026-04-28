import 'package:flutter/material.dart';

import '../models/distancia_nado.dart';
import '../models/tipo_nado.dart';
import '../widgets/vista_piscina.dart';

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

  double get progresoMeta => widget.distancia.progresoMeta;

  void avanzar() {
    if (estaTerminado) {
      return;
    }

    setState(() {
      progreso += 20;
      if (progreso >= progresoMeta) {
        progreso = progresoMeta;
        estaTerminado = true;
      }
    });
  }

  void repetirPractica() {
    setState(() {
      progreso = 0;
      estaTerminado = false;
      ladoIzquierdoPresionado = false;
      ladoDerechoPresionado = false;
    });
  }

  void volverAlInicio() {
    Navigator.of(context).pop();
  }

  void presionarLadoMariposa({
    required bool esIzquierda,
    required bool estaPresionado,
  }) {
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

  void tocarLado() {
    if (widget.tipoNado == TipoNado.libre ||
        widget.tipoNado == TipoNado.dorso) {
      avanzar();
    }
  }

  void deslizarArriba(DragEndDetails detalles) {
    if (widget.tipoNado != TipoNado.pecho) {
      return;
    }

    final velocidad = detalles.primaryVelocity ?? 0;
    if (velocidad < 0) {
      avanzar();
    }
  }

  @override
  Widget build(BuildContext context) {
    final porcentajeProgreso = progreso / progresoMeta;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _BarraSuperior(
                tipoNado: widget.tipoNado,
                distancia: widget.distancia,
                progreso: progreso,
                progresoMeta: progresoMeta,
              ),
              const SizedBox(height: 14),
              Expanded(
                child: VistaPiscina(
                  tipoNado: widget.tipoNado,
                  porcentajeProgreso: porcentajeProgreso,
                  alTocarLado: tocarLado,
                  alDeslizarArriba: deslizarArriba,
                  alCambiarLadoMariposa: presionarLadoMariposa,
                  ladoIzquierdoPresionado: ladoIzquierdoPresionado,
                  ladoDerechoPresionado: ladoDerechoPresionado,
                ),
              ),
              const SizedBox(height: 14),
              LinearProgressIndicator(
                value: porcentajeProgreso,
                minHeight: 14,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 14),
              if (estaTerminado)
                _PanelFinal(
                  alRepetir: repetirPractica,
                  alVolverInicio: volverAlInicio,
                )
              else
                OutlinedButton(
                  onPressed: volverAlInicio,
                  child: const Text('Volver al inicio'),
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
    required this.progreso,
    required this.progresoMeta,
  });

  final TipoNado tipoNado;
  final DistanciaNado distancia;
  final double progreso;
  final double progresoMeta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TextoInfo(etiqueta: 'Nado', valor: tipoNado.etiqueta),
          _TextoInfo(etiqueta: 'Distancia', valor: distancia.etiqueta),
          _TextoInfo(
            etiqueta: 'Progreso',
            valor: '${progreso.toInt()} / ${progresoMeta.toInt()}',
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

class _PanelFinal extends StatelessWidget {
  const _PanelFinal({required this.alRepetir, required this.alVolverInicio});

  final VoidCallback alRepetir;
  final VoidCallback alVolverInicio;

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
