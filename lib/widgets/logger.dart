import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:musicmaniac/resources/colors.dart';

class Logger {
  
  static error({@required String code, BuildContext context}) {
    switch (code) {
      case 'ERROR_WRONG_PASSWORD':
        Flushbar(
          message: 'Password is incorrect',
          backgroundColor: MyTheme.accent,
          icon: Icon(
            Icons.error_outline,
            size: 28,
            color: Colors.red,
          ),
          duration: Duration(seconds: 10),
        )..show(context);
        break;
      case 'ERROR_USER_NOT_FOUND':
        Flushbar(
          message: 'User not found',
          backgroundColor: MyTheme.accent,
          icon: Icon(
            Icons.error_outline,
            size: 28,
            color: Colors.red,
          ),
          duration: Duration(seconds: 10),
        )..show(context);
        break;
      case 'ERROR_INVALID_EMAIL':
        Flushbar(
          message: 'Email is incorrect',
          backgroundColor: MyTheme.accent,
          icon: Icon(
            Icons.error_outline,
            size: 28,
            color: Colors.red,
          ),
          duration: Duration(seconds: 10),
        )..show(context);
        break;
      default:
    }
  }
}