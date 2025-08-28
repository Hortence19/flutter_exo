import 'package:flutter/material.dart';
import 'package:flutter_exo/iceCream.dart';
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
      home: Icecream(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFA865)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
