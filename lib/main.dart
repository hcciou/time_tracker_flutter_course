import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurple),
      darkTheme: ThemeData.dark(),
      home: LandingPage(),
    );
  }
}
