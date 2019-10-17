import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        child: Center(child: CircularProgressIndicator(),),
      )
    );
  }
}