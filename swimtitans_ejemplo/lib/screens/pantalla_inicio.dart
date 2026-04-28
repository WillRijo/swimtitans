import 'package:flutter/material.dart';

import '../models/distancia_nado.dart';
import '../models/tipo_nado.dart';
import '../widgets/boton_distancia.dart';
import '../widgets/boton_tipo_nado.dart';
import '../widgets/selector_modo.dart';
import 'pantalla_juego.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  TipoNado tipoNadoSeleccionado = TipoNado.libre;
  DistanciaNado distanciaSeleccionada = DistanciaNado.metros50;

  void iniciarPractica() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PantallaJuego(
          tipoNado: tipoNadoSeleccionado,
          distancia: distanciaSeleccionada,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 28),
                        const _EncabezadoInicio(),
                        Expanded(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 560),
                              child: _TarjetaSelectores(
                                tipoNadoSeleccionado: tipoNadoSeleccionado,
                                distanciaSeleccionada: distanciaSeleccionada,
                                alCambiarTipoNado: (tipoNado) {
                                  setState(() {
                                    tipoNadoSeleccionado = tipoNado;
                                  });
                                },
                                alCambiarDistancia: (distancia) {
                                  setState(() {
                                    distanciaSeleccionada = distancia;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 28, 8, 30),
                          child: FilledButton(
                            onPressed: iniciarPractica,
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('Iniciar practica'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _EncabezadoInicio extends StatelessWidget {
  const _EncabezadoInicio();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Swim Titans',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Color(0xFF075985),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Elige tu practica',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}

class _TarjetaSelectores extends StatelessWidget {
  const _TarjetaSelectores({
    required this.tipoNadoSeleccionado,
    required this.distanciaSeleccionada,
    required this.alCambiarTipoNado,
    required this.alCambiarDistancia,
  });

  final TipoNado tipoNadoSeleccionado;
  final DistanciaNado distanciaSeleccionada;
  final ValueChanged<TipoNado> alCambiarTipoNado;
  final ValueChanged<DistanciaNado> alCambiarDistancia;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 28),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const _TituloSeccion('Modo'),
          const SizedBox(height: 12),
          const SelectorModo(),
          const SizedBox(height: 24),
          const _TituloSeccion('Tipo de nado'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: TipoNado.values.map((tipoNado) {
              return BotonTipoNado(
                tipoNado: tipoNado,
                estaSeleccionado: tipoNadoSeleccionado == tipoNado,
                onPressed: () => alCambiarTipoNado(tipoNado),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const _TituloSeccion('Distancia'),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: DistanciaNado.values.map((distancia) {
              return BotonDistancia(
                distancia: distancia,
                estaSeleccionada: distanciaSeleccionada == distancia,
                onPressed: () => alCambiarDistancia(distancia),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TituloSeccion extends StatelessWidget {
  const _TituloSeccion(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF0F172A),
      ),
    );
  }
}
