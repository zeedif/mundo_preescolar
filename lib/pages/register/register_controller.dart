import 'package:flutter/material.dart';
import 'package:mundo_preescolar/db/db.dart';
import 'package:mundo_preescolar/db/user.dart';

class RegisterController {
  TextEditingController nameController = TextEditingController();
  String dropDownValue = '';
  
  bool generarMap(){
    if(nameController.text.isNotEmpty && dropDownValue != ''){
      DB.insert(Usuario(name: nameController.text, genre: dropDownValue, score: 0));
      return true;
    }
    return false;
  }
}
