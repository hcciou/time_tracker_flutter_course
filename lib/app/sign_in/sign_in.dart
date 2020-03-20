import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/sing_in_button.dart';

class SignIn extends StatelessWidget {
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
          SingInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            color: Colors.white,
            onProcess: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SingInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with FaceBook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onProcess: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SingInButton(
            assetName: 'images/facebook-logo.png',
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
            assetName: 'images/facebook-logo.png',
            text: 'Go anonymous',
            color: Colors.lime[300],
            onProcess: () {},
          ),
        ],
      ),
    );
  }
}
