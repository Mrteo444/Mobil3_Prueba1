import 'package:flutter/material.dart';
import 'package:prueba/page/Ejercicio3.dart';

void main() {
  runApp(Ejercicio2());
}

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;
  final TextEditingController _haltura = TextEditingController();
  final TextEditingController _tiempo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Cuerpo(), Ejercicio3()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.headphones), label: "Ejercicio 1"),
          BottomNavigationBarItem(icon: Icon(Icons.add_link), label: "Ejercicio 2")
        ],
      ),
    );
  }

  Widget Cuerpo() {
    return Column(
      children: <Widget>[
        Text("Ejercicio 2"),
        Campo(),
        boton1(),
      ],
    );
  }

  Widget Campo() {
    return Stack(
     // fit: StackFit.expand,
      children: [
        Image.asset(
           "assets/image/depositphotos_113092424-stock-illustration-planet-space-2.jpg",
          fit: BoxFit.cover,
         ),
        Column(
          children: [
            TextField(
              controller: _haltura,
              decoration: InputDecoration(hintText: "Ingrese H "),
            ),
            TextField(
              controller: _tiempo,
              decoration: InputDecoration(hintText: "Ingrese t"),
            ),
          ],
        ),
      ],
    );
  }

  Widget boton1() {
    return ElevatedButton(
      onPressed: () {
        alerta(context);
      },
      child: Text("Calcular"),
    );
  }

  String calcular() {
    double altura = double.tryParse(_haltura.text) ?? 0.0;
    double tiempo = double.tryParse(_tiempo.text) ?? 0.0;
    double alturaFinal = altura + (0.5 * 20 * tiempo * tiempo);

    if (alturaFinal >= 1000) {
      return "El lanzamiento fue exitoso: $alturaFinal m";
    } else {
      return "El lanzamiento ha fallado: $alturaFinal m";
    }
  }

  void alerta(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Respuesta"),
          content: Text("El resultado es ${calcular()}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Salir"),
            ),
          ],
        );
      },
    );
  }
}
