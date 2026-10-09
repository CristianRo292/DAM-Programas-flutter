import 'package:flutter/material.dart';
import 'package:pre_examen_p7/widget/pre_examen_v1.dart';

class ventana_secundaria extends StatefulWidget
{
  const ventana_secundaria({super.key});

  @override
  State<StatefulWidget> createState()
  {
    return Cont_ventana();
  }
}

class Cont_ventana extends State<ventana_secundaria>
{
  // espacio para variables

  final TextEditingController entrada = TextEditingController();

  String r = "";
  // espacio para metodos

  void validar_datos()
  {
    final int tempVal = int.tryParse(entrada.text) ?? -1;
    setState(() {
      print("Salida AQUIIIIIII${entrada.text}");
      
      if (entrada.text != "")
      {
        
        if (tempVal != -1)
        {
          r = "Es Numero";
          
          notificaciones(tituloNot:"Validado", mensajeNot:"El campo no esta basio 😉", modalidad:  1, datosEnt:  entrada.text);

          
        }
        else
        {
          r = "No esta basio";
          notificaciones(tituloNot:"Validado",mensajeNot:"El campo no esta basio 😉");
          
        }
        
        return;
      }
      r = "Esta basia";
      
    });
    
  }

  // metodo para cambiar de vetana
  void cambiar_ventana({String datosEnviar = ""})
  {
    print("entramos al metodo para cambiar de ventana");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ventana1_pre_examen(datosResividosNumero: datosEnviar),
        )
      );
      // return;
  }


  void notificaciones({String tituloNot = "Alerta", String mensajeNot = "Error", int modalidad = 0, String datosEnt = ""})
  {
    showDialog( // ventana emergente, o notificacion
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(tituloNot,
          style: TextStyle(
            fontSize: 15,
            color: const Color.fromARGB(252, 255, 3, 3),
            ),
          ),
          content: Text(mensajeNot,
          style: TextStyle(
            fontSize: 10,
            color: Colors.black
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
                if (modalidad == 1)
                {
                  cambiar_ventana(datosEnviar: datosEnt);
                }
                
              }, 
              child: Text("Acepatar")
              )
          ],
        );
      }
    );
  }

  // diseño grafico
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 218, 172),
      appBar: AppBar(
        title: Text("Pre Examen" , 
          style: TextStyle(
            color: Colors.white,
          ),/*aqui puedes agregar los estilos para el texto*/),
        backgroundColor: const Color.fromARGB(255, 142, 131, 38),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: 
            Container(
              padding: EdgeInsets.all(20),
              child: Card(
              
                // padding: EdgeInsets.all(20),
                // width: double.infinity,
                // height: double.infinity,
                child: 
                Column(
                  children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: entrada,
                          decoration: 
                            InputDecoration(
                              labelText: "Escribe un texto",
                              border: OutlineInputBorder()
                            ),
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.add),
                        onPressed: validar_datos, 
                        label: Text("Validar")),
                    
                  ],
                ),
    
              ),
            ),
            
          ),
          // SizedBox(height: 50,),

          Expanded(
            child: 
            Container(
            
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: 
              Center(
                child: Text(
                  r,
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: "Comic Sans MS",
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                )
              ),
            ),
            
          )
        ],
      ),
    );
  }

  
}