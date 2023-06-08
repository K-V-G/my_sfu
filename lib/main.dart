import 'package:flutter/material.dart';
import 'package:my_sfu/initialView.dart';
import 'package:my_sfu/privatInfoView.dart';
import 'package:my_sfu/profileView.dart';
import 'package:my_sfu/windowView.dart';

import 'zachetkaView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        '/privateInfo': (BuildContext context) => profieViewSudents(),
        '/window': (BuildContext context) => windowView()
      },
    );
  }
}