
// import 'dart:ffi';

import 'package:flutter/material.dart';

class Lista extends StatefulWidget
{
  final String Nombre;
  // final String dato_pas;

  const Lista({super.key, required this.Nombre});
  // const Lista({super.key});

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

class contenidoVentana extends State<Lista>
{
  // VARIABLES DE CAJAS DE TEXTO
  TextEditingController nombre = TextEditingController();
  TextEditingController telefono = TextEditingController();
  // TextEditingController precio = TextEditingController();
  // int cont_par = 0;
  // int cont_inPar = 0;

  String usuario_nom = "";

  

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

  void _notificacionAdd()
  {
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
                    Icons.contacts_sharp,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                      width: double.infinity,
                      child: TextField(
                        controller: nombre,
                        decoration: InputDecoration(
                          labelText: "Escribe el Nombre",
                          hintText: "Ingresa el Nombre",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        )
                      ),
                SizedBox(height: 10,),
                Container(
                      width: double.infinity,
                      child: TextField(
                        controller: telefono,
                        decoration: InputDecoration(
                          labelText: "Escribe el Telefono",
                          hintText: "Ingresa el Nombre",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        )
                      ),
                SizedBox(height: 10,),
                Container(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        _agregar();
                        Navigator.pop(context);
                      }, 
                      child: Text("Agregar")
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
    String prodStr = nombre.text;
    String precStr = telefono.text;

    if (prodStr.isEmpty && precStr.isEmpty)
    {
      _snackbarNot(contenido: "A ocurrido un error");
      return;
    }
    // se agrega a la lista
    setState(() { // se usa ese metodo para actualizar los datos en la pantalla
      items.insert(
        0, Item(prodStr, "$precStr"),
        );
    });
    // basiamos cajas de texto
    nombre.clear();
    telefono.clear();
    FocusScope.of(context).unfocus(); // ocultamos el teclado de forma automatica
    // notificacion de confirmacion 
    _snackbarNot(contenido: "Registro Exitoso");
    // print("Mensaje");
  }

  // bool _valTel(String tel)
  // {
  //   int t_val = int.tryParse(tel) ?? 0;
  //   if (t_val == 0 || tel.length != 10 ){return false;}
  //   return true;
  // }

  @override 
  void initState() // este metodo se incia antes de que empecemos la clase, cuando lo isntanciamos 
  {
    super.initState();
    usuario_nom = widget.Nombre;
    
  }

  Widget build(BuildContext contex)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 133, 26),
        title: Text(usuario_nom,
        style: TextStyle(
          color: Colors.white
          ),
        ),
        actions: [
          // eventos que se agregan en la parte superior, pero en el estremo derecho de la ventana 
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: _notificacionAdd
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
              // SizedBox(
              //   width: double.infinity,
              //   height: 200,
                
              //   child: Card(
              //     elevation: 8,
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
              //     child: Column(
              //       children: [
              //         Container(
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: TextField(
              //               controller: numero_str,
              //               decoration: InputDecoration(
              //                 labelText: "Escribe el Numero",
                              
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: 50,),
              //         Container(
              //           child: SizedBox(
              //             width: double.infinity,
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: ElevatedButton(
              //                 onPressed: _agregar, // el guin bajo indica que es un metodo
              //                 child: Text("Agregar")
              //                 ),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Row(
              //           children: [
              //             // Expanded(child: FittedBox(child: Text("Pares: $cont_par", style: TextStyle(fontSize: 18),))),
              //             // // Expanded(child: Text("Numeros Inpares: $cont_inPar"))
              //             // Expanded(child: FittedBox(child: Text("Inpares: $cont_inPar", style: TextStyle(fontSize: 18)))),
              //             Text("Pares: $cont_par", style: TextStyle(fontSize: 18)),
              //             SizedBox(width: 100,),
              //             Text("Inpares: $cont_inPar", style: TextStyle(fontSize: 18))
                          
              //           ],
              //         ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder( // permite listas infinitas que puedes desplazarte con ella usando scrol
                    itemCount: items.length , // no regresa la logitud de elemntos que tiene items (la lista)
                    itemBuilder: (contex, index) => Card( // card enbuelve todo en una caja bonita, con ligeras sombras.
                      child: ListTile(
                        leading: Image.asset("assets/logotipo_por_defecto.png"), // icono al estremo izquierdo
                        title: Text('${items[index].titulo}'),
                        subtitle: Text(items[index].subtitulo), // el index indica la posicion que le toco en relacion en su posicion en pantalla
                        trailing: Icon(Icons.mic_none_sharp), // icono al estremo derecho de mi lista
                        onTap: (){
                          // _mostrarDatos(items, index);
                          // _mostrarDatos("Numero: ", '${items[index].titulo}');
                          _snackbarNot(contenido: "$index");
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