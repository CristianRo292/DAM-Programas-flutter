import 'package:flutter/material.dart';
import 'package:practica3_parcial3/widget/pagina1.dart';

class Pagina3 extends StatefulWidget
{
  const Pagina3({super.key});
  @override
  State<StatefulWidget> createState()
  {
    return ContVentana();
  }
}

class ContVentana extends State<Pagina3>
{
  final _keyForm = GlobalKey<FormState>();
//  TextEditingController presioCtr = TextEditingController();

  void _snackbarNot({String contenido = "Error"})
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(contenido),
          behavior: SnackBarBehavior.floating,
          )
      );
  }

  // void _vPresio()
  // {
  //   String presioStr = presioCtr.text;

  //   if (!RegExp(r'^\$?\d+(\.\d+)?$').hasMatch(presioStr))
  //   {
  //     _snackbarNot(contenido: "Presio no valido");
  //     return;
  //   }
  //   _snackbarNot(contenido: "Presio SI 😀 Valido");
  // }
  String ? _VPresio(String ? valor)
  {
    if (valor == null || valor.isEmpty)
    {
      return 'Ingresa el Presio';
    }
    if (!RegExp(r'^\$?\d+(\.\d+)?$').hasMatch(valor))
    {
      // _snackbarNot(contenido: "Correo no valido");
      return "Ingrese un Presio valido";
    }
    return null;

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
            Expanded(child: Center(child: Text("Validar Precio", style: vEncabezados(sizeTex: 40),))),
            Expanded(
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          validator: _VPresio,
                        // controller: presioCtr,
                        decoration: InputDecoration(
                          labelText: "Escribe el Presio",
                          hintText: "Ingresa el Presio",
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
                          onPressed: ()
                          {
                            if (_keyForm.currentState?.validate() ?? false)
                            {

                            }
                            else 
                            {
                              _snackbarNot(contenido: "Ingresa los datos correctos");
                            }
                          }, 
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
            ),
            
          ],
        ),
      ),
    );
  }
}