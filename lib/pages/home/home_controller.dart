import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:mundo_preescolar/db/db.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class HomeController extends SimpleNotifier {
  // late final Database _db;
  HomeController() {
    _init();
  }

  Future<void> _init() async {
    // _db = await DB.initDB();
  }

  Future<void> navegarASplash() async {
    DB.deleteBD();
    router.pushReplacementNamed(Rutas.SPLASH);
  }

  Future<void> navegarASelect(Usuario user, int index) async {
    router.pushReplacementNamed(Rutas.SELECT,
        arguments: ScreenArguments(usuario: user, i: index));
  }

  Future<Usuario> obtenerUsuario() async {
    final listUsuario = await DB.select();
    return listUsuario[0];
  }

  double minWidth(BuildContext context) {
    double width;
    isPortrait(context)
        ? width = MediaQuery.of(context).size.width / 2
        : width = (MediaQuery.of(context).size.width - 80 - 80 - 80) / 3;
    return width;
  }

  bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}

final homeProvider = SimpleProvider(
  (_) => HomeController(),
  autoDispose: false,
);
