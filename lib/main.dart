import 'package:flutter/material.dart';
import './home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        textTheme: TextTheme(
            display1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
      ),
      home: Home(),
    );
  }
}
