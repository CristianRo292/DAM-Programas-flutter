// import 'dart:ffi';

import 'package:flutter/material.dart';

class acceso extends StatefulWidget
{
  final String dato;
  final String dato_pas;

  const acceso({super.key, required this.dato, required this.dato_pas});
  @override 
  State<StatefulWidget> createState()
  {
    return Clase( dato);
  }
}

class Clase (String dato) extends State<acceso>
{
  String dat_val = dato;
  String d = "";
  String p = "";
  final TextEditingController usuario = new TextEditingController();
  final TextEditingController passoware = new TextEditingController();

  

  @override 
  void initState() // este metodo se incia antes de que empecemos la clase, cuando lo isntanciamos 
  {
    super.initState();
    d = widget.dato;
    p = widget.dato_pas;
  }
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 240, 172) ,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 155, 133, 26),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Ingresa los datos",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      ),
                    ),
                  SizedBox(height: 10),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                      ),
                      child: ClipOval(
                        child: Image.asset("assets/usuario.png"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    // Text("Bienvenidos ${dat_val}"),
                    Text("Bienvenidos ${d} \n y su pasware es: $p"),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}