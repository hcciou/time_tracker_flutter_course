//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({this.auth});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print('登出失敗。Error code: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: _signOut,
            child: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
