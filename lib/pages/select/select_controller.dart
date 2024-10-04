import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class SelectController extends SimpleNotifier {
  // double minWidth(BuildContext context) {
  //   double width;
  //   isPortrait(context)
  //       ? width = MediaQuery.of(context).size.width / 2
  //       : width = (MediaQuery.of(context).size.width - 80 - 80 - 80) / 3;
  //   return width;
  // }

  void navegarANivel(BuildContext context, Usuario user, int i, int j) {
    String ruta = '';
    switch (i) {
      // Nivel de numeros
      case 1:
        ruta = j == 1
            ? Rutas.JugarNum1
            : j == 2
                ? Rutas.JugarNum2
                : Rutas.JugarNum3;
        break;
      // Nivel de letras
      case 2:
        ruta = j == 1
            ? Rutas.JugarLet1
            : j == 2
                ? Rutas.JugarLet2
                : Rutas.JugarLet3;
        break;
      // Nivel de colores
      case 3:
        ruta = j == 1
            ? Rutas.JugarCol1
            : j == 2
                ? Rutas.JugarCol2
                : Rutas.JugarCol3;
        break;
    }
    router.pushReplacementNamed(ruta,
        arguments: ScreenArguments(usuario: user));
  }

  bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  double getButtonSize(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;
    int numberOfButtons = 3;

    // Si estamos en orientación vertical, dividimos el ancho disponible por el número de botones
    if (isPortrait(context)) {
      return availableWidth / numberOfButtons;
    }

    // Si estamos en orientación horizontal, ajustamos el ancho disponible para los botones
    double minWidth = 80; // Ancho mínimo de cada botón
    double totalMinWidth =
        minWidth * numberOfButtons; // Ancho total de los botones
    double spaceBetweenButtons =
        30 * (numberOfButtons - 0.1); // Espacio entre botones

    double remainingWidth =
        availableWidth - totalMinWidth - spaceBetweenButtons;
    return (remainingWidth / numberOfButtons).clamp(minWidth, double.infinity);
  }
}

final selectProvider = SimpleProvider(
  (_) => SelectController(),
);
