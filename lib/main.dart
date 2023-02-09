import 'package:flutter/material.dart';
import 'package:mundo_preescolar/routes/pages.dart';
import 'package:mundo_preescolar/routes/routes.dart';

void main() {
  /*
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mundo Preescolar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
          headline2: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
          headline3: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
          headline4: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
          headline5: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
          headline6: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),
        ),
      ),
      initialRoute: Rutas.SPLASH,
      routes: appRutas(),
    );
  }
}
