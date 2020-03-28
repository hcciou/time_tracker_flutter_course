import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/email_sign_in_form.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(child: _buildContent()),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: EmailSignInFrom(auth: auth),
      ),
    );
  }
}
