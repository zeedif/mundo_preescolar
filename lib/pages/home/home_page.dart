import 'package:flutter/material.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/pages/home/home_controller.dart';
import 'package:mundo_preescolar/pages/home/widgets/select_button.dart';
import 'package:mundo_preescolar/routes/arguments.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(args.usuario),
      floatingActionButton: _buildDeleteButton(context),
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
          direction: homeProvider.read.isPortrait(context)
              ? Axis.vertical
              : Axis.horizontal,
          children: <Widget>[
            SelectButton(
              args: args,
              index: 1,
              color: Colors.lightBlue,
              text: 'Numeros',
            ),
            const SizedBox(
              height: 30,
              width: 80,
            ),
            SelectButton(
              args: args,
              index: 2,
              color: Colors.purple,
              text: 'Letras',
            ),
            const SizedBox(
              height: 30,
              width: 80,
            ),
            SelectButton(
              args: args,
              index: 3,
              color: Colors.green,
              text: 'Colores',
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(Usuario user) {
    Color themeColor = user.genre == 'Niño' ? Colors.teal : Colors.pink;
    String greeting = user.genre == 'Niño'
        ? 'Bienvenido ${user.name}'
        : 'Bienvenida ${user.name}';
    return AppBar(
      backgroundColor: themeColor,
      title: Center(
        child: Text(
          greeting,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  FloatingActionButton _buildDeleteButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Advertencia"),
            content: const Text("¿Esta seguro qué quiere eliminar sus datos?"),
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
                  homeProvider.read.navegarASplash();
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
    );
  }
}
