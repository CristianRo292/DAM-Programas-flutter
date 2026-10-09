import 'package:flutter/material.dart';
import 'package:practica_1_par_2/widget/lista2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Listas2(),
    );
  }
}
