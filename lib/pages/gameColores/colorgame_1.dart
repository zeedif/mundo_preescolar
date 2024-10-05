import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';
import 'package:mundo_preescolar/utils/autoscroll.dart';

class Color1 extends StatefulWidget {
  const Color1({super.key});

  @override
  State<Color1> createState() => _Color1State();
}

class _Color1State extends State<Color1> {
  final Map<String, bool> score = {};
  final Map<String, Color> choises = {
    '🍎': Colors.red,
    '🍐': Colors.green,
    '💙': Colors.blue,
    '🍌': Colors.yellow,
    '🍊': Colors.orange,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
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
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/pageRegister.png"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Columna de elementos para arrastrar
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
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
              // Columna de destinos de arrastre
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: choises.keys.map((element) {
                  return buildTarget(element);
                }).toList()
                  ..shuffle(Random(index)),
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
              color: choises[emoji]!.withOpacity(0.3),
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
              color: choises[emoji],
              height: 80,
              width: 200,
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
