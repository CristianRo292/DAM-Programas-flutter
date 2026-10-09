import 'package:flutter/material.dart';

class Listas1 extends StatefulWidget
{
  const Listas1({super.key});

  @override 
  State<StatefulWidget> createState()
  {
    return contenidoVentana();
  }
} 

class Item // class que alverga los elemenots de las listas
{
  final String titulo;
  final String subtitulo;
  Item(this.titulo, this.subtitulo);
}

class contenidoVentana extends State<Listas1>
{
  
  // final List<Map<String, String>> items = [
  //   {'title' : 'jabon', 'subtitulo' : '120.00'},
  //   {'title' : 'Agua', 'subtitulo' : '12.00'},
  //   {'title' : 'Sal', 'subtitulo' : '100.00'},
  // ];

  final List<Item> items = [
    Item('Jabon', '\$120.00'),
    Item('Agua', '\$120.00'),
    Item('Sal', '\$120.00'),
    Item('Arina', '\$120.00'),
    Item('Refresco', '\$120.00'),
    Item('Refresco fresa', '\$120.00'),
    Item('Refresco Coco', '\$120.00'),
  ];


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
      ),
      body: ListView.builder( // permite listas infinitas que puedes desplazarte con ella usando scrol
        itemCount: items.length ,
        itemBuilder: (contex, index) => Card( // card enbuelve todo en una caja bonita, con ligeras sombras.
          child: ListTile(
            leading: Icon(Icons.add_alarm), // icono al estremo izquierdo
            title: Text(items[index].titulo), // el index indica la posicion que le toco en relacion en su posicion en pantalla
            subtitle: Text(items[index].subtitulo),
            // title: Text("Lista"),
            // subtitle:
            //   Text("subtitulo"),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start, // determina la orientacion a la que se centra en pantalla
            //   children: [
                
            //     // Text("Esta es una descripcion de un subtitulo"),
            //     // Text("Esta es una descripcion de un subtitulo"),
            //     // Text("Esta es una descripcion de un subtitulo"),
            //   ],
            // ),
            trailing: Icon(Icons.mic_none_sharp), // icono al estremo derecho de mi lista
          ),
        )
        ),
    );
  }
}