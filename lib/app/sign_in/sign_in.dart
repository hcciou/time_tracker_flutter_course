import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sing_in_button.dart';
import 'package:timetrackerfluttercourse/app/sign_in/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({this.onSignIn});
  final Function(FirebaseUser) onSignIn;

  void _signInAnonymous() async {
    try {
      final AuthResult signInAnonymously =
          await FirebaseAuth.instance.signInAnonymously();
      onSignIn(signInAnonymously.user);
    } catch (e) {
      print('嗚嗚，匿名連線有錯誤喔。Error code: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            labelName: 'Sign in with Google',
            color: Colors.white,
            onProcess: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            labelName: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onProcess: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SingInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onProcess: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SingInButton(
            text: 'Go anonymous',
            color: Colors.lime[300],
            onProcess: _signInAnonymous,
          ),
        ],
      ),
    );
  }
}
