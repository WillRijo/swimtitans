import 'package:flutter/material.dart';

import '../models/swim_stroke.dart';

class StrokeButton extends StatelessWidget {
  const StrokeButton({
    super.key,
    required this.stroke,
    required this.isSelected,
    required this.onPressed,
  });

  final SwimStroke stroke;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(stroke.label),
      selected: isSelected,
      onSelected: (_) => onPressed(),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : const Color(0xFF0F172A),
      ),
      selectedColor: const Color(0xFF0EA5E9),
      backgroundColor: const Color(0xFFE0F2FE),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      showCheckmark: false,
    );
  }
}
