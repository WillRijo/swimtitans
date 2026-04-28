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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Swim Titans',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF075985),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _TarjetaBlanca(title: 'Modo', child: const SelectorModo()),
                  const SizedBox(height: 16),
                  _TarjetaBlanca(
                    title: 'Tipo de nado',
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: TipoNado.values.map((tipoNado) {
                        return BotonTipoNado(
                          tipoNado: tipoNado,
                          estaSeleccionado: tipoNadoSeleccionado == tipoNado,
                          onPressed: () {
                            setState(() {
                              tipoNadoSeleccionado = tipoNado;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TarjetaBlanca(
                    title: 'Distancia',
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: DistanciaNado.values.map((distancia) {
                        return BotonDistancia(
                          distancia: distancia,
                          estaSeleccionada: distanciaSeleccionada == distancia,
                          onPressed: () {
                            setState(() {
                              distanciaSeleccionada = distancia;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: iniciarPractica,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Iniciar practica'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TarjetaBlanca extends StatelessWidget {
  const _TarjetaBlanca({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
