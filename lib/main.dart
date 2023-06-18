import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_sfu/views/privatInfoView.dart';


import 'views/initialView.dart';


void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      routes: <String, WidgetBuilder> {
        '/privateInfo': (BuildContext context) => profieViewSudents(),
        '/': (BuildContext context) => initialView()

      },
    );
  }
}