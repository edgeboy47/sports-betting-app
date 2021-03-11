import 'package:flutter/material.dart';
import 'package:sports_betting_app/screens/screen2.dart';
import 'screens/screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Betting App',
      theme: ThemeData(
        fontFamily: 'Averta',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          body: PageView(
            children: [
              Screen1(),
              const Screen2(),
            ],
          ),
        ),
      ),
    );
  }
}
