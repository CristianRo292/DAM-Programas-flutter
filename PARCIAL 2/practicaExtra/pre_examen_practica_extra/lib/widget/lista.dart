import 'package:flutter/material.dart';
import 'package:pre_examen_practica_extra/widget/datos.dart';
import 'datos.dart';

class Lista extends StatefulWidget
{
  final List<Item> items;
  const Lista({super.key, required this.items});
  @override
  State<StatefulWidget> createState() => _ListaState();
}

class _ListaState extends State<Lista>
{
  @override
  Widget build(BuildContext context)
  {
    final items = widget.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
        backgroundColor: Colors.lightGreen,
      ),
      body: items.isEmpty ? Center(
        child: Text("Lista vasia", 
          style: TextStyle(
            color: Colors.red
            ),
          ),
        ) : 
      Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context,index)
            {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.production_quantity_limits_outlined),
                  title: Text(items[index].producto),
                  subtitle: Column(
                    children: [
                      Text("precio: \$" + items[index].precio),
                      Text("Descripcion: " + items[index].Descripcion),
                    ],
                  ),
                  trailing: IconButton(
                    color: Colors.red ,
                    onPressed: (){
                      setState(() {
                        items.removeAt(index);
                      });
                    }, 
                    icon: Icon(Icons.delete)),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}