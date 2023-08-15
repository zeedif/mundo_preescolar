import 'package:flutter/material.dart';
import 'package:mundo_preescolar/pages/register/widgets/registration_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  // final _controller = RegisterController();

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
              color: Colors.white.withOpacity(0.8),
              child: const RegistrationForm(),
            ),
          ),
        ),
      ),
    );
  }
}
