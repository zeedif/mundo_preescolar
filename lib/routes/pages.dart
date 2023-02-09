import 'package:flutter/widgets.dart';
import 'package:mundo_preescolar/pages/gameColores/colorgame_1.dart';
import 'package:mundo_preescolar/pages/gameColores/colorgame_2.dart';
import 'package:mundo_preescolar/pages/gameColores/colorgame_3.dart';
import 'package:mundo_preescolar/pages/gameLetras/letragame_1.dart';
import 'package:mundo_preescolar/pages/gameLetras/letragame_2.dart';
import 'package:mundo_preescolar/pages/gameLetras/letragame_3.dart';
import 'package:mundo_preescolar/pages/gameNumeros/numerogame_1.dart';
import 'package:mundo_preescolar/pages/gameNumeros/numerogame_2.dart';
import 'package:mundo_preescolar/pages/gameNumeros/numerogame_3.dart';
import 'package:mundo_preescolar/pages/select/select_page.dart';
import 'package:mundo_preescolar/pages/register/register_page.dart';
import 'package:mundo_preescolar/pages/splash/splash_page.dart';
import 'package:mundo_preescolar/pages/home/home_page.dart';
import 'package:mundo_preescolar/routes/routes.dart';

Map<String, Widget Function(BuildContext)> appRutas() {
  return{
    Rutas.SPLASH: (_) => const SplashPage(),
    Rutas.HOME: (_) => const HomePage(),
    Rutas.REGISTER: (_) => const RegisterPage(),
    Rutas.SELECT: (_) => const SelectPage(),
    Rutas.JugarNum1: (_) => const Numero1(),
    Rutas.JugarNum2: (_) => const Numero2(),
    Rutas.JugarNum3: (_) => const Numero3(),
    Rutas.JugarLet1: (_) => const Letra1(),
    Rutas.JugarLet2: (_) => const Letra2(),
    Rutas.JugarLet3: (_) => const Letra3(),
    Rutas.JugarCol1: (_) => const Color1(),
    Rutas.JugarCol2: (_) => const Color2(),
    Rutas.JugarCol3: (_) => const Color3(),
  };
}