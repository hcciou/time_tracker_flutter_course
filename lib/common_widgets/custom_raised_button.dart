import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton(
      {this.color, this.borderRadius = 4.0, this.tapMethod, this.child});

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback tapMethod;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        onPressed: tapMethod,
      ),
    );
  }
}
