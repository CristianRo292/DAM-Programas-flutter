import 'package:flutter/material.dart';
import 'package:pre_examen_practica_extra/widget/datos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // quitamos la banda roja que dice debug
      home: Datos()
    );
  }
}
