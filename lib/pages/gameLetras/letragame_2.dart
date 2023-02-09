import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';
import 'package:mundo_preescolar/widgets/scoreboard.dart';

int level = 6;

class Letra2 extends StatefulWidget {
  final int size;
  const Letra2({Key? key, this.size = 6}) : super(key: key);

  @override
  State<Letra2> createState() => _Letra2State();
}

class _Letra2State extends State<Letra2> {
  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];
  List<String> emojis = ["A", "E", "I", "O", "U", "B", "C", "D", "F", "G"];
  int previousIndex = -1;
  bool flip = false;

  int time = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(emojis[i]);
    }
    for (var i = 0; i < widget.size ~/ 2; i++) {
      data.add(emojis[i]);
    }
    startTimer();
    data.shuffle();
  }

  startTimer() {
    if (!mounted) {
      timer.cancel();
    } else {
      setState(() {});
    }
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        timer.cancel();
      } else {
        setState(() {
          time = time + 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Memorama",
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
      backgroundColor: Colors.green[200],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                scoreBoard("Tiempo", "$time"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) => FlipCard(
                  key: cardStateKeys[index],
                  speed: 0,
                  onFlip: () {
                    if (!flip) {
                      flip = true;
                      previousIndex = index;
                    } else {
                      flip = false;
                      //Previo y Ultimo son distintos Cards
                      if (previousIndex != index) {
                        //Previo y Ultimo tienen distintos Números
                        if (data[previousIndex] != data[index]) {
                          cardStateKeys[previousIndex]
                              .currentState
                              ?.toggleCard();
                          previousIndex = index;
                        } else if (data[previousIndex] == data[index]) {
                          cardFlips[previousIndex] = false;
                          cardFlips[index] = false;
                          if (cardFlips.every((t) => t == false)) {
                            //Exito
                            showResult(args.usuario);
                          }
                        }
                      }
                    }
                  },
                  direction: FlipDirection.HORIZONTAL,
                  flipOnTouch: cardFlips[index],
                  front: Container(
                    margin: const EdgeInsets.all(4.0),
                    color: Colors.deepOrange.withOpacity(0.3),
                  ),
                  back: Container(
                    margin: const EdgeInsets.all(4.0),
                    color: Colors.deepOrange,
                    child: Center(
                      child: Text(
                        data[index],
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showResult(Usuario user) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("¡Ganaste!"),
        content: Text(
          "Tiempo: $time",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => Letra2(
                    size: level,
                  ),
                  settings: RouteSettings(
                    arguments: ScreenArguments(usuario: user),
                  ),
                ),
                (e) => false,
              );
              level <= 18 ? level += 2 : level = level;
            },
            child: const Text("Reintentar"),
          ),
        ],
      ),
    );
  }
}
