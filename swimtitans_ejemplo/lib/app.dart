import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class SwimTitansApp extends StatelessWidget {
  const SwimTitansApp({super.key});

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
      home: const HomeScreen(),
    );
  }
}
