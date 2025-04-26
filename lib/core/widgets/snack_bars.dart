import 'package:flutter/material.dart';

class SnackBars {
  static errorSnack({required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
        snackBarAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 500),
        ),
        SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
            content: Text(textDirection: TextDirection.ltr, msg)));
  }

  static successSnack({required BuildContext context, required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
        snackBarAnimationStyle: AnimationStyle(
          duration: Duration(milliseconds: 500),
        ),
        SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
            content: Text(textDirection: TextDirection.ltr, msg)));
  }
}
