import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';
import 'package:mundo_preescolar/utils/autoscroll.dart';

class Numero1 extends StatefulWidget {
  const Numero1({super.key});

  @override
  State<Numero1> createState() => _Numero1State();
}

class _Numero1State extends State<Numero1> {
  final Map<String, bool> score = {};
  final Map<String, String> choises = {
    '0': "CERO",
    '1': "UNO",
    '2': "DOS",
    '3': "TRES",
    '4': "CUATRO",
    '5': "CINCO",
    '6': "SEIS",
    '7': "SIETE",
    '8': "OCHO",
    '9': "NUEVE",
  };
  int index = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            "Puntaje: ${score.length}/7",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "reiniciarButton",
            onPressed: () {
              setState(() {
                score.clear();
                index++;
              });
            },
            backgroundColor: Colors.green,
            label: const Text(
              "Reiniciar",
              style: TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.refresh, size: 20),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: "volverButton",
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                Rutas.HOME,
                arguments: ScreenArguments(usuario: args.usuario),
              );
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
      body: Container(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Arrastra y suelta los números al lugar correcto",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Columna de números para arrastrar
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: choises.keys.map((element) {
                      return Draggable<String>(
                        data: element,
                        feedback: Movable(emoji: element),
                        childWhenDragging: const Movable(emoji: ''),
                        child: Movable(
                          emoji: score[element] == true ? '✔️' : element,
                        ),
                        onDragUpdate: (details) {
                          autoScroll(
                            scrollController: _scrollController,
                            globalPosition: details.globalPosition,
                            screenSize: MediaQuery.of(context).size,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  // Espacio entre las dos columnas
                  const SizedBox(width: 20),
                  // Columna de destinos de arrastre
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: choises.keys.map((element) {
                      return buildTarget(element);
                    }).toList()
                      ..shuffle(Random(index)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTarget(String emoji) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: DragTarget<String>(
        builder: (context, candidateData, rejectedData) {
          if (score[emoji] == true) {
            return Container(
              color: Colors.blue.shade300.withOpacity(0.3),
              alignment: Alignment.center,
              height: 80,
              width: 200,
              child: Text(
                "¡Correcto!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          } else {
            return Container(
              color: Colors.blue.shade300,
              alignment: Alignment.center,
              height: 80,
              width: 200,
              child: Text(
                choises[emoji].toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }
        },
        onWillAccept: (data) => data == emoji,
        onAccept: (data) {
          setState(() {
            score[emoji] = true;
          });
        },
        onLeave: (data) {},
      ),
    );
  }
}

class Movable extends StatelessWidget {
  const Movable({super.key, required this.emoji});
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 81,
        padding: const EdgeInsets.all(10),
        child: Text(emoji, style: Theme.of(context).textTheme.displaySmall),
      ),
    );
  }
}
