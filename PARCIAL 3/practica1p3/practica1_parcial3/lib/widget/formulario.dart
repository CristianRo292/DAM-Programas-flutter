import 'package:flutter/material.dart';

class Formulario extends StatefulWidget
{
  const Formulario({super.key});

  @override
  State<StatefulWidget> createState()
  {
    return Disenio();
  }
}

class Disenio extends State<Formulario>
{
  final _keyForm = GlobalKey<FormState>();

  String ? _ValidarNombre(String ? valor)
  {
    if (valor == null || valor.isEmpty)
    {
      return 'Ingresa la edad';
    }
    final expresion = RegExp(r'^[a-zA-Z ]+$');
    if (!expresion.hasMatch(valor))
    {
      return "ingresa un dato numerico";
    }
    return null;
  }

  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Validaciones"),
        backgroundColor: const Color.fromARGB(255, 166, 212, 250),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key:  _keyForm, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // aliniacion del texto
            children: [
              TextFormField( // son cajas de texto que nos permite tener validaciones
                validator: _ValidarNombre,
                decoration: InputDecoration(
                    labelText: "Nombre",
                    hintText: "Ingresa un nombre",
                    border: OutlineInputBorder()
                  )
              ),
              SizedBox(height: 8,),
              TextFormField(
                validator: (valor)
                {
                  if (valor == null || valor.isEmpty)
                  {
                    return 'Ingresa la edad';
                  }
                  final expresion = RegExp(r'^[0-9]+$');
                  if (!expresion.hasMatch(valor))
                  {
                    return "ingresa un dato numerico";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Edad",
                    hintText: "Ingresa la Edad",
                    border: OutlineInputBorder()
                  )
              ),
              SizedBox(height: 8,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()
                  {
                    if (_keyForm.currentState?.validate() ?? false)
                    {
                
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Ingresa los datos correctos"))
                      );
                    }
                  }, 
                  child: Text("Aceptar")
                  ),
              )
            ],
          )
        ),
      ),
    );
  }
}
