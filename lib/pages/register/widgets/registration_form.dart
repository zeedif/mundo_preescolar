import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:mundo_preescolar/pages/register/register_controller.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegistrationController>(
      provider: registrationProvider,
      builder: (_, controller) {
        return ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            const Text(
              'Mundo Preescolar',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (String newName) => controller.updateName(newName),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe tu nombre...',
              ),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              icon: const Icon(Icons.arrow_downward),
              hint: Consumer(
                builder: (_, ref, __) {
                  final value = ref.watch(
                    registrationProvider.select((_) => _.dropDownValue),
                  );
                  return value.dropDownValue == ''
                      ? const Text('Seleccione el género...')
                      : Text(
                          value.dropDownValue,
                          style: const TextStyle(color: Colors.teal),
                        );
                },
              ),
              isExpanded: true,
              iconSize: 30.0,
              elevation: 4,
              onChanged: (String? newValue) =>
                  controller.updateDropDownValue(newValue!),
              items: <String>['Niña', 'Niño'].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 10),
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
                Consumer(builder: (_, ref, __) {
                  final controller = ref.watch(registrationProvider.select(
                    (_) => _.generarMap(),
                  ));
                  return MaterialButton(
                    onPressed: () async {
                      bool correcto = controller.generarMap();

                      if (correcto) {
                        router.pushReplacementNamed(Rutas.SPLASH);
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Advertencia"),
                            content: const Text(
                              "Por favor escribe tu nombre y selecciona tu género.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Aceptar"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    color: controller.generarMap() == true
                        ? Colors.green
                        : Colors.grey,
                    shape: const StadiumBorder(),
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width * 0.28,
                    child: const Text(
                      "Continuar",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
              ],
            ),
          ],
        );
      },
    );
  }
}
