import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sign_in.dart';
import 'package:timetrackerfluttercourse/app/home_page.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        stream: auth.authStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignIn(
                auth: auth,
              );
            }
            return HomePage(
              auth: auth,
            );
          } else {
            print('第一次執行，沒有 snapshot');
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
