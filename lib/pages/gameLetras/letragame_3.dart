import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class Letra3 extends StatefulWidget {
  const Letra3({Key? key}) : super(key: key);

  @override
  State<Letra3> createState() => _Letra3State();
}

class _Letra3State extends State<Letra3> {
  var play = AudioCache();
  List<String> contenido = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  List<String> sonidos = ["sounds/a.mp3","sounds/b.mp3","sounds/c.mp3","sounds/d.mp3","sounds/e.mp3","sounds/f.mp3","sounds/g.mp3","sounds/h.mp3","sounds/i.mp3","sounds/j.mp3","sounds/k.mp3","sounds/l.mp3","sounds/m.mp3","sounds/n.mp3","sounds/o.mp3","sounds/p.mp3","sounds/q.mp3","sounds/r.mp3","sounds/s.mp3","sounds/t.mp3","sounds/u.mp3","sounds/v.mp3","sounds/w.mp3","sounds/x.mp3","sounds/y.mp3","sounds/z.mp3"];
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
      backgroundColor: Colors.purple[100],
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            26,
            (index) {
              return GestureDetector(
                onTap: () {
                  play.play(sonidos[index]);
                },
                child: Container(
                  color: Colors.purple[400],
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
