import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/email_sign_in_page.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sing_in_button.dart';
import 'package:timetrackerfluttercourse/app/sign_in/social_sign_in_button.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class SignIn extends StatelessWidget {
  const SignIn({this.auth});
  final AuthBase auth;

  Future<void> _signInFacebook() async {
    try {
      auth.signInWithFacebook();
    } catch (e) {
      print('嗚嗚，Facebook 連線有錯誤喔。Error code: ${e.toString()}');
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print('嗚嗚，Goolge 連線有錯誤喔。Error code: ${e.toString()}');
    }
  }

  Future<void> _signInAnonymous() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print('嗚嗚，匿名連線有錯誤喔。Error code: ${e.toString()}');
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmailSignInPage(
          auth: auth,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContainer(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContainer(BuildContext context) {
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
            onProcess: _signInWithGoogle,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            labelName: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onProcess: _signInFacebook,
          ),
          SizedBox(
            height: 8.0,
          ),
          SingInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onProcess: () => _signInWithEmail(context),
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
