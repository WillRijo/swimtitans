import 'package:flutter/material.dart';

import '../models/swim_stroke.dart';
import 'swimmer_sprite.dart';

class PoolView extends StatelessWidget {
  const PoolView({
    super.key,
    required this.stroke,
    required this.progressPercent,
    required this.onTapSide,
    required this.onSwipeUp,
    required this.onButterflySideChanged,
    required this.isLeftPressed,
    required this.isRightPressed,
  });

  final SwimStroke stroke;
  final double progressPercent;
  final VoidCallback onTapSide;
  final GestureDragEndCallback onSwipeUp;
  final void Function({required bool isLeft, required bool isPressed})
  onButterflySideChanged;
  final bool isLeftPressed;
  final bool isRightPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final poolWidth = constraints.maxWidth;
        final poolHeight = constraints.maxHeight;
        final swimmerTop = (poolHeight - 74) * progressPercent.clamp(0, 1);

        return GestureDetector(
          onVerticalDragEnd: onSwipeUp,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF7DD3FC),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white, width: 6),
            ),
            child: Stack(
              children: [
                ..._buildLaneLines(poolWidth),
                _buildFinishLine(),
                _buildControlZones(),
                Positioned(
                  top: swimmerTop,
                  left: poolWidth / 2 - 38,
                  child: SwimmerSprite(stroke: stroke),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildLaneLines(double poolWidth) {
    return [
      Positioned(left: poolWidth / 3, top: 0, bottom: 0, child: _LaneLine()),
      Positioned(
        left: poolWidth * 2 / 3,
        top: 0,
        bottom: 0,
        child: _LaneLine(),
      ),
    ];
  }

  Widget _buildFinishLine() {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 18,
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildControlZones() {
    if (stroke == SwimStroke.butterfly) {
      return Row(
        children: [
          Expanded(
            child: _ControlZone(
              label: 'Izquierda',
              isPressed: isLeftPressed,
              onTapDown: () =>
                  onButterflySideChanged(isLeft: true, isPressed: true),
              onTapUp: () =>
                  onButterflySideChanged(isLeft: true, isPressed: false),
            ),
          ),
          Expanded(
            child: _ControlZone(
              label: 'Derecha',
              isPressed: isRightPressed,
              onTapDown: () =>
                  onButterflySideChanged(isLeft: false, isPressed: true),
              onTapUp: () =>
                  onButterflySideChanged(isLeft: false, isPressed: false),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _ControlZone(
            label: stroke == SwimStroke.breaststroke ? 'Swipe arriba' : 'Toca',
            onTapDown: onTapSide,
          ),
        ),
        Expanded(
          child: _ControlZone(
            label: stroke == SwimStroke.breaststroke ? 'Swipe arriba' : 'Toca',
            onTapDown: onTapSide,
          ),
        ),
      ],
    );
  }
}

class _LaneLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 3, color: Colors.white.withValues(alpha: 0.5));
  }
}

class _ControlZone extends StatelessWidget {
  const _ControlZone({
    required this.label,
    this.isPressed = false,
    this.onTapDown,
    this.onTapUp,
  });

  final String label;
  final bool isPressed;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) => onTapDown?.call(),
      onTapUp: (_) => onTapUp?.call(),
      onTapCancel: () => onTapUp?.call(),
      child: Container(
        alignment: Alignment.bottomCenter,
        color: isPressed ? Colors.white.withValues(alpha: 0.2) : null,
        padding: const EdgeInsets.only(bottom: 36),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
