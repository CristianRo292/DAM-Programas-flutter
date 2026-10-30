import 'package:flutter/material.dart';
import 'package:practica1_parcial3_v2/partes/centro.dart';
import 'package:practica1_parcial3_v2/partes/derecho.dart';
import 'package:practica1_parcial3_v2/partes/izquierda.dart';

class Inicio extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return Clase();
  }
}

// funciones globales, se pueden usar en cualquier archivo donde importe esta clase:
TextStyle vEncabezados({double sizeTex = 24.0, Color colorTex = Colors.black})
  {
    return TextStyle(
      fontWeight: FontWeight.bold, // letra negrita
      color: colorTex,
      fontSize: sizeTex,
      shadows: [
        Shadow(
          color: Colors.grey, // color de la sombra
          offset: Offset(2.2, 2.2), // desplazamiento de la sombra
          blurRadius: 2.0
        )
      ]

    );
  }

  TextStyle vTxtNormal({double sizeTex = 20, Color colorTex = Colors.black87})
  {
    return TextStyle(
      fontSize: sizeTex,                 
      fontWeight: FontWeight.normal, //estilo de la letra  
      color: colorTex,           
      letterSpacing: 0.5, // espacio entre caracteres             
      height: 1.5, // interlineado
    );
  }

class Clase extends State<Inicio>
{
  int _index = 0;

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica 1"),
        backgroundColor: Colors.greenAccent,
      ),
      body: _index == 0 ? Izquierda(): (_index == 1 ? Centro(): Derecho()),
      bottomNavigationBar: BottomNavigationBar(
        items: 
        [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_left_outlined), label: "Val Telefono"), // validar que el telefono empiece con +52
          BottomNavigationBarItem(icon: Icon(Icons.center_focus_strong_rounded), label: "Val Correo"),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_right), label: "Precios"), // numeros con desimales y si es posible signo de pesos
        ],
        currentIndex: _index,
        selectedItemColor: Colors.purpleAccent,
        onTap: (index)
        {
          setState(() 
          {
            _index = index;
          });
        },
      ),
    );
  }

}