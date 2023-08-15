import 'package:flutter_meedu/meedu.dart';
import 'package:mundo_preescolar/db/db.dart';
import 'package:mundo_preescolar/db/user.dart';

class RegistrationController extends SimpleNotifier {
  String name = '';
  String dropDownValue = '';

  void updateName(String newName) {
    name = newName;
    notify();
  }

  void updateDropDownValue(String newValue) {
    dropDownValue = newValue;
    notify();
  }

  bool generarMap() {
    if (name.isNotEmpty && dropDownValue != '') {
      DB.insert(Usuario(name: name, genre: dropDownValue, score: 0));
      return true;
    }
    return false;
  }
}

final registrationProvider = SimpleProvider(
  (_) => RegistrationController(),
);
