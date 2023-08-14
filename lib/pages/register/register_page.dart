import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mundo_preescolar/pages/register/register_controller.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/pageRegister.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              color: const Color.fromARGB(204, 255, 255, 255),
              child: ListView(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: const Text(
                        'Mundo Preescolar',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: TextField(
                      controller: _controller.nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Escribe tu nombre...',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: DropdownButton<String>(
                      icon: const Icon(Icons.arrow_downward),
                      hint: _controller.dropDownValue == ''
                          ? const Text('Seleccione el género...')
                          : Text(
                              _controller.dropDownValue,
                              style: const TextStyle(color: Colors.teal),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      elevation: 4,
                      onChanged: (String? newValue) {
                        setState(() {
                          _controller.dropDownValue = newValue!;
                        });
                      },
                      items: <String>['Niña', 'Niño']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        onPressed: () => exit(0),
                        color: Colors.red,
                        shape: const StadiumBorder(),
                        height: 45,
                        minWidth: MediaQuery.of(context).size.width * 0.28,
                        child: const Text(
                          "Salir",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () async {
                          bool correcto = _controller.generarMap();
                          correcto
                              ? Navigator.pushReplacementNamed(
                                  context, Rutas.SPLASH)
                              : showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text("Advertencia"),
                                    content: const Text(
                                        "Por favor escribe tu nombre y selecciona tu género."),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Aceptar"),
                                      ),
                                    ],
                                  ),
                                );
                        },
                        color: Colors.green,
                        shape: const StadiumBorder(),
                        height: 45,
                        minWidth: MediaQuery.of(context).size.width * 0.28,
                        child: const Text(
                          "Continuar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
