import 'package:covid19_app/screens/start_screen/start_screen.dart';
import 'package:covid19_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID19',
      theme: theme(),
      home: StartScreen(),
    );
  }
}