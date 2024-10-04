import 'package:flutter/material.dart';
import 'package:mundo_preescolar/pages/select/select_controller.dart';
import 'package:mundo_preescolar/routes/arguments.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    super.key,
    required this.args,
    required this.level,
  });

  final ScreenArguments args;
  final int level;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/difficulty/n0$level.png'),
      padding: const EdgeInsets.all(15),
      iconSize: selectProvider.read.getButtonSize(context),
      onPressed: () {
        selectProvider.read
            .navegarANivel(context, args.usuario, args.i!, level);
      },
    );
  }
}
