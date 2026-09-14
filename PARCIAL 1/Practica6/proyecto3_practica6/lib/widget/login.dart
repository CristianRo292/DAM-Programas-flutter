import 'package:flutter/material.dart';
import 'package:proyecto3_practica6/widget/acceso.dart';

class login extends StatefulWidget
{
  @override 
  State<StatefulWidget> createState()
  {
    return Clase();
  }
}

class Clase extends State<login>
{
  final TextEditingController usuario = new TextEditingController();
  final TextEditingController passoware = new TextEditingController();

  void validar()
  {
    String usuario_val = usuario.text;
    String pasware_val = passoware.text;

    setState(() {
      if(usuario_val == "admin" && pasware_val == "12345")
      {
        // Alertas("Datos correctos", "Bienvenidos");
        Navigator.push( // esto nos permite regresar
        // Navigator.pushReplacement( // esta no me permite regresar
          context, 
          MaterialPageRoute(
            builder: (context) => acceso(dato : usuario_val, dato_pas : pasware_val),
            )
          );
        return;
      }
      Alertas("Error", "Datos Incorrectos");
      usuario.clear();
      passoware.clear();
      

    });
    

  }

  void Alertas(String titulo, String  mensaje_A)
  {
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(titulo, 
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 255, 3, 3),
              ),
            ),
          content: Text(mensaje_A,
            style: TextStyle(
              fontSize: 10,
              color: const Color.fromARGB(255, 0, 34, 61),
              ),
            ),
          actions: [
            TextButton(
              onPressed: ()
              {
                Navigator.of(context).pop();
              }, 
              child: Text("Acepatar"),
              )
            ],
          );
        }
      );
  }

  @override 
  Widget build (BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 240, 172) ,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 155, 133, 26),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Ingresa los datos",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      ),
                    ),
                  SizedBox(height: 10),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                      ),
                      child: ClipOval(
                        child: Image.asset("assets/usuario.png"),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      child: TextField(
                        controller: usuario,
                        decoration: InputDecoration(
                          labelText: "Escribe el Usuario",
                          hintText: "Ingresa el Usuario",
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
                        controller: passoware,
                        decoration: InputDecoration(
                          labelText: "Escribe el Passoware",
                          hintText: "Ingresa el Usuario",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          ),
                        )
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: validar, 
                          label: Text("Aceptar",
                            style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 2, 146, 190),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}