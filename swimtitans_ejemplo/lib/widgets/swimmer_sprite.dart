import 'package:flutter/material.dart';

import '../models/swim_stroke.dart';

class SwimmerSprite extends StatelessWidget {
  const SwimmerSprite({super.key, required this.stroke});

  final SwimStroke stroke;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76,
      height: 76,
      child: Image.asset(
        stroke.assetPath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return _SwimmerPlaceholder(stroke: stroke);
        },
      ),
    );
  }
}

class _SwimmerPlaceholder extends StatelessWidget {
  const _SwimmerPlaceholder({required this.stroke});

  final SwimStroke stroke;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFF0284C7), width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.pool, color: Color(0xFF0284C7), size: 28),
          Text(
            stroke.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF075985),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
