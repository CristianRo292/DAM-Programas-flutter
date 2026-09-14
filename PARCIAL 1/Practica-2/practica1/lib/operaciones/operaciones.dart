import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Suma extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return Diseno();
  }
}

class Diseno extends State<Suma>
{
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();
  String r = "";

  @override
  // TODO: implement widget
  Widget build(Object context)
  {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Suma de dos Numeros"),
        backgroundColor: const Color.fromARGB(255, 192, 214, 240),
        elevation: 10,
        shadowColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),

          ),
          elevation: 15,
          shadowColor: const Color.fromARGB(255, 124, 176, 223),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Ingresa los datos a sumar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "Escribe un numero",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.amp_stories)
                  ),
                
              ),
              SizedBox(height: 15,),
              TextField(
                controller: n2,
                decoration: InputDecoration(
                  labelText: "Escribe Otro numero",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.amp_stories)
                ),
                
              ),
              SizedBox(height: 15,),
              Text(r,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 102, 12, 12),
                ),
                ),
                SizedBox(height: 15,),
                SizedBox( 
                  width: double.infinity,
                 child:  ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    final int a = int.tryParse(n1.text) ?? 0; // intenta convertira int, si no puede deja el cero
                    final int b = int.tryParse(n2.text) ?? 0;
                    setState(() 
                    {
                      r = "${a + b}";
                    });
                    
                  },
                  label: Text("Sumar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 20, 133),
                    ),
                    )
                  ),
                )
                
              ]
              
            ) ,
            ),
        ),
      ),
    );
  }
}