import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<StatefulWidget> createState() {
    return Disenio();
  }
}

class Disenio extends State<Inicio>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Practica 1',
      style: TextStyle(
        color: Colors.white,
      ),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 79, 238),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hola mundo',
        style: TextStyle(
               color: Colors.deepPurpleAccent,
               fontSize: 25,
            ),
        ),
          Text('Hola',
          style: TextStyle(
               color: Colors.deepPurpleAccent,
               fontSize: 25,
            ),
          ),
      ],
    ),
   );
  }
}