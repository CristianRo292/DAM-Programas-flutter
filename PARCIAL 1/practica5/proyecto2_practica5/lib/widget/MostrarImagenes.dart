
import 'package:flutter/material.dart';

class MostrarImagenes extends StatefulWidget{
  const MostrarImagenes({super.key});
  @override
  State<StatefulWidget> createState(){
    return Imagenes();
  }
}

class Imagenes extends State<MostrarImagenes>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 218, 239),
      appBar: AppBar(
        title: Text("Imagenes", 
          style: TextStyle(
            color: Colors.white
            ),
          ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height:double.infinity ,
              child: Center( 
                child: SingleChildScrollView(
                  child: Column( // orniza en columan (arriba hacia abajo), tambien podria ser Row para las filas(de izquierda a derecha)
                    children: [
                      Image.asset("assets/linux.jpg", width: 100, height: 100,), // tamaño personalizado
                      Image.asset("assets/patitoche.jpg",width: 100, height: 100,),
                      Image.asset("assets/rotsito.jpg", width: 100, height: 100,),
                      Image.asset("assets/patitodormido.jpg", width: 100, height: 100,),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height:double.infinity ,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("assets/linux.jpg"),
                      Image.asset("assets/patitoche.jpg"),
                      Image.asset("assets/rotsito.jpg"),
                      Image.asset("assets/patitodormido.jpg"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ), 
    );
  }
}