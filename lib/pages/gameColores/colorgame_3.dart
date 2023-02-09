import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class Color3 extends StatefulWidget {
  const Color3({Key? key}) : super(key: key);

  @override
  State<Color3> createState() => _Color3State();
}

class _Color3State extends State<Color3> {
  var play = AudioCache();
  List<String> contenido = ["Amarillo","Ambar","Azul","Azul claro","Cian","Gris","Indigo","Lima","Marron","Morado","Naranja","Rojo","Rosado","Verde","Verde azulado","Verde claro"];
  List<String> sonidos = ["sounds/amarillo.mp3","sounds/ambar.mp3","sounds/azul.mp3","sounds/azul_claro.mp3","sounds/cian.mp3","sounds/gris.mp3","sounds/indigo.mp3","sounds/lima.mp3","sounds/marron.mp3","sounds/morado.mp3","sounds/naranja.mp3","sounds/rojo.mp3","sounds/rosado.mp3","sounds/verde.mp3","sounds/verdeazulado.mp3","sounds/verde_claro.mp3"];
  List<Color> colores = [Colors.yellow.shade400,Colors.amber.shade400,Colors.blue.shade400,Colors.lightBlue.shade400,Colors.cyan.shade400,Colors.grey.shade400,Colors.indigo.shade400,Colors.lime.shade400,Colors.brown.shade400,Colors.purple.shade400,Colors.orange.shade400,Colors.red.shade400,Colors.pink.shade400,Colors.green.shade400,Colors.teal.shade400,Colors.lightGreen.shade400];
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Repite",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Rutas.HOME,
                  arguments: ScreenArguments(usuario: args.usuario));
            },
            backgroundColor: Colors.green,
            label: const Text(
              "Volver",
              style: TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.keyboard_return, size: 20),
          ),
        ],
      ),
      backgroundColor: Colors.green[100],
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            16,
            (index) {
              return GestureDetector(
                onTap: () {
                  play.play(sonidos[index]);
                },
                child: Container(
                  color: colores[index],
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      contenido[index],
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
