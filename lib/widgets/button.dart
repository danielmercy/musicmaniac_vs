import 'package:flutter/material.dart';
import 'package:musicmaniac/resources/colors.dart';
import 'package:musicmaniac/resources/text_styles.dart';

class ButtonWidget extends StatelessWidget {

  final String text;
  final String color;
  final Function onPressed;
  final String mode;
  final double width;
  final bool disabled;
  final bool isLoading;

  ButtonWidget({
    this.text,
    this.color,
    this.mode,
    this.onPressed,
    this.width,
    this.disabled,
    this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    double _width =  double.infinity;
    bool _disabled = disabled ?? false;
    bool _isLoading = isLoading ?? false;
    final BorderRadius buttonRadius = BorderRadius.circular(50);
    if(mode == ButtonStyles.GRADIENT) {
      return Container(
        width: width ?? _width,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: buttonRadius,
          gradient: !_disabled ? LinearGradient(
            colors: color == ButtonStyles.PRIMARY ? 
            <Color>[Colors.purple[400], MyTheme.primary] : 
            (color == ButtonStyles.ACCENT ? <Color>[MyTheme.accent, Colors.blue[800]] : <Color>[MyTheme.secondary, Colors.yellow[800]])
          ) : null,
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: buttonRadius
          ),
          child: InkWell(
            enableFeedback: !_disabled,
            onTap: !_disabled ? onPressed : null,
            borderRadius: buttonRadius,
            child: Center(
              child: Text(text, style: buttonTextStyle),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: width ?? _width,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: buttonRadius,
          color: !_disabled ? (color == ButtonStyles.PRIMARY ? MyTheme.primary : 
            (color == ButtonStyles.ACCENT ? MyTheme.accent : MyTheme.secondary)) : Colors.grey
        ),
        child: Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: buttonRadius
          ),
          child: InkWell(
            enableFeedback: !_disabled,
            onTap: !_disabled ? onPressed : null,
            borderRadius: buttonRadius,
            child: Center(
              child: !_disabled && !_isLoading ? Text(text, style: !_disabled ? buttonTextStyle : buttonTextStyle.copyWith(color: Colors.white12) ) : CircularProgressIndicator(),
            ),
          ),
        ),
      );
    }
  }
}

class ButtonStyles {
  static const PRIMARY = 'PRIMARY';
  static const ACCENT = 'ACCENT';
  static const SECONDARY = 'SECONDARY';

  static const FLAT = "FLAT";
  static const GRADIENT = "GRADIENT";
}
