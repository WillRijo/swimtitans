import 'package:flutter/material.dart';

import '../models/game_mode.dart';

class ModeSelector extends StatelessWidget {
  const ModeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ModeChip(label: GameMode.practice.label, isSelected: true),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _ModeChip(
            label: '${GameMode.competition.label}\nPróximamente',
            isSelected: false,
            isDisabled: true,
          ),
        ),
      ],
    );
  }
}

class _ModeChip extends StatelessWidget {
  const _ModeChip({
    required this.label,
    required this.isSelected,
    this.isDisabled = false,
  });

  final String label;
  final bool isSelected;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? const Color(0xFF0284C7)
        : isDisabled
        ? const Color(0xFFE2E8F0)
        : Colors.white;
    final textColor = isSelected ? Colors.white : const Color(0xFF64748B);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFBAE6FD)),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
