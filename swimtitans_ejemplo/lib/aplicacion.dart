import 'package:flutter/material.dart';

import 'screens/pantalla_inicio.dart';

class AplicacionSwimTitans extends StatelessWidget {
  const AplicacionSwimTitans({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swim Titans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFE6F7FF),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}
