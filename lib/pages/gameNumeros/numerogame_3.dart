import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class Numero3 extends StatefulWidget {
  const Numero3({super.key});

  @override
  State<Numero3> createState() => _Numero3State();
}

class _Numero3State extends State<Numero3> {
  var player = AudioPlayer();
  List<String> contenido = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List<String> sonidos = [
    "sounds/0.mp3",
    "sounds/1.mp3",
    "sounds/2.mp3",
    "sounds/3.mp3",
    "sounds/4.mp3",
    "sounds/5.mp3",
    "sounds/6.mp3",
    "sounds/7.mp3",
    "sounds/8.mp3",
    "sounds/9.mp3"
  ];
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
      backgroundColor: Colors.blue[100],
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            10,
            (index) {
              return GestureDetector(
                onTap: () {
                  player.play(AssetSource(sonidos[index]));
                },
                child: Container(
                  color: Colors.blue[400],
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      contenido[index],
                      style: Theme.of(context).textTheme.displaySmall,
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
