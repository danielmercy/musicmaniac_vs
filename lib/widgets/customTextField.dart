import 'package:flutter/material.dart';
import 'package:musicmaniac/resources/text_styles.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      this.hint,
      this.obsecure = false,
      this.validator,
      this.onSaved,
      this.controller,
      this.autovalidate,
      this.autofocus,
      this.textInputType});
  final FormFieldSetter<String> onSaved;
  final dynamic icon;
  final String hint;
  final bool obsecure;
  final bool autovalidate;
  final bool autofocus;
  final TextEditingController controller;
  final TextInputType textInputType;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      validator: validator,
      autovalidate: autovalidate ?? true,
      autofocus: autofocus ?? false,
      obscureText: obsecure,
      style: formInputStyle,
      keyboardType: textInputType,
      decoration: InputDecoration(
          isDense: true,
          hintStyle: formInputHintStyle,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(.3),
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3,
            ),
          ),
          prefixIcon: icon is IconButton ? icon : IconTheme(
            data: IconThemeData(color: Theme.of(context).primaryColor),
            child: icon,
          )
          ),
    );
  }
}