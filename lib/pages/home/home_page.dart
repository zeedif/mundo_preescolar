import 'package:flutter/material.dart';
import 'package:mundo_preescolar/db/db.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/pages/home/home_controller.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  void _irAlSelect(Usuario user, int i) {
    Navigator.pushReplacementNamed(context, Rutas.SELECT,
        arguments: ScreenArguments(usuario: user, i: i));
  }

  @override
  Widget build(BuildContext context) {
    //Usuario? usuario = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Usuario;
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    Color tema = Colors.black;
    String saludo = '';
    if (args.usuario.genre == 'Niño') {
      tema = Colors.teal;
      saludo = 'Bienvenido ${args.usuario.name}';
    } else {
      tema = Colors.pink;
      saludo = 'Bienvenida ${args.usuario.name}';
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: tema,
        title: Center(
          child: Text(
            saludo,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Advertencia"),
              content:
                  const Text("¿Esta seguro qué quiere eliminar sus datos?"),
              actions: [
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    DB.deleteBD();
                    Navigator.pushReplacementNamed(context, Rutas.SPLASH);
                  },
                  child: const Text("Aceptar"),
                ),
              ],
            ),
          );
        },
        backgroundColor: Colors.red,
        label: const Text(
          "Eliminar",
          style: TextStyle(fontSize: 20),
        ),
        icon: const Icon(
          Icons.delete,
          size: 20,
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/pageHome.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction:
              _controller.isPortrait(context) ? Axis.vertical : Axis.horizontal,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                _irAlSelect(args.usuario, 1);
              },
              color: Colors.lightBlue,
              height: 60,
              minWidth: _controller.minWidth(context),
              child: const Text(
                'Números',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
              width: 80,
            ),
            MaterialButton(
              onPressed: () {
                _irAlSelect(args.usuario, 2);
              },
              color: Colors.purple,
              height: 60,
              minWidth: _controller.minWidth(context),
              child: const Text(
                'Letras',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
              width: 80,
            ),
            MaterialButton(
              onPressed: () {
                _irAlSelect(args.usuario, 3);
              },
              color: Colors.green,
              height: 60,
              minWidth: _controller.minWidth(context),
              child: const Text(
                'Colores',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
