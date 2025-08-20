import 'package:flutter/material.dart';
import 'package:flutter_exo/welcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      home: Welcomepage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3FB4B1)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
