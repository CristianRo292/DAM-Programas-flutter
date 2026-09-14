import 'package:flutter/material.dart';
// es como si python y html tubieran un hijo 😉
class practica2 extends StatefulWidget {
  const practica2({super.key});

  @override
  State<StatefulWidget> createState() {
    return Disenio();
  }
}

class Disenio extends State<practica2>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar( // aqui se aloja el encabezado superior de la app
      title: Text('Practica 2',
      style: TextStyle(
        color: Colors.white,
      ),
      ),
      backgroundColor: const Color.fromARGB(255, 6, 79, 238),
    ),
    // contenedores: subvetana dentro de la principal
    body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              child: 
                Text(
                  "Hola Mundo",
                  textAlign: TextAlign.center ,
                  style: TextStyle(
                    color:  Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 24
                  ),
                ) 
            ),

            SizedBox(
              height: 5,
            ),

            Container(
              padding: EdgeInsets.all(25),
              color: Colors.red,
              width: double.infinity,
              child: 
                Text(
                  "Hola",
                  textAlign: TextAlign.center ,
                  style: TextStyle(
                    color:  Colors.white,
                    fontFamily: "Times New Roman",
                    fontSize: 24
              ),) 
            ),

            SizedBox(
              height: 5,
            ),

            SizedBox(
              width: double.infinity,
              child: 
                ElevatedButton(
                  onPressed: (){},
                  child: Text("Boton")
                  ),
            ),

            SizedBox(
              height: 5,
            ),

            TextField(
              decoration: 
                InputDecoration(
                  labelText: "Escribe el nombre",
                  border: OutlineInputBorder() // falta
              )
            )
        ],
      )

   );

  }


}