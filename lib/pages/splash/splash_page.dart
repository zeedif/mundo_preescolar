import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:mundo_preescolar/pages/splash/splash_controller.dart';
import 'package:mundo_preescolar/routes/arguments.dart';
import 'package:mundo_preescolar/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashProvider = SimpleProvider(
    (_) => SplashController(),
  );

  @override
  void initState() {
    super.initState();
    _initApp(context);
  }

  Future<void> _initApp(BuildContext context) async {
    final usuario = await splashProvider.read.obtenerUsuario();
    if (usuario != null) {
      router.pushReplacementNamed(
        Rutas.HOME,
        arguments: ScreenArguments(usuario: usuario),
      );
    } else {
      router.pushReplacementNamed(Rutas.REGISTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
