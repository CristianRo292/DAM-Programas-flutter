import 'package:flutter/material.dart';

class Programa4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Clases();
  }
}

class Clases extends State<Programa4>{
  // variables para trabajar
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();

  String r = "", oper="";
 void Operaciones(){
    final int a = int.tryParse(n1.text) ?? 0; // convertimos los datos ingresados a int, 
    final int b = int.tryParse(n2.text) ?? 0; // en casi de no poder, coloca el valor de 0
  setState(() { // todo lo que esta aqui se actulizara en la pantalla de la app 
    print("Oper: "+oper); // mensaje de depuracion, en terminal
    if (oper == "Suma"){
          r = "${a + b}"; // nos permite convertir automaticamente a strin sin necesidad de casting
    }
    if (oper == "Resta"){
          r = "${a - b}";
    }
    if (oper == "Multiplicación"){
          r = "${a * b}";
    }
    if (oper == "División"){
          r = "${a / b}";
    }
    ScaffoldMessenger.of(context).showSnackBar(   // se trata de una alerta que sale de la parte inferior de la pantalla
      SnackBar(content: Text("El resultado:" +r)),// Aqui va escrito lo que mostrara en pantalla
    );
  });                  
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey, // color de fondo del conenedor general
        appBar: AppBar( // encabezado de la app
          title: Text('Suma de dos numeros'), 
          backgroundColor: const Color.fromARGB(255, 192, 214, 240),
          elevation: 10, // altura de la sombra
          shadowColor: Colors.indigoAccent, // color de la sombra
        ),
       body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 15,
          shadowColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
               children: [
                Text('Ingresa los datos a sumar',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "Escribe un numero",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.amp_stories)
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: n2,
                  decoration: InputDecoration(
                    labelText: "Escribe otro numero",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.amp_stories)
                  ),
                ),
                SizedBox(height: 20,),
                /*Text(r,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                ),*/
                DropdownButtonFormField<String>( // menu desplegable
                  decoration: InputDecoration(
                    labelText: "Elige la operación",
                    border: OutlineInputBorder(), // linea de borde alrededor del contenedor
                  ),
                  items: [
                    DropdownMenuItem(value: 'Suma', child:Text('Suma')),
                    DropdownMenuItem(value: 'Resta', child:Text('Resta')),
                    DropdownMenuItem(value: 'Multiplicación', child:Text('Multiplicación')),
                    DropdownMenuItem(value: 'División', child:Text('División')),
                  ], 
                  onChanged: (value) => oper = value!, // asigna el valor del campo seleccionado a la variable valor
                  validator: (v) => v == null ? "Elige una operacion": null, // mensaje que se muestra cuando no seleccionas nada
                  ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.summarize),
                    onPressed: Operaciones,
                    label:Text('Realizar operación',
                        style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                ),
                    ),
                ),
               ],
            ),
            ),
        ),
       ),
    );
  }
}