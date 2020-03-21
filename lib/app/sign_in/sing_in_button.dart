import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/common_widgets/custom_raised_button.dart';

class SingInButton extends CustomRaisedButton {
  SingInButton({
    @required String text,
    Color color,
    Color textColor: Colors.black87,
    VoidCallback onProcess,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18.0,
            ),
          ),
          color: color,
          borderRadius: 2.0,
          tapMethod: onProcess,
        );
}
