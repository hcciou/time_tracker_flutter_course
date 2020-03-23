import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sign_in.dart';
import 'package:timetrackerfluttercourse/app/home_page.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({this.auth});
  final AuthBase auth;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  Future<void> _checkCurrentUser() async {
    User user = await widget.auth.checkCurrentUser();
    _updateUser(user);
  }

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignIn(
        onSignIn: _updateUser, // callback
        auth: widget.auth,
      );
    }
    return HomePage(
      signOut: () => _updateUser(null),
      auth: widget.auth,
    );
  }
}
