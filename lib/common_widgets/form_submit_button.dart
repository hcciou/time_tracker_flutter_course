import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/common_widgets/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          tapMethod: onPressed,
          color: Colors.deepPurple,
        );
}
