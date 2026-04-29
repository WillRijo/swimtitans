import 'package:flutter/material.dart';

import '../modelos/distancia_nado.dart';

class BotonDistancia extends StatelessWidget {
  const BotonDistancia({
    super.key,
    required this.distancia,
    required this.estaSeleccionada,
    required this.onPressed,
  });

  final DistanciaNado distancia;
  final bool estaSeleccionada;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(distancia.etiqueta),
      selected: estaSeleccionada,
      onSelected: (_) => onPressed(),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: estaSeleccionada ? Colors.white : const Color(0xFF0F172A),
      ),
      selectedColor: const Color(0xFF22C55E),
      backgroundColor: const Color(0xFFDCFCE7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      showCheckmark: false,
    );
  }
}
