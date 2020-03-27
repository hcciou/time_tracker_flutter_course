import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/app/sign_in/validators.dart';
import 'package:timetrackerfluttercourse/common_widgets/form_submit_button.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

enum EmailSignInFromState {
  signIn,
  register,
}

class EmailSignInFrom extends StatefulWidget with EmailAndPasswordValidators {
  EmailSignInFrom({this.auth});
  final AuthBase auth;

  @override
  _EmailSignInFromState createState() => _EmailSignInFromState();
}

class _EmailSignInFromState extends State<EmailSignInFrom> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => emailController.text;
  String get _password => passwordController.text;
  EmailSignInFromState _formType = EmailSignInFromState.signIn;

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _submit() async {
    if (_password.isEmpty && _email.isEmpty) {
      return null;
    }

    try {
      if (_formType == EmailSignInFromState.signIn) {
        await widget.auth.signInWithEmail(email: _email, password: _password);
      } else {
        await widget.auth.registerWithEmail(email: _email, password: _password);
      }
      // 因為 emailSignIn 是利用 Navigator 叫進來的，pop 回 signIn 頁面前
      // 就被 landingPage 的 stream builder 劫持走了
      Navigator.of(context).pop();
//      Navigator.of(context).push(
//        MaterialPageRoute(
//          builder: (context) => HomePage(),
//        ),
//      );
    } catch (e) {
      print('email 登入失敗。error code = $e');
    }
  }

  void _toggleSubmitButton() {
    print('email= $_email, pw = $_password');
    setState(() {});
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

    // 零零得零
    final bool submitEnabled = widget.emailValidator.isValid(values: _email) &&
        widget.passwordValidator.isValid(values: _password);

    List<Widget> _buildChildren = [
      _buildEmailTextField(),
      SizedBox(
        height: 8.0,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 8.0,
      ),
      FormSubmitButton(
        text: submitButtonLabel,
        onPressed: submitEnabled ? _submit : null,
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

  TextField _buildPasswordTextField() {
    bool passwordValid = widget.passwordValidator.isValid(values: _password);
    return TextField(
      controller: passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: passwordValid ? null : widget.inValidPasswordErrorText,
      ),
      obscureText: true,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      // 追焦(focus node) 下一步
      onEditingComplete: _submit,
      onChanged: (value) => _toggleSubmitButton(),
//        keyboardType: TextInputType.visiblePassword,
    );
  }

  TextField _buildEmailTextField() {
    bool emailValid = widget.emailValidator.isValid(values: _email);
    return TextField(
      controller: emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'xxx@xxx.com',
        errorText: emailValid ? null : widget.inValidEmailErrorText,
      ),
      autofocus: true,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      // 追焦(focus node) 下一步
      onEditingComplete: _emailEditingComplete,
      onChanged: (value) => _toggleSubmitButton(),
    );
  }
}
