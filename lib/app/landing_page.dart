import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sign_in.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseUser _user;
  AuthResult _auth;

  void updateUser(FirebaseUser user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignIn(
        onSignIn: updateUser, // callback
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
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
