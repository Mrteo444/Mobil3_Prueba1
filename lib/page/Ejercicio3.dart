import 'package:flutter/material.dart';

void main (){
  runApp(const Ejercicio3());
}

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eJERCIO3'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return(
     Column(
      children: <Widget>[ 
      Text("Ejercicio2"),
      Campo(),  
      boton1(context)
      ],
    )
  );
}

Widget Campo(){
  return Column(
    children: [
      TextField(
        controller: _velociada,
        decoration: InputDecoration(
          hintText: "Ingrese velocidad"
        ),
      ),
     
    ],
  );
}


Widget boton1(context){
  return(
    FilledButton(onPressed: (){
      alerta(context);
    }, child: Text("calcular"))

  );
}
final TextEditingController _velociada=TextEditingController();
final TextEditingController _tiempo=TextEditingController();


double calcular() {
    double velociada = double.tryParse(_velociada.text) ?? 0.0;
    double tiempo = double.tryParse(_tiempo.text) ?? 0.0;
    double total = velociada*25;
    return total;

  
  }



void alerta(context){
  showDialog(context: context, builder:
  (context){
    return(
      AlertDialog(
        title: Text("respuesta"),
        content: Text("el resultado es  ${calcular()}"),
        actions: [
          TextButton(onPressed: (){
             Navigator.pop(context);


            
          }, child: Text("salir"))
        ],
      )
  );
  });
}
