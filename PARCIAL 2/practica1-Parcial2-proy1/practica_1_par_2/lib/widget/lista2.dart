import 'package:flutter/material.dart';

class Listas2 extends StatefulWidget
{
  const Listas2({super.key});

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

class contenidoVentana extends State<Listas2>
{
  
  // final List<Map<String, String>> items = [
  //   {'title' : 'jabon', 'subtitulo' : '120.00'},
  //   {'title' : 'Agua', 'subtitulo' : '12.00'},
  //   {'title' : 'Sal', 'subtitulo' : '100.00'},
  // ];
  // VARIABLES DE CAJAS DE TEXTO
  TextEditingController producto = TextEditingController();
  TextEditingController precio = TextEditingController();
  

  final List<Item> items = [
    Item('Jabon', '\$120.00'),
    Item('Agua', '\$120.00'),
    Item('Sal', '\$120.00'),
    // Item('Arina', '\$120.00'),
    // Item('Refresco', '\$120.00'),
    // Item('Refresco fresa', '\$120.00'),
    // Item('Refresco Coco', '\$120.00'),
  ];

  // variables de estilos
  // TextStyle titulo_styl = (fontWeight: FontWeight.bold);

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

  @override
  void dispose()
  {
    producto.dispose();
    precio.dispose();
    super.dispose();
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
    String prodStr = producto.text;
    String precStr = precio.text;

    if (prodStr.isEmpty && precStr.isEmpty)
    {
      _snackbarNot(contenido: "Completa los datos");
      return;
    }
    // se agrega a la lista
    setState(() { // se usa ese metodo para actualizar los datos en la pantalla
      items.insert(
        0, Item(prodStr, "\$ $precStr"),
        );
    });
    // basiamos cajas de texto
    producto.clear();
    precio.clear();
    FocusScope.of(context).unfocus(); // ocultamos el teclado de forma automatica
    // notificacion de confirmacion 
    _snackbarNot(contenido: "Producto Agregado");
    // print("Mensaje");
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
                        child: TextField(
                          controller: producto,
                          decoration: InputDecoration(
                            labelText: "Escribe el Producto",
                            
                          ),
                        ),
                      ),
                      Container(
                        child: TextField(
                          controller: precio,
                          decoration: InputDecoration(
                            labelText: "Escribe el precio",
                            
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _agregar, // el guin bajo indica que es un metodo
                            child: Text("Agregar")
                            ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder( // permite listas infinitas que puedes desplazarte con ella usando scrol
                    itemCount: items.length , // no regresa la logitud de elemntos que tiene items (la lista)
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
                        onTap: (){
                          // _mostrarDatos(items, index);
                          _mostrarDatos(items[index].titulo, items[index].subtitulo);
                        },
                      ),
                    )
                    ),
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){}
                ),
            ],
            
          ),
        ),
      ),
    );
  }
}