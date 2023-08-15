import 'package:flutter/material.dart';
import 'package:mundo_preescolar/pages/select/select_controller.dart';
import 'package:mundo_preescolar/pages/select/widgets/level_button.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final controller = selectProvider.read;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(args),
      floatingActionButton: _buildFloatingActionButton(context, args),
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
            Padding(
              padding: controller.isPortrait(context)
                  ? const EdgeInsets.only(top: 18)
                  : const EdgeInsets.only(top: 40),
              child: const Text(
                "¡Elige el nivel!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Flex(
                mainAxisAlignment: MainAxisAlignment.center,
                direction: controller.isPortrait(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                children: [
                  for (int j = 1; j <= 3; j++)
                    Expanded(
                      child: LevelButton(
                        args: args,
                        level: j,
                      ),
                    ),
                  SizedBox(height: controller.isPortrait(context) ? 44 : 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(ScreenArguments args) {
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
    return AppBar(
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
    );
  }

  FloatingActionButton _buildFloatingActionButton(
      BuildContext context, ScreenArguments args) {
    Color tema = Colors.black;
    switch (args.i) {
      case 1:
        tema = Colors.lightBlue;
        break;
      case 2:
        tema = Colors.purple;
        break;
      case 3:
        tema = Colors.green;
        break;
    }
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushReplacementNamed(context, Rutas.HOME,
            arguments: ScreenArguments(usuario: args.usuario));
      },
      backgroundColor: tema,
      label: const Text(
        "Volver",
        style: TextStyle(fontSize: 20),
      ),
      icon: const Icon(Icons.keyboard_return, size: 20),
    );
  }
}
