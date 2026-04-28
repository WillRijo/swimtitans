import 'package:flutter/material.dart';

import '../models/swim_distance.dart';
import '../models/swim_stroke.dart';
import '../widgets/distance_button.dart';
import '../widgets/mode_selector.dart';
import '../widgets/stroke_button.dart';
import 'game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SwimStroke selectedStroke = SwimStroke.freestyle;
  SwimDistance selectedDistance = SwimDistance.fifty;

  void startPractice() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            GameScreen(stroke: selectedStroke, distance: selectedDistance),
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
                  _WhiteCard(title: 'Modo', child: const ModeSelector()),
                  const SizedBox(height: 16),
                  _WhiteCard(
                    title: 'Tipo de nado',
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: SwimStroke.values.map((stroke) {
                        return StrokeButton(
                          stroke: stroke,
                          isSelected: selectedStroke == stroke,
                          onPressed: () {
                            setState(() {
                              selectedStroke = stroke;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _WhiteCard(
                    title: 'Distancia',
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: SwimDistance.values.map((distance) {
                        return DistanceButton(
                          distance: distance,
                          isSelected: selectedDistance == distance,
                          onPressed: () {
                            setState(() {
                              selectedDistance = distance;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: startPractice,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Iniciar práctica'),
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

class _WhiteCard extends StatelessWidget {
  const _WhiteCard({required this.title, required this.child});

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
