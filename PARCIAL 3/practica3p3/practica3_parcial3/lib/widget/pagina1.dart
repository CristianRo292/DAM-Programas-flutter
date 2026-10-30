// import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';
import 'package:practica3_parcial3/pages/inicio.dart';
import 'package:practica3_parcial3/pages/pagina2.dart';
import 'package:practica3_parcial3/pages/pagina3.dart';

class Pagina1 extends StatefulWidget
{
  const Pagina1({super.key});
  @override
  State<StatefulWidget> createState()
  {
    return ContVentana();
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

class ContVentana extends State<Pagina1>
{
  int _indexP = 0;
  List<Widget> _paginas = [
    Inicio(),
    Pagina2(),
    Pagina3()
  ];

  void _HacerClick(int index)
  {
    setState(() {
      _indexP = index;
    });
  }

  



  @override
  Widget build(BuildContext contex)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Drawer "),
        backgroundColor: Colors.lightGreen,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 197, 226, 210)
              ),
              child: Column(
                children: [
                  Expanded(child: Image.asset("assets/centroideLogo-claro.jpg")),
                  SizedBox(width: 20, height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Centroide", style: vEncabezados(sizeTex: 20),),
                      Text("Tu Gestor Personal", style: vEncabezados(sizeTex: 15, colorTex: const Color.fromARGB(255, 15, 73, 17)))
                    ],
                  ),
                  SizedBox(height: 5),
                  Text("Desarrollado por CriSoftware", style: vTxtNormal(sizeTex: 12),)
                ],
              )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              onTap: ()
              {
                _HacerClick(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.ballot_outlined),
              title: Text("Pagina 2"),
              onTap: ()
              {
                _HacerClick(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text("Pagina 3"),
              onTap: ()
              {
                _HacerClick(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _paginas[_indexP],
    );
  }
}