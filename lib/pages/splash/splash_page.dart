import 'package:flutter/material.dart';
import 'package:mundo_preescolar/pages/splash/splash_controller.dart';
import 'package:mundo_preescolar/routes/arguments.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = SplashController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.comprobarBD();
    });
    _controller.addListener(() async {
      if (_controller.routeName != null) {
        Navigator.pushReplacementNamed(context, _controller.routeName!,arguments: ScreenArguments(usuario: await _controller.obtenerUsuario()));
      }
    });
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
