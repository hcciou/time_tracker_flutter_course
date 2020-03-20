import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurple),
      darkTheme: ThemeData.dark(),
      home: SignIn(),
    );
  }
}
