import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:mundo_preescolar/db/db.dart';
import 'package:mundo_preescolar/db/user.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class SplashController extends ChangeNotifier {
  String? _routeName;
  String? get routeName => _routeName;
  Usuario _usuario = Usuario(id: 0);
  //Usuario get usuario => _usuario;

  Future<void> comprobarBD() async {
    _routeName = await DB.databaseExists() ? Rutas.HOME : Rutas.REGISTER;
    notifyListeners();
  }

  Future<Usuario> obtenerUsuario() async {
    if (await DB.databaseExists()) {
      List<Usuario> listUsuario = await DB.select();
      return _usuario = listUsuario[0];
    }
    return _usuario;
  }
}
