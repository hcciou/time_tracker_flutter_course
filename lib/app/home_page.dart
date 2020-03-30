import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/common_widgets/platform_alert_dialog.dart';
import 'package:timetrackerfluttercourse/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({this.auth});
  final AuthBase auth;

  Future<void> _signOut(BuildContext context) async {
    try {
      await auth.signOut();
      _confirmSignOut(context);
    } catch (e) {
      print('登出失敗。Error code: ${e.toString()}');
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: '登出',
      content: '你確定要登出嗎',
      cancelActionText: 'NO',
      defaultActionText: 'YES',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
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
            onPressed: () => _signOut(context),
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
