import 'package:flutter/material.dart';

import '../models/swim_distance.dart';

class DistanceButton extends StatelessWidget {
  const DistanceButton({
    super.key,
    required this.distance,
    required this.isSelected,
    required this.onPressed,
  });

  final SwimDistance distance;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(distance.label),
      selected: isSelected,
      onSelected: (_) => onPressed(),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : const Color(0xFF0F172A),
      ),
      selectedColor: const Color(0xFF22C55E),
      backgroundColor: const Color(0xFFDCFCE7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      showCheckmark: false,
    );
  }
}
