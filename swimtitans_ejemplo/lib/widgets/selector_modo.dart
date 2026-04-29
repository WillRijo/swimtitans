import 'package:flutter/material.dart';

import '../modelos/modo_juego.dart';

class SelectorModo extends StatelessWidget {
  const SelectorModo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FichaModo(
            etiqueta: ModoJuego.practica.etiqueta,
            estaSeleccionado: true,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _FichaModo(
            etiqueta: ModoJuego.competencia.etiqueta,
            estaSeleccionado: false,
            estaDeshabilitado: true,
          ),
        ),
      ],
    );
  }
}

class _FichaModo extends StatelessWidget {
  const _FichaModo({
    required this.etiqueta,
    required this.estaSeleccionado,
    this.estaDeshabilitado = false,
  });

  final String etiqueta;
  final bool estaSeleccionado;
  final bool estaDeshabilitado;

  @override
  Widget build(BuildContext context) {
    final colorFondo = estaSeleccionado
        ? const Color(0xFF0284C7)
        : estaDeshabilitado
        ? const Color(0xFFE2E8F0)
        : Colors.white;
    final colorTexto = estaSeleccionado
        ? Colors.white
        : const Color(0xFF64748B);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFBAE6FD)),
      ),
      child: Text(
        etiqueta,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorTexto,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
