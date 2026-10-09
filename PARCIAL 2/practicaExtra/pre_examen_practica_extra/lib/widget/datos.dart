
import 'package:flutter/material.dart';
import 'package:pre_examen_practica_extra/widget/lista.dart';

class Datos extends StatefulWidget
{
  const Datos({super.key});
  @override
  State<StatefulWidget> createState() => _DatosState();
}

class Item
{
  final String producto;
  final String Descripcion;
  final String precio;
  Item(this.producto, this.Descripcion, this.precio);
}

class _DatosState extends State<Datos>
{
  TextEditingController pre = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController prod = TextEditingController();

  List<Item> items = [];
  
  @override
  Widget build(BuildContext context)
  {

    void _Enviar() async
    {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => Lista(
            items : items
          ),
          )
      );
    }
    void _Agregar()
    {
      setState(() {
        String p = prod.text;
        String d = desc.text;
        String pr = pre.text;
        print("$p , $d , $pr");
        if (p.isNotEmpty && d.isNotEmpty && pr.isNotEmpty)
        {
          items.add(Item(p, d, pr));
          
          prod.clear();
          desc.clear();
          pre.clear();
          // _Enviar();
        }
        else
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Faltan datos")),
          );
        }
        
      });
    }
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Datos'),
        backgroundColor: Colors.lightGreen,
        actions: [
          IconButton(
            onPressed: _Enviar, 
            icon: Icon(Icons.list)
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: prod,
                    decoration: InputDecoration(
                      labelText: "Escribe el Producto",
                      border: OutlineInputBorder(), // cajita que envieleve la caja de texto
                    ),
                  ),
                  TextField(
                    controller: desc,
                    decoration: InputDecoration(
                      labelText: "Escribe la descripcion",
                      border: OutlineInputBorder(), // cajita que envieleve la caja de texto
                    ),
                  ),
                  TextField(
                    controller: pre,
                    decoration: InputDecoration(
                      labelText: "Escribe el Precio",
                      border: OutlineInputBorder(), // cajita que envieleve la caja de texto
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _Agregar, 
                      label: Text("Agregar")),
                  )
                ],
              ),
            ),
          ),
          ),
      ),
    );
  }
}