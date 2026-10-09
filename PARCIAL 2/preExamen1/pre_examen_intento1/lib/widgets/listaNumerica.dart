
import 'dart:ffi';

import 'package:flutter/material.dart';

class Listanumerica extends StatefulWidget
{
  const Listanumerica({super.key});

  @override 
  State<StatefulWidget> createState()
  {
    return contenidoVentana();
  }
} 

class Item // class que alverga los elemenots de las listas
{
  final int titulo;
  // final String subtitulo;
  Item(this.titulo);
}

class contenidoVentana extends State<Listanumerica>
{
  // VARIABLES DE CAJAS DE TEXTO
  TextEditingController numero_str = TextEditingController();
  // TextEditingController precio = TextEditingController();
  int cont_par = 0;
  int cont_inPar = 0;

  

  final List<Item> items = [
    
  ];
  // metodo par alas notificaciones 
  void _snackbarNot({String contenido = "Error"})
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(contenido),
          behavior: SnackBarBehavior.floating,
          )
      );
  }

  void _mostrarDatos(String nomProd, precProd)
  {
    print(precProd + nomProd);
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    // decoramos con un circulo color negro ;) 
                    color: const Color.fromARGB(255, 0, 0, 0),
                    shape: BoxShape.circle
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                    nomProd, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      ),
                    ),
                SizedBox(height: 10,),
                Text(precProd,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      ),
                    ),
                SizedBox(height: 10,),
                Container(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text("Cerrar")
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }


  void _agregar()
  {
    int numInt = int.tryParse(numero_str.text) ?? -1;

    print(numInt);

    if (numInt < 0 || numero_str.text.isEmpty)
    {
      _snackbarNot(contenido: "Completa los datos");
      return;
    }
    // se agrega a la lista
    setState(() { // se usa ese metodo para actualizar los datos en la pantalla
      int mod = numInt % 2;

      if (mod == 0)
      {
        cont_par += 1;
      }
      else 
      {
        cont_inPar += 1;
      }
      items.insert(
        0, Item(numInt)
        );
    });
    // basiamos cajas de texto
    numero_str.clear();
    _snackbarNot(contenido: "Numero Agregado");
    
  }

  @override 
  Widget build(BuildContext contex)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Practica de listas",
        style: TextStyle(
          color: Colors.white
          ),
        ),
        actions: [
          // eventos que se agregan en la parte superior, pero en el estremo derecho de la ventana 
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8 
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 248, 255),
                  borderRadius: BorderRadius.circular(5)
                  ),
                child: Text(
                  '${items.length} productos ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: numero_str,
                            decoration: InputDecoration(
                              labelText: "Escribe el Numero",
                              
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: _agregar, // el guin bajo indica que es un metodo
                              child: Text("Agregar")
                              ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                        children: [
                          // Expanded(child: FittedBox(child: Text("Pares: $cont_par", style: TextStyle(fontSize: 18),))),
                          // // Expanded(child: Text("Numeros Inpares: $cont_inPar"))
                          // Expanded(child: FittedBox(child: Text("Inpares: $cont_inPar", style: TextStyle(fontSize: 18)))),
                          Text("Pares: $cont_par", style: TextStyle(fontSize: 18)),
                          SizedBox(width: 100,),
                          Text("Inpares: $cont_inPar", style: TextStyle(fontSize: 18))
                          
                        ],
                      ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder( // permite listas infinitas que puedes desplazarte con ella usando scrol
                    itemCount: items.length , // no regresa la logitud de elemntos que tiene items (la lista)
                    itemBuilder: (contex, index) => Card( // card enbuelve todo en una caja bonita, con ligeras sombras.
                      child: ListTile(
                        leading: Icon(Icons.add_alarm), // icono al estremo izquierdo
                        title: Text('${items[index].titulo}'), // el index indica la posicion que le toco en relacion en su posicion en pantalla
                        trailing: Icon(Icons.mic_none_sharp), // icono al estremo derecho de mi lista
                        onTap: (){
                          // _mostrarDatos(items, index);
                          _mostrarDatos("Numero: ", '${items[index].titulo}');
                        },
                      ),
                    )
                    ),
                ),
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}