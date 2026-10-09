import 'package:flutter/material.dart';

class ventana1_pre_examen extends StatefulWidget
{
  // se declaran las variables globales 
  final String datosResividosNumero;
  // obligamos al programa a resivir las variables al arracar 😡
  const ventana1_pre_examen({super.key, required this.datosResividosNumero});
  @override
  State<StatefulWidget> createState()
  {
    return Cont_ventana();
  }
}

class Cont_ventana extends State<ventana1_pre_examen>
{
  // espacio para variables

  String datResivido = "";
  @override
  void initState() // metodo que se ejectua al erracnar este programa
  {
    // TODO: implement initState
    super.initState();
    datResivido = widget.datosResividosNumero; // cargamos la variable que se insetamos al programa antes de arracnar
  }

  String r = "";
  // espacio para metodos

  
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
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity, // las columnas permiten hijos
        child: 
          Center(
            child: Text(datResivido,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),)
            )
      ),
    );
  }

  
}