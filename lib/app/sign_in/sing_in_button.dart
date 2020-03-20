import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetrackerfluttercourse/common_widgets/custom_raised_button.dart';

class SingInButton extends CustomRaisedButton {
  SingInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor: Colors.black87,
    VoidCallback onProcess,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 15.0,
                ),
              ),
              Opacity(
                opacity: 0,
                child: Image.asset(assetName),
              ),
            ],
          ),
          color: color,
          borderRadius: 2.0,
          tapMethod: onProcess,
        );
}
