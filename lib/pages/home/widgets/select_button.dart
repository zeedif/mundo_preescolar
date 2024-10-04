import 'package:flutter/material.dart';
import 'package:mundo_preescolar/pages/home/home_controller.dart';
import 'package:mundo_preescolar/routes/arguments.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.args,
    required this.index,
    required this.color,
    required this.text,
  });

  final ScreenArguments args;
  final int index;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final controller = homeProvider.read;
    return MaterialButton(
      onPressed: () {
        controller.navegarASelect(args.usuario, index);
      },
      color: color,
      height: 60,
      minWidth: controller.minWidth(context),
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
