import 'package:flutter/material.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/pages/select/select_controller.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  final _controller = SelectController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    void _irAlNivel(Usuario user, int? i, int j) {
      if(i == 1){
        if(j == 1) {
          Navigator.pushReplacementNamed(context, Rutas.JugarNum1,
            arguments: ScreenArguments(usuario: user));
        }
        if(j == 2) {
          Navigator.pushReplacementNamed(context, Rutas.JugarNum2,
            arguments: ScreenArguments(usuario: user));
        }
        if(j == 3) {
          Navigator.pushReplacementNamed(context, Rutas.JugarNum3,
            arguments: ScreenArguments(usuario: user));
        }
      }
      if(i == 2){
        if(j == 1) {
          Navigator.pushReplacementNamed(context, Rutas.JugarLet1,
            arguments: ScreenArguments(usuario: user));
        }
        if(j == 2) {
          Navigator.pushReplacementNamed(context, Rutas.JugarLet2,
            arguments: ScreenArguments(usuario: user));
        }
        if(j == 3) {
          Navigator.pushReplacementNamed(context, Rutas.JugarLet3,
            arguments: ScreenArguments(usuario: user));
        }
      }
      if(i == 3){
        if(j == 1) {
          Navigator.pushReplacementNamed(context, Rutas.JugarCol1,
            arguments: ScreenArguments(usuario: user));
        }
        if(j == 2) {
          Navigator.pushReplacementNamed(context, Rutas.JugarCol2,
            arguments: ScreenArguments(usuario: user));
        }
        if(j == 3) {
          Navigator.pushReplacementNamed(context, Rutas.JugarCol3,
            arguments: ScreenArguments(usuario: user));
        }
      }
    }

    String nombreNivel = '';
    Color tema = Colors.black;
    switch (args.i) {
      case 1:
        nombreNivel = 'Números';
        tema = Colors.lightBlue;
        break;
      case 2:
        nombreNivel = 'Letras';
        tema = Colors.purple;
        break;
      case 3:
        nombreNivel = 'Colores';
        tema = Colors.green;
        break;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: tema,
        title: Center(
          child: Text(
            nombreNivel,
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
          Navigator.pushReplacementNamed(context, Rutas.HOME,
              arguments: ScreenArguments(usuario: args.usuario));
        },
        backgroundColor: tema,
        label: const Text("Volver", style: TextStyle(fontSize: 20),),
        icon: const Icon(Icons.keyboard_return, size: 20),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/pageSelect.png"),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "¡Elige el nivel!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Flex(
              mainAxisAlignment: MainAxisAlignment.center,
              direction: _controller.isPortrait(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/difficulty/n01.png'),
                  padding: const EdgeInsets.all(15),
                  iconSize: 180,
                  onPressed: () {
                    _irAlNivel(args.usuario, args.i, 1);
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/difficulty/n02.png'),
                  padding: const EdgeInsets.all(15),
                  iconSize: 180,
                  onPressed: () {
                    _irAlNivel(args.usuario, args.i, 2);
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/difficulty/n03.png'),
                  padding: const EdgeInsets.all(15),
                  iconSize: 180,
                  onPressed: () {
                    _irAlNivel(args.usuario, args.i, 3);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
