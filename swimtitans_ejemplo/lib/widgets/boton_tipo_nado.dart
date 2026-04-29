import 'package:flutter/material.dart';

import '../modelos/tipo_nado.dart';

class BotonTipoNado extends StatelessWidget {
  const BotonTipoNado({
    super.key,
    required this.tipoNado,
    required this.estaSeleccionado,
    required this.onPressed,
  });

  final TipoNado tipoNado;
  final bool estaSeleccionado;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(tipoNado.etiqueta),
      selected: estaSeleccionado,
      onSelected: (_) => onPressed(),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: estaSeleccionado ? Colors.white : const Color(0xFF0F172A),
      ),
      selectedColor: const Color(0xFF0EA5E9),
      backgroundColor: const Color(0xFFE0F2FE),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      showCheckmark: false,
    );
  }
}
