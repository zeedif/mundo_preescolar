import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:mundo_preescolar/db/db.dart';
import 'package:mundo_preescolar/db/user.dart';

class SplashController extends SimpleNotifier {
  Future<Usuario?> obtenerUsuario() async {
    try {
      final listUsuario = await DB.select();
      if (listUsuario.isNotEmpty) {
        return listUsuario[0];
      }
    } catch (e) {
      debugPrint("Error al obtener usuario: $e");
    }
    return null;
  }
}

// final splashProvider = SimpleProvider(
//   (_) => SplashController(),
// );
