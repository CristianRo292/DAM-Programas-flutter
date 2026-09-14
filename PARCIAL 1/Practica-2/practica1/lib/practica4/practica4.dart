// Librerías base para construir la interfaz gráfica en Flutter
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// --- CONTENEDOR PRINCIPAL ---
// Widget con estado que gestiona los datos dinámicos de la calculadora
class OperacionesAritmeticas extends StatefulWidget
{
  @override 
  State<StatefulWidget> createState()
  {
    // Vincula la lógica de la interfaz con este widget
    return Disenio();
  }
  
}

// --- LÓGICA Y DISEÑO DE LA INTERFAZ ---
class Disenio extends State<OperacionesAritmeticas>
{
  // CAPTURA DE DATOS: Controladores para leer el texto introducido en las cajas
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 =  TextEditingController();
  
  // ESTADO: Guarda el texto que se mostrará como resultado en pantalla
  String res = "";

  @override
  Widget build(Object context)
  {
    // ESTRUCTURA BASE DE LA PANTALLA
    return Scaffold(
      backgroundColor: Colors.grey, // Fondo general
      appBar: AppBar(               // Barra superior de navegación
        title: Text("Operaciones Aritmeticas"),
        backgroundColor: const Color.fromARGB(255, 192, 214, 240),
        elevation: 10,
        shadowColor: Colors.blue,
      ),
      body: Center(
        // TARJETA CONTENEDORA: Agrupa los controles y les da sombra/bordes
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          shadowColor: const Color.fromARGB(255, 124, 176, 223),
          child: Padding(
            padding: EdgeInsetsGeometry.all(20), // Margen interno de la tarjeta
            child: Column(
              mainAxisSize: MainAxisSize.min, // La columna solo ocupa el espacio necesario
              children: [
                
                // --- CABECERA ---
                Text("Ingresa los datos",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 15,), // Espaciador vertical

                // --- ENTRADA 1: Primer número ---
                TextField(
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "Escribe un numero",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.amp_stories)
                  ),
                ),
                SizedBox(height: 15,),

                // --- ENTRADA 2: Segundo número ---
              TextField(
                controller: n2,
                decoration: InputDecoration(
                  labelText: "Escribe Otro numero",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.amp_stories)
                ),
                
              ),
              SizedBox(height: 15,),

              // --- SALIDA: Muestra el resultado actualizado ---
              Text(res,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 102, 12, 12),
                ),
                ),
                SizedBox(height: 15,),

                // --- ACCIÓN: Botón Sumar ---
                SizedBox( 
                  width: double.infinity, // Ocupa todo el ancho disponible
                 child:  ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    // Conversión segura de String a entero (si falla asigna 0)
                    final int a = int.tryParse(n1.text) ?? 0; // intenta convertira int, si no puede deja el cero
                    final int b = int.tryParse(n2.text) ?? 0;
                    
                    // setState redibuja la pantalla con el nuevo valor de 'res'
                    setState(() 
                    {
                      res = "${a + b}";
                    });
                    
                  },
                  label: Text("Sumar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 20, 133),
                    ),
                    )
                  ),
                ),
                SizedBox(height: 15,),

                // --- ACCIÓN: Botón Restar ---
                SizedBox( 
                  width: double.infinity,
                 child:  ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    final int a = int.tryParse(n1.text) ?? 0; // intenta convertira int, si no puede deja el cero
                    final int b = int.tryParse(n2.text) ?? 0;
                    setState(() 
                    {
                      res = "${a - b}";
                    });
                    
                  },
                  label: Text("Restar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 20, 133),
                    ),
                    )
                  ),
                ),
                SizedBox(height: 15,),

                // --- ACCIÓN: Botón Multiplicar ---
                SizedBox( 
                  width: double.infinity,
                 child:  ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    final int a = int.tryParse(n1.text) ?? 0; // intenta convertira int, si no puede deja el cero
                    final int b = int.tryParse(n2.text) ?? 0;
                    setState(() 
                    {
                      res = "${a * b}";
                    });
                    
                  },
                  label: Text("Multiplicar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 20, 133),
                    ),
                    )
                  ),
                ),
                SizedBox(height: 15,),

                // --- ACCIÓN: Botón Dividir ---
                SizedBox( 
                  width: double.infinity,
                 child:  ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    final int a = int.tryParse(n1.text) ?? 0; // intenta convertira int, si no puede deja el cero
                    final int b = int.tryParse(n2.text) ?? 0;
                    setState(() 
                    {
                      res = "${a / b}";
                    });
                    
                  },
                  label: Text("Dividir",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 7, 20, 133),
                    ),
                    )
                  ),
                ),

              ],
            ), 
            ),
        ),
      ),
    );
  }
}
