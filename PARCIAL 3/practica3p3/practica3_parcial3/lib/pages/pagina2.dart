import 'package:flutter/material.dart';
import 'package:practica3_parcial3/widget/pagina1.dart';

class Pagina2 extends StatefulWidget
{
  const Pagina2({super.key});
  @override
  State<StatefulWidget> createState()
  {
    return ContVentana();
  }
}

class ContVentana extends State<Pagina2>
{
  TextEditingController correoCtr = TextEditingController();

  void _snackbarNot({String contenido = "Error"})
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(contenido),
          behavior: SnackBarBehavior.floating,
          )
      );
  }

  void _vCorreo()
  {
    String correoStr = correoCtr.text;

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(correoStr))
    {
      _snackbarNot(contenido: "Correo no valido");
      return;
    }
    _snackbarNot(contenido: "Correo SI 😀 Valido");
  }

  @override
  Widget build(BuildContext contex)
  {
    return Scaffold(
      body: Card(
        elevation: 12,
        color: const Color.fromARGB(255, 223, 245, 224),
        child: Column(
          children: [
            Expanded(child: Center(child: Text("Validar Correo", style: vEncabezados(sizeTex: 40),))),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: TextField(
                      controller: correoCtr,
                      decoration: InputDecoration(
                        labelText: "Escribe el Correo",
                        hintText: "Ingresa el Correo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _vCorreo, 
                        child: Text("Validar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          foregroundColor: Colors.white
                        ) ,
                      ),
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}