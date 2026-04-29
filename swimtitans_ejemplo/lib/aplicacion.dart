import 'package:flutter/material.dart';

import 'screens/pantalla_inicio.dart';

const Color colorPrincipal = Colors.blue;
const Color colorFondoAplicacion = Color(0xFFE6F7FF);

class AplicacionSwimTitans extends StatelessWidget {
  const AplicacionSwimTitans({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swim Titans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorPrincipal),
        scaffoldBackgroundColor: colorFondoAplicacion,
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}