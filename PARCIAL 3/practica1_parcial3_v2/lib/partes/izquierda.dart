import 'package:flutter/material.dart';
import 'package:practica1_parcial3_v2/widget/inicio.dart';

class Izquierda extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return Parte();
  }
}

class Parte extends State<Izquierda>
{
  TextEditingController ctrTelefono = TextEditingController();
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

  void _vTelefono()
  {
    String TelefonoStr = ctrTelefono.text;

    if (!RegExp(r"^\+52\d{10}$").hasMatch(TelefonoStr))
    {
      _snackbarNot(contenido: "Telefono no valido");
      return;
    }
    _snackbarNot(contenido: "Telefono SI 😀 Valido");
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
            Expanded(child: Center(child: Text("Validar Telefono", style: vEncabezados(sizeTex: 40),))),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: TextField(
                      controller: ctrTelefono,
                      decoration: InputDecoration(
                        labelText: "Escribe el Telefono",
                        hintText: "Ingresa el telefono, empezando con +52",
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
                        onPressed: _vTelefono, 
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