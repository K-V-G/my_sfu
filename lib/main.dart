import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_sfu/privatInfoView.dart';
import 'package:my_sfu/windowView.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: windowView(),
      routes: <String, WidgetBuilder> {
        '/privateInfo': (BuildContext context) => profieViewSudents()
      },
    );
  }
}