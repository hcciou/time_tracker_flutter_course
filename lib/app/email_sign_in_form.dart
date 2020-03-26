import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/common_widgets/form_submit_button.dart';

enum EmailSignInFromState {
  signIn,
  register,
}

class EmailSignInFrom extends StatefulWidget {
  @override
  _EmailSignInFromState createState() => _EmailSignInFromState();
}

class _EmailSignInFromState extends State<EmailSignInFrom> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  EmailSignInFromState _formType = EmailSignInFromState.signIn;

  void _submit() {
    print('email = ${emailController.text}, pw = ${passwordController.text}');
  }

  void _toggleFormStatus() {
    setState(() {
      _formType = _formType == EmailSignInFromState.signIn
          ? EmailSignInFromState.register
          : EmailSignInFromState.signIn;
      emailController.clear();
      passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final String submitButtonLabel =
        _formType == EmailSignInFromState.signIn ? '登入' : '註冊';
    final String registerButtonLabel =
        _formType == EmailSignInFromState.signIn ? '沒有帳號，這邊註冊。' : '已有帳號，這邊登入。';

    List<Widget> _buildChildren = [
      TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'xxx@xxx.com',
        ),
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
      ),
      SizedBox(
        height: 8.0,
      ),
      TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      ),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(
        text: submitButtonLabel,
        onPressed: _submit,
      ),
      FlatButton(
        onPressed: _toggleFormStatus,
        child: Text(registerButtonLabel),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren,
      ),
    );
  }
}
