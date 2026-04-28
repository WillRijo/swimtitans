import 'package:flutter/material.dart';

import '../models/swim_distance.dart';
import '../models/swim_stroke.dart';
import '../widgets/pool_view.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.stroke, required this.distance});

  final SwimStroke stroke;
  final SwimDistance distance;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double progress = 0;
  bool isFinished = false;
  bool isLeftPressed = false;
  bool isRightPressed = false;

  double get targetProgress => widget.distance.targetProgress;

  void moveForward() {
    if (isFinished) {
      return;
    }

    setState(() {
      progress += 20;
      if (progress >= targetProgress) {
        progress = targetProgress;
        isFinished = true;
      }
    });
  }

  void repeatPractice() {
    setState(() {
      progress = 0;
      isFinished = false;
      isLeftPressed = false;
      isRightPressed = false;
    });
  }

  void goHome() {
    Navigator.of(context).pop();
  }

  void pressButterflySide({required bool isLeft, required bool isPressed}) {
    setState(() {
      if (isLeft) {
        isLeftPressed = isPressed;
      } else {
        isRightPressed = isPressed;
      }
    });

    if (isLeftPressed && isRightPressed) {
      moveForward();
      setState(() {
        isLeftPressed = false;
        isRightPressed = false;
      });
    }
  }

  void handleTapSide() {
    if (widget.stroke == SwimStroke.freestyle ||
        widget.stroke == SwimStroke.backstroke) {
      moveForward();
    }
  }

  void handleSwipeUp(DragEndDetails details) {
    if (widget.stroke != SwimStroke.breaststroke) {
      return;
    }

    final velocity = details.primaryVelocity ?? 0;
    if (velocity < 0) {
      moveForward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final progressPercent = progress / targetProgress;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _TopBar(
                stroke: widget.stroke,
                distance: widget.distance,
                progress: progress,
                targetProgress: targetProgress,
              ),
              const SizedBox(height: 14),
              Expanded(
                child: PoolView(
                  stroke: widget.stroke,
                  progressPercent: progressPercent,
                  onTapSide: handleTapSide,
                  onSwipeUp: handleSwipeUp,
                  onButterflySideChanged: pressButterflySide,
                  isLeftPressed: isLeftPressed,
                  isRightPressed: isRightPressed,
                ),
              ),
              const SizedBox(height: 14),
              LinearProgressIndicator(
                value: progressPercent,
                minHeight: 14,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 14),
              if (isFinished)
                _FinishPanel(onRepeat: repeatPractice, onGoHome: goHome)
              else
                OutlinedButton(
                  onPressed: goHome,
                  child: const Text('Volver al inicio'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.stroke,
    required this.distance,
    required this.progress,
    required this.targetProgress,
  });

  final SwimStroke stroke;
  final SwimDistance distance;
  final double progress;
  final double targetProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _InfoText(label: 'Nado', value: stroke.label),
          _InfoText(label: 'Distancia', value: distance.label),
          _InfoText(
            label: 'Progreso',
            value: '${progress.toInt()} / ${targetProgress.toInt()}',
          ),
        ],
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}

class _FinishPanel extends StatelessWidget {
  const _FinishPanel({required this.onRepeat, required this.onGoHome});

  final VoidCallback onRepeat;
  final VoidCallback onGoHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Text(
            '¡Llegaste a la meta!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF075985),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              FilledButton(
                onPressed: onRepeat,
                child: const Text('Repetir práctica'),
              ),
              OutlinedButton(
                onPressed: onGoHome,
                child: const Text('Volver al inicio'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
